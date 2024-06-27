import Jimp from "jimp";
import fs from 'fs';

interface RGBA {
    r: number;
    g: number;
    b: number;
    a: number;
}


let imagePath = "output.png";

Jimp.read(imagePath)
    .then((image) => {
        let encodedBytes: number[] = [];
        let stringLength: number = 0;
        image.scan(0, 0, image.bitmap.width, image.bitmap.height, (x, y, idx) => {
            let index = x + y * image.bitmap.width;
            let hexPixel = image.getPixelColor(x, y);
            let RGBAPixel = Jimp.intToRGBA(hexPixel);
            if (index < 4) {
                stringLength = getDecodedStringLength(RGBAPixel, stringLength);
            } else if (index < stringLength)
                encodedBytes.push(decodePixelIntoByte(RGBAPixel));
        })

        fs.writeFile('minecraft.html', decodeString(encodedBytes), (err) => {
            if (err) throw err;
            console.log('The file has been saved!');
        });
    });


function getDecodedStringLength(RGBAPixel: RGBA, stringLength: number) {
    return (stringLength << 8) | decodePixelIntoByte(RGBAPixel);
}

function decodePixelIntoByte(RGBAPixel: RGBA) {
    return (decode2BitsFromColor(RGBAPixel.r) << 6)
        | (decode2BitsFromColor(RGBAPixel.g) << 4)
        | (decode2BitsFromColor(RGBAPixel.b) << 2)
        | (decode2BitsFromColor(RGBAPixel.a));
}

function decode2BitsFromColor(color: number) {
    return color & 0b0000_0011;
}



function decodeString(encodedBytes: number[]) {
    let textDecoder = new TextDecoder;
    return textDecoder.decode(new Uint8Array(encodedBytes))
}

import { env } from "bun";
import Jimp from "jimp";

const imagePath = "./output.png";

Jimp.read(imagePath).then((image) => {
    //repeat until no black or white pixel is left
    while (true) {
        let isBlackOrWhiteLeft = false;
        image.scan(0, 0, image.bitmap.width, image.bitmap.height, function (x, y) {
            if (this.getPixelColor(x, y) === 0x000000FF || this.getPixelColor(x, y) === 0xFFFFFFFF) {
                isBlackOrWhiteLeft = true;
            }
        });
        if (!isBlackOrWhiteLeft) {
            break;
        }
        denoise(image);
    }
    image.write("denoised_output.png");
});

function denoise(image: Jimp) {
    image.scan(0, 0, image.bitmap.width, image.bitmap.height, function (x, y) {

        const isBlackOrWhite = (x: number, y: number) => {
            return this.getPixelColor(x, y) === 0x000000FF || this.getPixelColor(x, y) === 0xFFFFFFFF;
        }

        if (isBlackOrWhite(x, y)) {
            let list = [];

            for (let i = -1; i <= 1; i++) {
                for (let j = -1; j <= 1; j++) {
                    if (!isBlackOrWhite(x + i, y + j)) {
                        list.push(this.getPixelColor(x + i, y + j));
                    }
                }
            }
            if (list.length > 0)
                this.setPixelColor(averageHexColor(list), x, y);
        }
    });
}

function averageHexColor(hexColorList: number[]) {
    let listAsRGB = hexColorList.map((color) => {
        return Jimp.intToRGBA(color);
    });

    let totalColor = listAsRGB.reduce((prev, curr) => {
        return {
            r: prev.r + curr.r,
            g: prev.g + curr.g,
            b: prev.b + curr.b,
            a: prev.a + curr.a,
        };
    });

    let averageColor = {
        r: Math.round(totalColor.r / hexColorList.length),
        g: Math.round(totalColor.g / hexColorList.length),
        b: Math.round(totalColor.b / hexColorList.length),
        a: Math.round(totalColor.a / hexColorList.length),
    };

    return Jimp.rgbaToInt(averageColor.r, averageColor.g, averageColor.b, averageColor.a);
}

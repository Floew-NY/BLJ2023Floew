import { env } from "bun";
import Jimp from "jimp";

const imagePath = env.IMAGE_PATH || "input.png";
const noiseLevel = 0.2;
Jimp.read(imagePath).then((image) => {
    image
        .scan(0, 0, image.bitmap.width, image.bitmap.height, function (x, y, idx) {
            if (Math.random() > noiseLevel) {
                if (Math.round(Math.random())) {
                    this.setPixelColor(0xFFFFFFFF, x, y);

                } else {
                    this.setPixelColor(0x000000FF, x, y);
                }
            }

        })
        .write("output.png");
});

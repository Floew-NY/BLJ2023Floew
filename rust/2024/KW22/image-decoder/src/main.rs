use image::{Rgba, RgbaImage};
use std::fs;

fn get_decoded_string_length(rgba_pixel: &Rgba<u8>, string_length: usize) -> usize {
    (string_length << 8) | (decode_pixel_into_byte(rgba_pixel) as usize)
}

fn decode_pixel_into_byte(rgba_pixel: &Rgba<u8>) -> u8 {
    (decode_2_bits_from_color(rgba_pixel[0]) << 6)
        | (decode_2_bits_from_color(rgba_pixel[1]) << 4)
        | (decode_2_bits_from_color(rgba_pixel[2]) << 2)
        | decode_2_bits_from_color(rgba_pixel[3])
}

fn decode_2_bits_from_color(color: u8) -> u8 {
    color & 0b0000_0011
}

fn decode_string(encoded_bytes: &[u8]) -> String {
    String::from_utf8_lossy(encoded_bytes).to_string()
}

fn main() {
    let image_path = "output.png";
    let image = image::open(image_path).unwrap();
    let (width, height) = image.dimensions();

    let mut encoded_bytes = Vec::new();
    let mut string_length = 0;

    for y in 0..height {
        for x in 0..width {
            let index = x + y * width;
            let rgba_pixel = image.get_pixel(x, y);

            if index < 4 {
                string_length = get_decoded_string_length(rgba_pixel, string_length);
            } else if index < string_length {
                encoded_bytes.push(decode_pixel_into_byte(rgba_pixel));
            }
        }
    }

    fs::write("minecraft.html", decode_string(&encoded_bytes)).unwrap();
    println!("The file has been saved!");
}

import * as fs from 'fs';

// Read the PDF content
const pdfContent = fs.readFileSync('embedded_data.pdf', 'utf-8');

// Extract the base64 encoded data from the comment
const base64DataMatch = pdfContent.match(/% (.+)/);
if (!base64DataMatch) {
    throw new Error('No embedded data found in the PDF file.');
}
const base64Data = base64DataMatch[1];

// Convert the base64 string back to binary data
const binData = Buffer.from(base64Data, 'base64');

// Write the binary data to a new .bin file
fs.writeFileSync('extracted_data.bin', binData);

console.log('Binary data extracted and written to extracted_data.bin successfully.');

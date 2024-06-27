import fs from 'fs';

// Read the binary data from the .bin file
const binData = fs.readFileSync('./data.bin');

// Convert binary data to a base64 string to ensure it can be safely embedded in the PDF
const base64Data = binData.toString('base64');

// Create a comment with the base64 encoded data
const comment = `% ${base64Data}\n`;

// Create the PDF content with the embedded data
const pdfContent = `%PDF-1.4
${comment}
1 0 obj
<< /Type /Catalog /Pages 2 0 R >>
endobj
2 0 obj
<< /Type /Pages /Kids [3 0 R] /Count 1 >>
endobj
3 0 obj
<< /Type /Page /Parent 2 0 R /MediaBox [0 0 612 792] /Contents 4 0 R /Resources << /Font << /F1 5 0 R >> >> >>
endobj
4 0 obj
<< /Length 44 >>
stream
BT
/F1 24 Tf
100 700 Td
(Hello, World!) Tj
ET
endstream
endobj
5 0 obj
<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica >>
endobj
xref
0 6
0000000000 65535 f 
0000000010 00000 n 
0000000053 00000 n 
0000000100 00000 n 
0000000173 00000 n 
0000000237 00000 n 
trailer
<< /Size 6 /Root 1 0 R >>
startxref
292
%%EOF
`;

// Write the PDF content to a file
fs.writeFileSync('embedded_data.pdf', pdfContent);

console.log('PDF file with embedded data created successfully.');

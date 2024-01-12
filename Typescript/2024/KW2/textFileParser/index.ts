import { writer } from "repl";
import {
  textToWordArray as filterToWords,
  textToWordArray,
  wordList as wordsToList,
} from "./utils";
import { url } from "inspector";
// User Input
const fileLocation = Bun.argv[2];
const outputLocation = Bun.argv[3];

// File Handling
const file = Bun.file(fileLocation);
const text = await file.text();

const outputfile = Bun.file(outputLocation);
const output = outputfile.writer();

// Text Parsing
const wordArray = textToWordArray(text);

// Default Info
const currentTime = new Date().toLocaleString();

// Output Data
const wordCount = wordArray.length;
const wordList = wordsToList(wordArray);
const uniqueWordCount = wordList.length;
const mostCommonWord = wordList[0][0];

// Writing File
output.write(`Time: ${currentTime}\n`);
output.write(`File: ${file.name}\n`);
output.write(`--------------------------------------------\n`);
output.write(`Number of words:  ${wordCount}\n`);
output.write(`Number of unique words: ${uniqueWordCount}\n`);
output.write(`Most common word: ${mostCommonWord}\n`);
output.write(`--------------------------------------------\n`);
output.flush;
output.write(
  `All words\nWord  Count\n${wordList
    .map((element) => `${element[0]}:  ${element[1]}\n`)
    .join("")}`
);

// Complete File
output.end();

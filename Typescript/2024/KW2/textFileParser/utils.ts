export const textToWordArray = (text: string) => {
  let lowerCaseText = text.toLowerCase();
  let singleLineText = lowerCaseText.replaceAll("\n", " ");
  let wordArray = singleLineText
    .split("")
    .filter((char) => /[a-zA-Z0-9 ]/.test(char))
    .join("")
    .split(" ")
    .filter((word) => word);
  return wordArray;
};

export const wordList = (wordArray: string[]) => {
  let wordsObject = wordArray.reduce<Record<string, number>>(
    (resultingObject, word) => {
      return {
        ...resultingObject,
        [word]: resultingObject[word] ? resultingObject[word] + 1 : 1,
      };
    },
    {}
  );
  let sortedArray = Object.entries(wordsObject).sort((a, b) => b[1] - a[1]);
  return sortedArray;
};

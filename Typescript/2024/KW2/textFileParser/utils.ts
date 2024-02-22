export const textToWordArray = (text: string) => {
  let wordArray = text
    .toLowerCase()
    .replaceAll("\n", " ")
    .replaceAll(/[^a-z0-9 ]/g, "")
    .split(" ")
    .filter((word) => word.trim());
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

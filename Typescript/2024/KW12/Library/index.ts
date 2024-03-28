class Medium {
  name: string;
  publisher: string;
  copyRightHolder: string;

  constructor({ name, publisher, copyRightHolder }: Medium) {
    this.name = name;
    this.publisher = publisher;
    this.copyRightHolder = copyRightHolder;
  }
}

class Book extends Medium {
  pages: number;
  constructor({ name, publisher, copyRightHolder, pages }: Book) {
    super({ name, publisher, copyRightHolder });
    this.pages = pages;
  }
}

class Movie extends Medium {
  duration: number;
  mainCharacter: string;
  constructor({
    name,
    publisher,
    copyRightHolder,
    duration,
    mainCharacter,
  }: Movie) {
    super({ name, publisher, copyRightHolder });
    this.duration = duration;
    this.mainCharacter = mainCharacter;
  }
}

class VideoGame extends Medium {
  size: number;
  developer: string;
  genre: string;
  constructor({
    name,
    publisher,
    copyRightHolder,
    size,
    developer,
    genre,
  }: VideoGame) {
    super({ name, publisher, copyRightHolder });
    this.size = size;
    this.developer = developer;
    this.genre = genre;
  }
}



let mediumList: Medium[] = [];

mediumList.push({name: 'The Hobbit', publisher: 'George Allen & Unwin', copyRightHolder: 'J.R.R. Tolkien', pages: 310} as Book);
mediumList.push({name: 'The Lord of the Rings', publisher: 'George Allen & Unwin', copyRightHolder: 'J.R.R. Tolkien', pages: 1500} as Book);
mediumList.push({name: 'The Shawshank Redemption', publisher: 'Columbia Pictures', copyRightHolder: 'Castle Rock Entertainment', duration: 142, mainCharacter: 'Andy Dufresne'} as Movie);
mediumList.push({name: 'The Dark Knight', publisher: 'Warner Bros. Pictures', copyRightHolder: 'DC Comics', duration: 152, mainCharacter: 'Batman'} as Movie);
mediumList.push({name: 'The Legend of Zelda: Breath of the Wild', publisher: 'Nintendo', copyRightHolder: 'Nintendo', size: 13, developer: 'Nintendo', genre: 'Action-adventure'} as VideoGame);
mediumList.push({name: 'Super Mario Odyssey', publisher: 'Nintendo', copyRightHolder: 'Nintendo', size: 5, developer: 'Nintendo', genre: 'Platformer'} as VideoGame);

console.log(mediumList);

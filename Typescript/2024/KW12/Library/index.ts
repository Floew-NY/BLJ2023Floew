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

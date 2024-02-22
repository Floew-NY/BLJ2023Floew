BEGIN;
CREATE SCHEMA steam;
SET search_path TO steam;
CREATE TABLE Category(
    category_id SERIAL PRIMARY KEY,
    name varchar(30)
);
CREATE TABLE Game(
    game_id SERIAL PRIMARY KEY,
    id_category integer,
    CONSTRAINT game_id_category_fkey FOREIGN KEY (id_category) REFERENCES Category(category_id)
);
CREATE TABLE Multiplayer(
    Multiplayer_id SERIAL PRIMARY KEY,
    variant VARCHAR(30)
);
CREATE TABLE MultiplayerGameType(
    id_Multiplayer integer,
    id_game integer,
    CONSTRAINT MultiplayerGameType_id_Multiplayer_fkey FOREIGN KEY (id_Multiplayer) REFERENCES Multiplayer(Multiplayer_id),
    CONSTRAINT MultiplayerGameType_id_game_fkey FOREIGN KEY (id_game) REFERENCES Game(game_id)
);
CREATE TABLE RelatedCategories(
    id_category integer,
    id_RelatedCategory integer,
    CONSTRAINT RelatedCategories_id_category_fkey FOREIGN KEY (id_category) REFERENCES Category(category_id),
    CONSTRAINT RelatedCategories_id_RelatedCategory_fkey FOREIGN KEY (id_RelatedCategory) REFERENCES Category(category_id)
);
COMMIT;
BEGIN;

CREATE SCHEMA migros;
CREATE TABLE migros.product(
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    price NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (name)
);

INSERT INTO migros.product (name, price)
VALUES ('Apple', 15);
INSERT INTO migros.product (name, description,price)
VALUES ('Grape', 'descriptiononateion', 20);
INSERT INTO migros.product (name, price)
VALUES ('Juice', 25);

CREATE TABLE migros.customer(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);

INSERT INTO migros.customer (name, email, address)
VALUES ('John', 'john@doe.com', '123 Main St');
INSERT INTO migros.customer (name, email, address)
VALUES ('Jane', 'jane@doe.com', '456 Main St');

SELECT * FROM migros.customer WHERE name = 'John';

SELECT description FROM migros.product WHERE name = 'Grape';
ROLLBACK;

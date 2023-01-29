CREATE TABLE CategoriesDishes(
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

INSERT INTO CategoriesDishes(Name)
VALUES ('Main dishes'), ('Salads'), ('Desserts');

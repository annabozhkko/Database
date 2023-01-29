CREATE TABLE TypesCredits(
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

INSERT INTO TypesCredits(Name)
VALUES ('Mortgage'), ('Consumer credit'), ('Commercial credit');

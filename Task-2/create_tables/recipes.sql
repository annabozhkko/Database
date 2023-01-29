CREATE TABLE Recipes(
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    NumberPersons INTEGER NOT NULL,
    IDCategory INTEGER NOT NULL REFERENCES categoriesdishes
);

INSERT INTO Recipes(Name, NumberPersons, IDCategory) VALUES
('Steak', '1', '1'),
('Carbonara', '3', '1'),
('Chicken soup', '5', '1'),
('Salad "Cesar"', '2', '2'),
('Russian salad', '7', '2'),
('Pancakes', '5', '3'),
('Apple pie', '3', '3');
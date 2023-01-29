CREATE TABLE Products(
     ID SERIAL PRIMARY KEY,
     Name VARCHAR(50) NOT NULL,
     Unit VARCHAR(50) NOT NULL,
     UnitPrice INTEGER NOT NULL,
     Calories INTEGER NOT NULL
);

INSERT INTO Products(Name, Unit, UnitPrice, Calories) VALUES
('Tomatoes', 'kg', '200', '30'),
('Chicken', 'kg', '300', '150'),
('Spaghetti', 'kg', '220', '340'),
('Bacon', 'kg', '400', '430'),
('Eggs', 'pcs', '10', '145'),
('Cheese', 'kg', '450', '320'),
('Bread', 'kg', '100', '285'),
('Lettuce', 'kg', '250', '15'),
('Flour', 'kg', '50', '330'),
('Milk', 'l', '700', '50'),
('Sugar', 'kg', '80', '400'),
('Potatoes', 'kg', '40', '70'),
('Spices', 'g', '1', '200'),
('Carrot', 'kg', '60', '40'),
('Meat', 'kg', '500', '170'),
('Sausage', 'kg', '300', '230'),
('Cucumbers', 'kg', '350', '30'),
('Apples', 'kg', '100', '50');

INSERT INTO Products(Name, Unit, UnitPrice, Calories)
VALUES('Fish', 'kg', '100', '100');
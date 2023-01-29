CREATE TABLE PaymentTypes(
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Commission INTEGER NOT NULL
);

INSERT INTO PaymentTypes(Name, Commission) VALUES
('Bank account', 0),
('Card', 0),
('Yandex.Money', 5),
('QIWI', 3)

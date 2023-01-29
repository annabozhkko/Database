CREATE TABLE Clients(
    ID SERIAL PRIMARY KEY,
    FullName VARCHAR(50) NOT NULL,
    PassportDetails VARCHAR(255) NOT NULL
);

INSERT INTO Clients (FullName, PassportDetails) VALUES
('Щеткина Валерия Викторовна', '4911 391177'),
('Гусева Катерина Арсеньевна', '4235 899107'),
('Енотин Алексей Михаилович', '4216 445229'),
('Камалова Маргарита Павловна', '4848 594330'),
('Гнездилов Петр Васильевич', '4787 729027'),
('Караваев Михаил Максимович', '4428 892928'),
('Строганова Светлана Ивановна', '4438 163036');
CREATE TABLE Employees (
    ID SERIAL PRIMARY KEY,
    FullName VARCHAR(50) NOT NULL,
    BossID INTEGER REFERENCES Employees
);

INSERT INTO Employees(FullName, BossID) VALUES
('Крупина Татьяна Леонидовна', NULL),
('Левченко Тимофей Алексеевич', 1),
('Трохина Кира Всеволодовна', 1),
('Игнатова Виктория Егоровна', 2),
('Фокин Леонид Тимофеевич', 2),
('Лобанов Филипп Евгениевич', 3),
('Иванов Сергей Петрович', NULL)
]
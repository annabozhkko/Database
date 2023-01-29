CREATE TABLE Scoring(
    ID SERIAL PRIMARY KEY,
    Client INTEGER NOT NULL REFERENCES Clients,
    Tariff INTEGER NOT NULL REFERENCES Tariffs ON DELETE RESTRICT,
    ApprovalStatus BOOLEAN NOT NULL
);

INSERT INTO Scoring(Client, Tariff, ApprovalStatus) VALUES
(1, 1, TRUE),
(1, 6, TRUE),
(1, 7, FALSE),
(2, 3, FALSE),
(2, 5, TRUE),
(4, 2, FALSE),
(4, 8, FALSE),
(5, 4, TRUE),
(6, 1, TRUE),
(7, 3, TRUE)

-- Datenbankerstellung
-- Keys (Schlüssel)
-- Primary Key (Hauptschlüssel)
-- Foreign Key (Fremdschlüssel)

-- Variante 1

CREATE TABLE Bestellungen
	( 
		BestellNr int identity(100, 1) PRIMARY KEY,
		KundenID int, -- FOREIGN KEY REFERENCES Kunden (KundenID),
		Test int
--		...
	)

CREATE TABLE Kunden
(
	KundenID int identity(100, 1) PRIMARY KEY, 
	Vorname varchar(50),
	Nachname varchar(50)
--  .........
)



INSERT INTO Kunde (Vorname, Nachname)
	VALUES('James', 'Bond')

-- DROP TABLE Kunde


-- Variante 2

-- ADD CONSTRAINT
--ALTER TABLE Kunde
--ADD CONSTRAINT PK_Kunde PRIMARY KEY (KundenID)

--ALTER TABLE Kunde
--DROP CONSTRAINT PK_Kunde


ALTER TABLE Bestellungen
ADD CONSTRAINT FK_Bestellungen_Kunden FOREIGN KEY (KundenID) REFERENCES Kunden(KundenID)

ALTER TABLE TestEmployees
ADD CONSTRAINT PK_TestEmployees PRIMARY KEY (EmployeeID)



-- Variante 3
CREATE TABLE Test
	(
		TestID int identity PRIMARY KEY,
		Testtext varchar(50),
		Testnumber int,
		EmployeeID int
--		...

		CONSTRAINT FK_Test_TestEmployees FOREIGN KEY (EmployeeID) REFERENCES TestEmployees (EmployeeID)
	)


-- Primary Key aus zwei Spalten

CREATE TABLE Test2 
	(
		TID int identity,
		ID2 int,
		Testtext varchar(50),
		Testnr int

		CONSTRAINT PK_Test2 PRIMARY KEY(TID, ID2)
	)
-- normalerweise kommen dann die beiden PKs als FKs von anderen Tabellen, also brauchen wir noch zwei FOREIGN-KEY-CONSTRAINTS



--SELECT ProductName
--FROM Products


-- Beispiel für SQL-Injection
-- youtube: https://www.youtube.com/watch?v=ciNHn38EyRc


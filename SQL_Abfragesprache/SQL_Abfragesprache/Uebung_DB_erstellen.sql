--Erstelle eine Mini-TestDB:
--Leser wollen sich Bücher ausleihen. Leser haben Name, Adresse, Telefonnummer. Bücher haben Titel, Autor, Erscheinungsdatum und ISBN.
--Wir müssen wissen, wann ein Buch ausgeliehen und wann es zurückgegeben wurde.

-- DROP DATABASE UserLibrary
CREATE DATABASE UserLibrary


USE UserLibrary

CREATE TABLE Customers
	(
		CustomerID int identity PRIMARY KEY,
		FirstName nvarchar(50),
		LastName nvarchar(50) NOT NULL,
		CustomerAddress nvarchar(50),
		PostalCode varchar(10),
		City varchar(50),
		Country varchar(50),
		Phone nvarchar(25)
	)

CREATE TABLE Books
	(
		BookID int identity PRIMARY KEY,
		Title nvarchar(100) NOT NULL,
		AuthorFirstName nvarchar(100),
		AuthorLastName nvarchar(100),
		PublicationDate date,
		ISBN varchar(50)
	)

CREATE TABLE BorrowDetails
	(
		CustomerID int,
		BookID int,
		xy date,
		st date

		CONSTRAINT PK_BorrowDetails PRIMARY KEY (CustomerID, BookID),
		CONSTRAINT FK_BorrowDetails_Customers FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
		CONSTRAINT FK_BorrowDetails_Books FOREIGN KEY (BookID) REFERENCES Books (BookID)
	)


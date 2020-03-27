-- einfache Tabellenabfragen

-- immer überprüfen, ob wir in der richtigen DB sind!

USE Northwind

-- Syntax:
/*
	SELECT	  Spaltenname
			, Spaltenname
			, ...
	FROM Tabellenname

*/


SELECT * -- alle Spalten
FROM Customers  -- aus der Tabelle Customers


-- normalerweise jede gewünschte Spalte hinschreiben, nicht mit * arbeiten

-- Spalte CompanyName aus Customers Tabelle ausgeben (ALLE Kundennamen)
SELECT CompanyName
FROM Customers


-- SELECT 'Test', 100, ...


SELECT	  CompanyName
		, CustomerID
		, Address
FROM Customers



-- Alias vergeben wird leichter, wenn alles untereinander steht
SELECT	  CompanyName AS Firmenname
		, CustomerID
		, Address AS Adresse
FROM Customers

-- AS darf weggelassen werden; Empfehlung: trotzdem hinschreiben!!
--SELECT	  CompanyName Firmenname
--		, CustomerID
--		, Address Adresse
--FROM Customers



/*
Gib KundenID, Firmenname, Kontaktperson und Telefonnummer aller Kunden aus.
*/

SELECT	  CustomerID AS KundenID
		, CompanyName AS Firmenname
		, ContactName AS Kontaktperson
		, Phone AS Telefonnummer
FROM Customers

/*
Gib die ProduktID, den Produktnamen und den Stückpreis aus.

*/

SELECT	  ProductID AS ProduktID
		, ProductName AS Produktname
		, UnitPrice AS Stückpreis
FROM Products

/*
Gib die Nettofrachtkosten, Bruttofrachtkosten und die Mehrwertsteuer aus (Berechnung).

*/

SELECT	  Freight AS Nettofrachtkosten
		, Freight*1.19 AS Bruttofrachtkosten
		, Freight*0.19 AS MwSt
FROM Orders
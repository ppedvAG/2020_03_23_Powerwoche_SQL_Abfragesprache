-- WHERE clause, WHERE Klausel, WHERE Bedingung

/*

	WHERE Operatoren

	=, <, >, <=, >=
	!=, <>  -- darf NICHT diesem Wert entsprechen
	LIKE, IN, BETWEEN


	-- nicht so gut für Performance:
	NOT IN, NOT LIKE, NOT BETWEEN


	AND, OR

	IS, IS NOT

*/


SELECT *
FROM Customers
WHERE Country = 'Germany'



SELECT	  CustomerID
		, CompanyName
		, Country
FROM Customers
WHERE Country = 'Germany'



-- bei NULL: keine mathematische Operation möglich!! IS NULL oder IS NOT NULL
SELECT	  DATEDIFF(dd, RequiredDate, ShippedDate) AS Lieferverzögerung
FROM Orders
WHERE DATEDIFF(dd, RequiredDate, ShippedDate) IS NOT NULL


-- alle Kunden, die in Deutschland in Berlin wohnen

SELECT	  CustomerID
		, CompanyName
		, Country
		, City
FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin'

-- alle Bestellungen, wo Frachtkosten kleiner als 76
SELECT	  OrderID
		, Freight
--		,...
FROM Orders
WHERE Freight < 76

-- wo Frachtkosten NICHT einem bestimmten Wert entsprechen
SELECT	  OrderID
		, Freight
--		,...
FROM Orders
WHERE Freight != 148.33


-- in einer bestimmten Reihenfolge ausgeben:
SELECT	  OrderID
		, Freight
--		,...
FROM Orders
WHERE Freight < 76
ORDER BY Freight


SELECT	  OrderID
		, Freight
--		,...
FROM Orders
WHERE Freight < 76
ORDER BY Freight ASC -- ascending, aufsteigend vom kleinsten zum größten Wert (Default)



SELECT	  OrderID
		, Freight
--		,...
FROM Orders
WHERE Freight < 76
ORDER BY Freight DESC -- descending, absteigend vom größten zum kleinsten Wert


--Gib nur die Kunden aus, die in Frankreich ansässig sind.

SELECT	  *
FROM Customers
WHERE Country = 'France'


-- Gib alle Kunden aus, die in Buenos Aires in Argentinien ansässig sind.
SELECT *
FROM Customers
WHERE Country = 'Argentina' AND City = 'Buenos Aires'


-- Gib alle portugiesischen und spanischen Kunden aus.
SELECT *
FROM Customers
WHERE Country = 'Spain' OR Country = 'Portugal'


-- Gib alle Produkte aus, von denen mehr als 100 vorhanden sind.
SELECT *
FROM Products
WHERE UnitsInStock > 100


-- ********************** BETWEEN, IN ***************************

SELECT Freight
FROM Orders
WHERE Freight >= 100 AND Freight <= 200

-- Oder so:
SELECT Freight
FROM Orders
WHERE Freight BETWEEN 100 AND 200 -- wie oben, 100 und 200 inklusive


-- alle Bestellungen, die vom Employee 3, 4 und 7 bearbeitet worden sind
SELECT *
FROM Orders
WHERE EmployeeID = 3 OR EmployeeID = 4 OR EmployeeID = 7

-- oder so:
SELECT *
FROM Orders
WHERE EmployeeID IN(3, 4, 7)


-- Gib alle Produkte aus, deren ProduktID zwischen 10 und 15 (inklusive) liegt.
SELECT *
FROM Products
WHERE ProductID BETWEEN 10 AND 15


-- Gib alle Produkte aus, die vom Anbieter (SupplierID) 2, 7 oder 15 geliefert werden.
SELECT *
FROM Products
WHERE SupplierID IN(2, 7, 15)
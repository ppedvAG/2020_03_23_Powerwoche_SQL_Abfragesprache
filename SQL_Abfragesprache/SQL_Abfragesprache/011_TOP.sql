-- TOP Abfragen
-- ORDER BY unbedingt notwendig, um sicherzustellen, dass wir wirklich das rausbekommen, was wir wollen



SELECT *
FROM Customers


SELECT TOP 1 *
FROM Customers
-- ... Problem: Was genau ist die erste Zeile??


-- gleiches Ergebnis, aber schönere Variante:
SELECT TOP 1 *
FROM Customers
ORDER BY CustomerID


-- mehrere Zeilen abfragen:
SELECT TOP 3 *
FROM Customers
ORDER BY Country


-- mehrere Spalten auswählen + TOP:
SELECT TOP 1 CustomerID, CompanyName
FROM Customers
ORDER BY CustomerID


/*
	Syntax
	SELECT TOP # * | [Spaltenname, Spaltenname, ...]
	FROM Tabellenname
	WHERE Bedingung ...
	ORDER BY Spaltenname  -- !!!!!

*/


SELECT TOP 3 PERCENT *
FROM Customers
ORDER BY CustomerID


SELECT TOP 5 PERCENT CustomerID
					, CompanyName
					, ContactName
					, Phone
	--				, ...
FROM Customers
ORDER BY City -- SINN? aber auch möglich


SELECT TOP 7 PERCENT *
FROM Orders
ORDER BY Freight


SELECT TOP 7 PERCENT OrderID, CustomerID, ShipCountry, ShipCity, Freight
FROM Orders
ORDER BY Freight


-- die 10% mit den höchsten Frachtkosten?
SELECT TOP 10 PERCENT OrderID, CustomerID, ShipCountry, ShipCity, Freight
FROM Orders
ORDER BY Freight DESC


-- die letzten 3 Kunden in meiner Kundenliste?
SELECT TOP 3 CustomerID, CompanyName
FROM Customers
ORDER BY CustomerID DESC


-- Gib das teuerste Produkt aus.
SELECT TOP 1 *
FROM Products
ORDER BY UnitPrice DESC


-- Gib die drei Mitarbeiter, die als erste eingestellt wurden, aus (die schon am längsten beim Unternehmen sind).
SELECT TOP 3 EmployeeID, CONCAT(FirstName, ' ', LastName) AS FullName, HireDate
FROM Employees
ORDER BY HireDate



-- die 13 Kunden mit den geringsten Frachtkosten bekommen Bonus
-- wer sind die Glücklichen?

SELECT TOP 13
			OrderID
			, c.CustomerID
			, CompanyName
			, Address
			, Freight
FROM Orders o INNER JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY Freight


-- was, wenn der 14. den gleichen Wert hat?

SELECT TOP 13 WITH TIES
			OrderID
			, c.CustomerID
			, CompanyName
			, Address
			, Freight
FROM Orders o INNER JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY Freight


--Suche die Top 10% der Produkte mit den größten Verkaufsmengen (ProductName, Quantity).
--Einschließlich Produkte mit der gleichen Einkaufsmenge wie das letzte in der ursprünglichen Ausgabe.
SELECT TOP 10 PERCENT WITH TIES p.ProductName, od.Quantity
FROM Products p INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
ORDER BY Quantity DESC


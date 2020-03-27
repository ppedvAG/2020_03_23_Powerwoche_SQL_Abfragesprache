-- Aggregatfunktionen

-- COUNT, AVG, SUM, MIN, MAX


SELECT Country
FROM Customers
-- 91


SELECT DISTINCT Country
FROM Customers
-- 21


-- wieviele Produkte gibts insgesamt?
SELECT COUNT(ProductID) AS [Anzahl Produkte]
FROM Products

-- geht auch mit DISTINCT
SELECT COUNT(DISTINCT Country) AS Länderanzahl
FROM Customers


-- Durchschnittswerte berechnen:
SELECT AVG(Freight) AS [durchschnittliche Frachtkosten]
FROM Orders

SELECT Freight
FROM Orders


-- Minimal-/Maximalwert
SELECT MIN(Freight)
FROM Orders

SELECT MAX(Freight)
FROM Orders


-- Summe
SELECT SUM(Freight)
FROM Orders
-- 64942,69
-- Summe aller Frachtkosten von allen Bestellungen


-- Summe Frachtkosten PRO Kunde
SELECT SUM(Freight), CustomerID
FROM Orders
GROUP BY CustomerID


SELECT SUM(Freight), CustomerID, ShipCountry
FROM Orders
GROUP BY CustomerID, ShipCountry
ORDER BY CustomerID


-- wieviele Kunden haben wir insgesamt?
SELECT COUNT(CustomerID) AS Kundenanzahl
FROM Customers

--SELECT COUNT(*) AS Kundenanzahl
--FROM Customers


-- wieviele Kunden pro Land?
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country


-- wieviele Kunden pro Stadt im jeweiligen Land?
SELECT COUNT(CustomerID), Country, City
FROM Customers
GROUP BY Country, City



-- wie bekomme ich eine RechnungsSUMME?

SELECT	OrderID, SUM(UnitPrice) AS Rechnungssumme
FROM [Order Details]
GROUP BY OrderID
ORDER BY OrderID

-->
SELECT	OrderID, SUM(UnitPrice*Quantity) AS Rechnungssumme
FROM [Order Details]
GROUP BY OrderID
ORDER BY OrderID

-->
SELECT	OrderID, CAST(SUM(UnitPrice*Quantity-Discount) AS money) AS Rechnungssumme
FROM [Order Details]
GROUP BY OrderID
ORDER BY OrderID
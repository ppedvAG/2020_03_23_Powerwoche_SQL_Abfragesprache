-- WH 3

-- UNION


SELECT OrderID, ShipCountry AS Country
FROM Orders
UNION
SELECT EmployeeID, Country
FROM Employees
ORDER BY Country -- gilt f�r beide SELECT!!


SELECT OrderID, ShipCountry
FROM Orders
ORDER BY ShipCountry -- geht nicht!
UNION
SELECT EmployeeID, Country
FROM Employees
ORDER BY Country

-- auch mehrere
SELECT 1123
UNION
SELECT 7687
UNION
SELECT 9878
UNION
SELECT 123

-- implizite Konvertierung
SELECT '123' + 3 -- geht: 126
SELECT '123.5' + 3 -- geht nicht

SELECT 123 + 'Hallo' -- geht nicht


-- Aggregatfunktionen
-- min, max, avg, count, sum

SELECT AVG(Freight)
FROM Orders

-- GROUP BY hei�t avg Frachtkosten PRO Land
SELECT AVG(Freight), ShipCountry
FROM Orders
GROUP BY ShipCountry

-- ORDER BY hei�t: anordnen nach ... in der Textausgabe
SELECT AVG(Freight) AS [mittlere Frachtkosten], ShipCountry
FROM Orders
GROUP BY ShipCountry
ORDER BY ShipCountry

-- man kann auch mehrere Spalten haben, aber irgendwann machts keinen Sinn mehr
SELECT AVG(Freight) AS [mittlere Frachtkosten], ShipCountry, ShipCity
FROM Orders
GROUP BY ShipCountry, ShipCity
ORDER BY ShipCountry


-- irgendwann bringts nix mehr:
SELECT AVG(Freight) AS [mittlere Frachtkosten], ShipCountry, ShipCity, OrderID
FROM Orders
GROUP BY ShipCountry, ShipCity, OrderID
ORDER BY ShipCountry
-- da h�tten wir dann genau die Frachtkosten von jeder Bestellung, keinen Mittelwert mehr


-- man kann auch nach Spalten ordnen, die gar nicht im SELECT stehen (Sinn?)
SELECT OrderID, EmployeeID, ShipCountry
FROM Orders
ORDER BY ShipCity
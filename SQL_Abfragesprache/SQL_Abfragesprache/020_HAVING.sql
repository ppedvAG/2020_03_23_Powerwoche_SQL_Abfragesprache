-- HAVING

-- Anzahl der Kunden, aber nur dort, wo wir mehr als 3 Kunden pro Land haben
-- Anzahl, Land

-- Anzahl der Kunden?
SELECT COUNT(CustomerID)
FROM Customers

-- Anzahl der Kunden pro Land?
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country


SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) >= 3


-- wo haben wir die meisten Kunden?
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) >= 3
ORDER BY COUNT(CustomerID) DESC

-- mit alias:
SELECT COUNT(CustomerID) AS Kundenanzahl, Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) >= 3
ORDER BY Kundenanzahl DESC


-- alle Employees, die mehr als 20 Bestellungen bearbeitet haben
-- LastName, Anzahl Bestellungen
SELECT e.LastName, COUNT(o.OrderID)
FROM Orders o INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
GROUP BY LastName
HAVING COUNT(o.OrderID) > 20


-- EmployeeID, LastName, Anzahl Bestellungen
SELECT e.EmployeeID, e.LastName, COUNT(o.OrderID)
FROM Orders o INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID, e.LastName
HAVING COUNT(o.OrderID) > 20


-- geordnet nach?
SELECT e.EmployeeID, e.LastName, COUNT(o.OrderID) AS [Anzahl Bestellungen]
FROM Orders o INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID, e.LastName
HAVING COUNT(o.OrderID) > 20
ORDER BY COUNT(o.OrderID) DESC


-- EmployeeID, FullName (FirstName und LastName), Anzahl Bestellungen
SELECT e.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName) AS FullName, COUNT(o.OrderID) AS [Anzahl Bestellungen]
FROM Orders o INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
HAVING COUNT(o.OrderID) > 20
ORDER BY COUNT(o.OrderID) DESC

-- nur die Angestellten 2 und 8 anzeigen, falls sie mehr als 100 Bestellungen bearbeitet haben?
-- EmployeeID, Name, Anzahl Bestellungen
SELECT e.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName) AS FullName, COUNT(o.OrderID) AS [Anzahl Bestellungen]
FROM Orders o INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE e.EmployeeID IN(2,8)
GROUP BY e.EmployeeID, e.FirstName, e.LastName
HAVING COUNT(o.OrderID) > 100

-- Leverling, Peacock mehr als 100?
SELECT e.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName) AS FullName, COUNT(o.OrderID) AS [Anzahl Bestellungen]
FROM Orders o INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE e.LastName IN('Leverling', 'Peacock')
GROUP BY e.EmployeeID, e.FirstName, e.LastName
HAVING COUNT(o.OrderID) > 100
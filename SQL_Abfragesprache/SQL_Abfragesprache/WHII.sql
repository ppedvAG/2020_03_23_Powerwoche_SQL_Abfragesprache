
-- % - beliebig viele unbekannte Zeichen
-- [] - ein Zeichen aus einem bestimmten Wertebereich [a-c]
-- [^...] - NICHT ...
-- [x | y] - ODER
-- _ - ein Zeichen

-- DISTINCT

SELECT DISTINCT Country
FROM Customers

-- TOP

SELECT TOP 3 *
FROM Customers
ORDER BY CustomerID


SELECT TOP 3 PERCENT *
FROM Customers
ORDER BY CustomerID


SELECT TOP 3 PERCENT WITH TIES *
FROM Orders
ORDER BY Freight


-- OrderID, ProductName, Quantity, SupplierID, CompanyName (vom Supplier)

SELECT	  od.OrderID
		, p.ProductID
		, p.ProductName
		, od.Quantity
		, s.SupplierID
		, s.CompanyName
FROM Products p INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
				INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
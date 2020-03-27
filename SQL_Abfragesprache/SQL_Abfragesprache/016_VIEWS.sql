-- VIEWS (Sichten)


-- SYNTAX
-- CREATE VIEW vName
-- AS


-- Bsp:
CREATE VIEW vTest100
AS
SELECT CustomerID, CompanyName
FROM Customers


SELECT CustomerID
FROM vTest100
WHERE CompanyName LIKE '[a-c]%'


DROP VIEW vTest100


CREATE VIEW vCustomersProducts
AS
SELECT	  c.CustomerID
		, c.CompanyName
		, c.ContactName
		, c.Phone
		, c.Address
		, o.OrderID
		, o.OrderDate
		, o.ShippedDate
		, od.Quantity
		, od.UnitPrice
		, p.ProductID
		, p.ProductName
--		, ...
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
				 INNER JOIN Products p ON od.ProductID = p.ProductID


SELECT	  CustomerID
		, CompanyName
		, OrderID
		, ProductName
FROM vCustomersProducts
WHERE CustomerID = 'PARIS' -- der ist da nicht drin! wegen INNER JOIN c und o


CREATE VIEW vCustomersArgentina
AS
SELECT c.CustomerID
		, c.CompanyName
		, o.OrderID
--		,...
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE Country = 'Argentina'


SELECT *
FROM vCustomersArgentina



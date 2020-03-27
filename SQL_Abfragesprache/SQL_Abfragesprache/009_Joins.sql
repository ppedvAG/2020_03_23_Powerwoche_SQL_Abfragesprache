-- Tabellen miteinander verknüpfen: JOINS

-- INNER JOINS

-- OUTER JOINS
		-- LEFT JOIN
		-- RIGHT JOIN


SELECT *
FROM Orders
ORDER BY CustomerID

-- jetzt möchte ich wissen, wo ich die Rechnung hinschicken muss
-- ich brauche also Information aus zwei Tabellen, nämlich Orders und Customers

SELECT *
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID


-- was möchte ich denn für Informationen haben?
SELECT	  OrderID
		, Orders.CustomerID
		, CompanyName
		, Address
--		, ...
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID


-- ich kann (muss aber nicht zwingend) bei allen Spalten dazuschreiben, aus welcher Tabelle sie kommen
SELECT	  o.OrderID
		, o.CustomerID -- hier müssen wirs dazusagen (gibts in beiden Tabellen)
		, c.CompanyName
		, c.Address
--		, ...
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID


-- weiter einschränken:
SELECT	  OrderID
		, Orders.CustomerID
		, CompanyName
		, Address
--		, ...
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'Germany'


-- auch ordnen mit order by
SELECT	  OrderID
		, Orders.CustomerID
		, CompanyName
		, Address
--		, ...
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'Germany'
ORDER BY OrderID



-- bisschen kürzere Schreibweise mit ALIAS
SELECT	  OrderID
		, o.CustomerID
		, CompanyName
		, Address
--		, ...
FROM Customers AS c INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID

-- AS darf auch weggelassen werden:
SELECT	  OrderID Bestellnummer -- AS DARF weggelassen werden, sollte aber nicht (Lesbarkeit)
		, o.CustomerID
		, CompanyName AS Firmenname -- besser AS angeben im SELECT
		, [Address]
--		, ...
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID -- AS kann weggelassen werden, weil ich das hier kaum falsch interpretieren kann


-- Gib die Namen der Anbieter (Supplier), die Sauce verkaufen, aus. (CompanyName, ProductName, Ansprechperson, Telefonnummer).

SELECT	  ProductName
		, CompanyName
		, ContactName
		, Phone
FROM Products p INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE ProductName LIKE '%sauce%'


-- Gib alle Kunden (Firmenname) aus Brasilien und deren Frachtkosten aus.
-- Ordne die Ausgabe aufsteigend nach Frachtkosten.
-- BRAZIL

SELECT	  c.CustomerID
		, c.CompanyName
		, o.Freight
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.Country = 'Brazil'
ORDER BY o.Freight


-- OUTER JOINS

-- RIGHT JOIN

SELECT	  OrderID
		, Orders.CustomerID
		, CompanyName
		, Address
--		, ...
FROM Customers RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID



-- LEFT JOIN

SELECT	  OrderID
		, Customers.CustomerID
		, CompanyName
		, Address
--		, ...
FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

-- Vergleich mit INNER JOIN
SELECT	  OrderID
		, Orders.CustomerID
		, CompanyName
		, Address
--		, ...
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID



-- wie bekomme ich die, die noch nix bestellt haben?
SELECT *
FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL


-- Informationen aus mehr als zwei Tabellen abfragen:
-- Bestellnummer, Employee Name, CompanyName

SELECT	  OrderID
		, CONCAT(FirstName, ' ', LastName) AS FullName
		, c.CustomerID
		, CompanyName
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE e.EmployeeID IN(3, 5, 7)



-- Gib alle Kunden aus den USA und deren Frachtkosten aus.
-- CustomerID, CompanyName, ContactName,...
SELECT	   c.CustomerID
		, CompanyName
		, Freight
		, Country
--		,...
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE Country = 'USA'


-- Welche Kunden haben Chai Tee gekauft und wieviel?
-- (OrderID, CustomerID, CompanyName, ProductName, Quantity)

SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, p.ProductName
		, od.Quantity
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
				 INNER JOIN Products p ON od.ProductID = p.ProductID
WHERE ProductName LIKE '%chai%'
ORDER BY Quantity


--Suche alle Bestellungen, bei denen Bier verkauft wurde. Welcher Kunde? Wieviel? Welches Bier?
--Tipp: Der Produktname kann „Bier“ oder „Lager“ enthalten oder mit „Ale“ enden.
--Nach Menge und Kundenname geordnet:
--	Menge absteigend (größte zuerst), 	Kundenname aufsteigend (A-Z)

-- welche Produkte mit Bier gibts?
SELECT ProductName
FROM Products
WHERE ProductName LIKE '%bier%' OR ProductName LIKE '%lager%' OR ProductName LIKE '%ale'



SELECT	  o.OrderID
		, c.CompanyName
		, od.Quantity
		, p.ProductName
FROM Products p INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
				INNER JOIN Orders o ON od.OrderID = o.OrderID
				INNER JOIN Customers c ON c.CustomerID = o.CustomerID
WHERE ProductName LIKE '%bier%' OR ProductName LIKE '%lager%' OR ProductName LIKE '%ale'
ORDER BY od.Quantity DESC, CompanyName ASC


-- Einschub: ORDER BY

SELECT	  CustomerID
		, CompanyName
		, Country
		, City
FROM Customers
ORDER BY Country, City


-- Wer ist der Chef von wem?
-- mit Inner Join nur die, die einen Chef haben, der Chef selbst wird nicht angezeigt
SELECT	  CONCAT(e1.LastName, ', ', e1.FirstName) AS AngestelltenName
		, e1.EmployeeID AS AngestelltenID
		, CONCAT(e2.LastName, ', ', e2.FirstName) AS VorgesetztenName
		, e2.EmployeeID AS VorgesetztenID
FROM Employees e1 INNER JOIN Employees e2 ON e1.ReportsTo = e2.EmployeeID

-- mit RIGHT JOIN oder LEFT JOIN wird auch der Chef angezeigt
SELECT	  CONCAT(e2.LastName, ' ', e2.FirstName) AS AngestelltenName
		, e2.EmployeeID AS AngestelltenID
		, CONCAT(e1.LastName, ' ', e1.FirstName) AS VorgesetztenName
		, e1.EmployeeID AS VorgesetztenID
FROM Employees e1 RIGHT JOIN Employees e2 ON e2.ReportsTo = e1.EmployeeID

-- mit LEFT JOIN
SELECT	  CONCAT(e2.LastName, ' ', e2.FirstName) AS VorgesetztenName
		, e2.EmployeeID AS VorgesetztenID
		, CONCAT(e1.LastName, ' ', e1.FirstName) AS AngestelltenName
		, e1.EmployeeID AS AngestelltenID
FROM Employees e1 LEFT JOIN Employees e2 ON e1.ReportsTo = e2.EmployeeID


--Gib alle Kunden aus, die in der gleichen Stadt wohnen, wie ein anderer Kunde (nicht sie selbst).
--Ausgabe:
--Customer1, City1, Customer2, City2

SELECT	  c1.CustomerID AS Customer1
		, c1.City AS City1
		, c2.CustomerID AS Customer2
		, c2.City AS City2
FROM Customers c1 INNER JOIN Customers c2 ON c1.City = c2.City
WHERE c1.CustomerID != c2.CustomerID
ORDER BY c1.City

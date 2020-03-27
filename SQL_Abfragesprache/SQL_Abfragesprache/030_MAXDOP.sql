-- MAXDOP
-- maximal degree of parallelism



SELECT        Customers.CustomerID, Customers.CompanyName, Customers.ContactName, Customers.ContactTitle, Customers.City, Customers.Country, [Order Details].UnitPrice, [Order Details].Quantity, Orders.OrderID AS Expr1, 
                         Orders.CustomerID AS Expr2, Orders.EmployeeID, Orders.OrderDate, Orders.Freight, Orders.ShipCity, Orders.ShipCountry, Employees.EmployeeID AS Expr3, Employees.LastName, Employees.FirstName, Employees.BirthDate, 
                         Products.ProductID, Products.ProductName, Products.UnitsInStock
INTO test
FROM            Products INNER JOIN
                         [Order Details] ON Products.ProductID = [Order Details].ProductID, Employees, Customers INNER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID


-- select *
-- into test2
-- from test

set statistics io, time on

SELECT Country, SUM(Unitprice*Quantity)
FROM test
GROUP BY Country
-- OPTION (maxdop 1)

-- Kosten für Parallelisierung
-- Standardsetting: 5 (recht niedrig)
-- oft wird 50 als Richtwert eingestellt

select *
from sys.dm_os_wait_stats


SELECT City, Country, SUM(Unitprice*Quantity)
FROM test
GROUP BY Country, City


USE [NWTuning]
GO
CREATE NONCLUSTERED INDEX IX_City_incl_Cou_UP_Quant
ON [dbo].[test] ([City])
INCLUDE ([Country],[UnitPrice],[Quantity])
GO






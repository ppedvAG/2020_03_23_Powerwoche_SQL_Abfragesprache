-- Procedures

-- Syntax
-- CREATE PROC pName, p_Name, usp_Name, uspName,... NICHT sp_Name
-- AS
-- .....


-- sp_help Customers

-- Bsp.:

CREATE PROC pDemo100
AS
SELECT TOP 1 * FROM Orders ORDER BY Freight
SELECT TOP 1 * FROM Orders ORDER BY Freight DESC
SELECT Country FROM Customers WHERE CustomerID LIKE 'a%'

-- aufrufen mit EXEC (execute)

EXEC pDemo100



CREATE PROC pCustomerCity @City varchar(30)
AS
SELECT * FROM Customers WHERE City = @City


EXEC pCustomerCity @City = 'Berlin'



CREATE PROC pCustomerCountryCity @Country varchar(30), @City varchar(30)
AS
SELECT * FROM Customers WHERE City = @City AND Country = @Country

EXEC pCustomerCountryCity @City = 'Berlin', @Country = 'Germany'

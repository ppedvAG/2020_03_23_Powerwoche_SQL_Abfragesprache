USE MyTestDB

SELECT *
INTO TestEmployees
FROM Northwind.dbo.Employees


SELECT *
FROM TestEmployees


ALTER TABLE TestEmployees
ADD Salary money


-- entweder so:
UPDATE TestEmployees
SET Salary = 2500
WHERE EmployeeID = 1


-- ODER:
-- CASE:
UPDATE TestEmployees
SET Salary = 
			(CASE
				WHEN EmployeeID = 1 THEN 2500
				WHEN EmployeeID = 2 THEN 8000
				WHEN EmployeeID = 3 THEN 1800
				WHEN EmployeeID = 4 THEN 5000
				WHEN EmployeeID = 5 THEN 3200
				WHEN EmployeeID = 6 THEN 3100
				WHEN EmployeeID = 7 THEN 2300
				WHEN EmployeeID = 8 THEN 2800
				WHEN EmployeeID = 9 THEN 3000

				ELSE Salary
			END)

SELECT EmployeeID, Salary
FROM TestEmployees



----Gib die EmployeeID, 
--den Vor- und Nachnamen (in einem Feld) und das Gehalt aller Mitarbeiter aus, die ein höheres Gehalt beziehen als der Mitarbeiter mit der EmployeeID 8.
SELECT	  EmployeeID
		, CONCAT(FirstName, ' ', LastName) AS FullName
		, Salary
FROM TestEmployees
WHERE Salary > (SELECT Salary FROM TestEmployees WHERE EmployeeID = 8)


--Gib die SupplierID, den CompanyName, die Kontaktinformation und das Land aller Supplier aus, die aus dem gleichen Land sind wie der Supplier Nr. 2.

USE Northwind

SELECT SupplierID
		, CompanyName
		, ContactName
		, Country
FROM Suppliers
WHERE Country = (SELECT Country FROM Suppliers WHERE SupplierID = 2)
-- 4


-- Gib die EmployeeID, Name, Gehalt und Land der Mitarbeiter aus, die das niedrigste Gehalt in ihrem jeweiligen Land beziehen.
USE MyTestDB

SELECT	  EmployeeID
		, CONCAT(FirstName, ' ', LastName)
		, Salary
		, Country
FROM TestEmployees
WHERE Salary IN (SELECT MIN(Salary) FROM TestEmployees GROUP BY Country)


-- Gib die Namen der Employees aus, deren Gehalt zwischen dem niedrigsten Gehalt und 3000 liegt.
SELECT	  CONCAT(FirstName, ' ' , LastName)
		, Salary
FROM TestEmployees
WHERE Salary BETWEEN ( SELECT MIN(Salary) FROM TestEmployees) AND 3000
ORDER BY Salary


-- Gib die Namen und das Einstellungsdatum der Mitarbeiter aus, die im selben Jahr eingestellt wurden wie Mr. Robert King.
--Titel, Vorname und Nachname sollen überprüft werden.
--Uhrzeit soll nicht mit ausgegeben werden

SELECT	  CONCAT(FirstName, ' ', LastName) AS FullName
		, CAST(HireDate AS date) AS HireDate
FROM TestEmployees
WHERE FORMAT(HireDate, 'yyyy') = (SELECT FORMAT(HireDate, 'yyyy') AS Jahr FROM TestEmployees WHERE FirstName = 'Robert' AND LastName = 'King')

-- Alternativen
SELECT	  CONCAT(FirstName, ' ', LastName) AS FullName
		, FORMAT(HireDate, 'dd.MM.yyyy') AS HireDate
FROM TestEmployees
WHERE YEAR(HireDate) = (SELECT YEAR(HireDate) AS Jahr FROM TestEmployees WHERE TitleOfCourtesy = 'Mr.' AND FirstName = 'Robert' AND LastName = 'King') AND EmployeeID != 7


SELECT	  CONCAT(FirstName, ' ', LastName) AS FullName
		, FORMAT(HireDate, 'dd.MM.yyyy') AS HireDate
FROM TestEmployees
WHERE YEAR(HireDate) = (SELECT YEAR(HireDate) AS Jahr FROM TestEmployees WHERE CONCAT(TitleOfCourtesy, ' ', FirstName, ' ', LastName) = 'Mr. Robert King') AND EmployeeID != 7


-- Gib die EmployeeID, Name, Titel, Gehalt und die Region der Mitarbeiter aus, deren Gehalt über 2500 liegt und deren Region nicht NULL ist.
SELECT	  EmployeeID
		, CONCAT(FirstName, ' ', LastName) AS FullName
		, TitleOfCourtesy
		, Salary
		, Region
FROM TestEmployees
WHERE Salary > 2500 AND Region IS NOT NULL


SELECT	  EmployeeID
		, CONCAT(TitleOfCourtesy, ' ', FirstName, ' ', LastName) AS FullName
		, Salary
		, Region
FROM TestEmployees
WHERE Salary > 2500 AND Region IS NOT NULL

-- mit Subquery (wäre aber nicht sehr schlau)
-- Blödsinn:
--SELECT	  EmployeeID
--		, CONCAT(TitleOfCourtesy, ' ', FirstName, ' ', LastName) AS FullName
--		, Salary
--		, Region
--FROM (SELECT * FROM TestEmployees WHERE Region IS NOT NULL) AS x
--WHERE Salary > 2500



--Erstelle eine Stored Procedure usp_Raise, die beim Ausführen das Gehalt aller Mitarbeiter, deren aktuelles Gehalt unter dem Durchschnitt liegt, um 20% erhöht, das der Mitarbeiter, deren aktuelles Gehalt über dem Durchschnitt liegt, um 10% erhöht, und das der Mitarbeiter, deren Gehalt 10.000 übersteigt, unverändert lässt.

USE MyTestDB

CREATE PROC usp_raise
AS

DECLARE @var1 AS money = (SELECT AVG(Salary) FROM TestEmployees)
UPDATE TestEmployees
SET Salary = (
				CASE
					WHEN Salary > 10000 THEN Salary
					WHEN Salary > @var1 THEN Salary * 1.10
					WHEN Salary < @var1 THEN Salary * 1.20
					ELSE Salary
				END
			)


EXEC usp_raise

SELECT	  EmployeeID
		, Salary
FROM TestEmployees


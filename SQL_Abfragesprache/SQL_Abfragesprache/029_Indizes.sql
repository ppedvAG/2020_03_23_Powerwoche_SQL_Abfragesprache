-- Indizes, Indices, Indexe,... indexes (engl)
-- gruppierte Indizes (clustered index)
-- genau 1 clustered Index pro Tabelle
-- nicht-gruppierte Indizes (non-clustered index)
-- 999 non-clustered indexes pro Tabelle möglich

-- Unterarten von non-clustered Indexes
-- unique index (eindeutiger Index) - eine Spalte eindeutig
-- gefilterter Index - s.u. z.B. nur die Kunden aus Deutschland
-- zusammengesetzter Index (max 16 Spalten), (max 900 bytes)
-- Index mit eingeschlossenen Spalten (included columns)
-- abdeckender Index (covering index) -- wenn alle Spalten in der Abfrage vom Index abgedeckt werden (also wir ein SEEK machen, kein Scan vorkommt)
-- Columnstore Index -- für Big Data (Data Warehouse); oder für Archivdaten, wo sich nix (oder nicht viel) ändert


CREATE DATABASE MyTestDB

SELECT *
INTO TestEmployees
FROM Northwind.dbo.Employees

SELECT *
INTO TestCustomers
FROM Northwind.dbo.Customers

SELECT *
FROM TestEmployees
-- Table Scan

--SELECT *
--FROM Employees
-- Clustered Index Scan

-- Datenbank speichert auf Pages
-- 1 Page 8192 byte
-- davon können 8060 byte verwenden
-- ~ 8MB
-- page header (96 bytes) -- Metainformationen, z.B. Typ, nächste Seite, vorherige Seite, gibts einen Index?, wieviel Platz ist noch übrig....
-- row offset information (36 bytes) -- wo befindet sich die Zeile


SELECT EmployeeID, FirstName, LastName
FROM TestEmployees
WHERE EmployeeID = 3
-- Table Scan

SELECT FirstName, LastName, HomePhone
FROM TestEmployees
WHERE EmployeeID IN(3, 5, 7)


CREATE CLUSTERED INDEX IX_TestEmployees_EmployeeID
ON TestEmployees (EmployeeID)


SELECT EmployeeID, FirstName, LastName
FROM TestEmployees
WHERE EmployeeID = 3
-- Clustered Index Seek



SELECT EmployeeID, FirstName, LastName
FROM TestEmployees

CREATE CLUSTERED INDEX IX_CustomerID
ON TestCustomers (CustomerID)


-- non-clustered index
CREATE NONCLUSTERED INDEX IX_City
ON TestCustomers (City)


SELECT CustomerID, City, Country, PostalCode
FROM TestCustomers
WHERE City = 'Berlin'


-- Zusammengesetzter Index (multicolumn index)
CREATE NONCLUSTERED INDEX IX_City_PostalCode
ON TestCustomers (City, PostalCode)
-- theoretisch 16 Spalten möglich



SELECT CustomerID, City, Country, PostalCode
FROM TestCustomers
WHERE City = 'Berlin'



-- Index mit eingeschlossenen Spalten (index with included columns)
-- soll ein "Lookup" verhindern
CREATE UNIQUE INDEX IX_CID_Ci_Cou_PC
ON TestCustomers (CustomerID)
INCLUDE (City, Country, PostalCode)


-- Gefilterter Index (filtered index)
CREATE NONCLUSTERED INDEX IX_Customers_Germany
ON TestCustomers (CustomerID)
WHERE Country = 'Germany'



-- Usage stats von Index abfragen
SELECT *
FROM sys.dm_db_index_usage_stats
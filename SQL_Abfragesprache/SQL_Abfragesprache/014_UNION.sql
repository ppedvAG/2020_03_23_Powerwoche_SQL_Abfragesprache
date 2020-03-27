-- UNION



-- Liste von allen Kontaktpersonen
-- Customers und Suppliers
-- CustomerID, CompanyName, ContactName, Phone
-- SupplierID, CompanyName, ContactName, Phone


-- NEIN!!! -- keine Liste, sondern entsprechend mehr Spalten
-- so wird das nix:
SELECT	  c.CustomerID
		, c.CompanyName
		, c.ContactName
		, c.Phone
		, s.SupplierID
		, s.CompanyName
		, s.ContactName
		, s.Phone
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
				 INNER JOIN Products p ON od.ProductID = p.ProductID
				 INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
ORDER BY CustomerID


-- UNION

SELECT 'Testtext1' AS Testtext
UNION
SELECT 'Testtext2'


-- UNION MACHT AUCH DISTINCT!!
SELECT 'Testtext'
UNION
SELECT 'Testtext'

-- wenn man KEIN DISTINCT möchte: UNION ALL
SELECT 'Testtext'
UNION ALL
SELECT 'Testtext'

-- VORSICHT:
SELECT 123
UNION
SELECT 'Testtext'


-- CAST geht
SELECT CAST(123 AS varchar)
UNION
SELECT 'Testtext'

-- muss gleiche Datentypen haben!!


-- geht nicht:
SELECT 123, 'Testtext'
UNION
SELECT 456
-- wir müssen die gleiche Anzahl an Spalten verwenden!

-- geht:
SELECT 123, 'Testtext'
UNION
SELECT 456, 'Testtext'

-- geht:
SELECT 123, 'Testtext'
UNION
SELECT 456, 'blabla' -- SINN? Wie sinnvoll ist es, irgendeinen Text zu Spalten hinzuzufügen?

-- geht:
SELECT 123, 'Testtext'
UNION
SELECT 456, NULL -- SINN? Wieviel Sinn macht es in der jeweiligen Situation?


-- Liste von Kontaktdaten

SELECT	  CompanyName
		, ContactName
		, Phone
		, 'C' AS Category
FROM Customers
UNION
SELECT	  CompanyName
		, ContactName
		, Phone
		, 'S' AS Category
FROM Suppliers




-- ORDER BY:
SELECT	  CompanyName
		, ContactName
		, Phone
		, 'C' AS Category
FROM Customers
UNION
SELECT	  CompanyName
		, ContactName
		, Phone
		, 'S' AS Category
FROM Suppliers
ORDER BY ContactName -- geht, bezieht sich aber auf BEIDE Tabellen!



SELECT Phone, Companyname
FROM Customers
UNION
SELECT HomePhone, 'blabla' -- SINN? Situationsabhängig
FROM Employees


--Gib alle Regionen der Kunden und der Angestellten aus.
--Füge eine Kategorie „C“ für Customer und „E“ für Employee hinzu.

SELECT Region, 'C' AS Category
FROM Customers
UNION
SELECT Region, 'E' AS Category
FROM Employees


-- Vorsicht mit Datentypen und Spaltenanzahl!
SELECT CustomerID, CompanyName
FROM Customers
UNION
SELECT SupplierID, CompanyName, Phone
FROM Suppliers
-- hier unterschiedliche Datentypen UND unterschiedliche Spaltenanzahl!!



-- Liste mit niedrigsten und höchsten Frachtkosten (untereinander)
-- OrderID, Freight, 'niedrigste Frachtkosten'
-- OrderID, Freight, 'höchste Frachtkosten'

-- Ideen?
SELECT TOP 1 OrderID, Freight, 'niedrigste Frachtkosten' AS Frachtkosten
FROM Orders
ORDER BY Freight
UNION -- geht nicht, weil ORDER BY gilt für beide
SELECT TOP 1 OrderID, Freight, 'höchste Frachtkosten' AS Frachtkosten
FROM Orders
ORDER BY Freight DESC


-- mit temporärer Tabelle gehts:
SELECT TOP 1 OrderID, Freight, 'niedrigste Frachtkosten' AS Frachtkosten
INTO #niedrigsterWert
FROM Orders
ORDER BY Freight

SELECT TOP 1 OrderID, Freight, 'höchste Frachtkosten' AS Frachtkosten
INTO #hoechsterWert
FROM Orders
ORDER BY Freight DESC


SELECT *
FROM #niedrigsterWert
UNION
SELECT *
FROM #hoechsterWert


-- mit Min/Max (bei mehreren Spalten problematisch)
SELECT MIN(Freight), 'niedrigster Wert'
FROM Orders
UNION
SELECT MAX(Freight), 'höchster Wert'
FROM Orders

-- das geht nicht:
SELECT OrderID, MIN(Freight), 'niedrigster Wert'
FROM Orders
GROUP BY OrderID
UNION
SELECT OrderID, MAX(Freight), 'höchster Wert'
FROM Orders
GROUP BY OrderID


-- mit Subquery gehts auch:
SELECT *
FROM (SELECT TOP 1 OrderID, Freight, 'niedrigster Wert' AS Wert FROM Orders ORDER BY Freight) n
UNION
SELECT *
FROM (SELECT TOP 1 OrderID, Freight, 'höchster Wert' AS Wert FROM Orders ORDER BY Freight DESC) h

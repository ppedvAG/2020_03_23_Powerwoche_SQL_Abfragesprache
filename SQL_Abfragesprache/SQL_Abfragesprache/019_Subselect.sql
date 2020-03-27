-- Subselect, Unterabfragen, subquery

-- Unterabfrage wie eine Spalte verwenden
SELECT   'Text'
		, Freight
		, (SELECT TOP 1 Freight FROM Orders ORDER BY Freight) 
FROM Orders

-- wenn man eine Unterabfrage wie eine Spalte verwendet, darf nur 1 Wert drinstehen



-- Unterabfrage wie eine Tabelle verwenden
-- Subselect als Datenquelle verwenden
SELECT *
FROM -- Tabelle?
		(SELECT OrderID, Freight FROM Orders WHERE EmployeeID = 3) t1 -- Name!

-- Wenn wir ein Subselect als Datenquelle verwenden, müssen wir einen Tabellennamen (ALIAS) vergeben



-- Unterabfrage im WHERE unterbringen

SELECT *
FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)
ORDER BY Freight


-- Gib mittels Subquery alle Kunden aus, die in einem Land wohnen, in das auch Bestellungen verschifft werden.

SELECT *
FROM Customers
WHERE Country IN (SELECT DISTINCT ShipCountry FROM Orders)


-- Gib alle Bestellungen aus, deren Frachtkosten kleiner sind als der Durchschnitt der Frachtkosten.
-- In absteigender Reihenfolge geordnet (vom größten zum kleinsten Wert).

SELECT    OrderID
		, Freight
FROM Orders
WHERE Freight < (SELECT AVG(Freight) FROM Orders)
ORDER BY Freight DESC

-- CASE

SELECT OrderID, Quantity, 
	CASE
		WHEN Quantity > 10 THEN 'größer 10'
		WHEN Quantity = 10 THEN 'genau 10'

		ELSE 'unbekannt'
	END AS Anzahl
FROM [Order Details]



-- von Customers
-- wenn EU Mitglied, dann 'EU'
-- wenn nicht EU Mitglied, dann 'nicht EU'
-- wenn nicht bekannt, dann 'keine Ahnung'
-- wenn UK, dann 'Brexit'

SELECT CustomerID, Country,
	CASE
		WHEN Country = 'Germany' THEN 'EU'
		WHEN Country = 'Austria' THEN 'EU'
		WHEN Country = 'France' THEN 'EU'
		WHEN Country = 'USA' THEN 'nicht EU'
		WHEN Country = 'UK' THEN 'Brexit'
		ELSE 'keine Ahnung'
	END AS [EU Check]
FROM Customers



SELECT CustomerID, Country,
	CASE
		WHEN Country IN('Germany', 'Austria', 'France') THEN 'EU'
		WHEN Country IN('USA', 'Argentina') THEN 'nicht EU'
		WHEN Country = 'UK' THEN 'Brexit'
		ELSE 'keine Ahnung'
	END AS [EU Check]
FROM Customers


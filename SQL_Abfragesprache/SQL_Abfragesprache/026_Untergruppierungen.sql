-- Untergruppierungen
-- OVER PARTITION BY


-- Mittelwert der Frachtkosten
SELECT AVG(Freight) AS [mittlere Frachtkosten]
FROM Orders


-- Mittelwert PRO irgendetwas... z.B. PRO Frächter (ShipVia)
SELECT AVG(Freight) AS [mittlere Frachtkosten], ShipVia
FROM Orders
GROUP BY ShipVia


-- bei mehreren Spalten
-- Mittlere Frachtkosten pro Kunde und Frächter
SELECT AVG(Freight) AS [mittlere Frachtkosten], ShipVia, CustomerID
FROM Orders
GROUP BY ShipVia, CustomerID


-- irgendwann gibts aber keinen Mittelwert mehr bei mehreren Spalten
-- in diesem Fall bei OrderID (dann wären es die Frachtkosten pro Bestellung, kein Mittelwert mehr)
SELECT AVG(Freight) AS [mittlere Frachtkosten], ShipVia, CustomerID, OrderID
FROM Orders
GROUP BY ShipVia, CustomerID, OrderID
-- bringt nix


-- mit OVER PARTITION BY
-- Untergruppierung
-- trotz OrderID mittlere Frachtkosten pro Frächter
SELECT	  OrderID
		, CustomerID
		, ShipVia
		, AVG(Freight)
						OVER (PARTITION BY ShipVia) AS [mittlere Frachtkosten]
FROM Orders
ORDER BY CustomerID
-- dadurch bekomme ich aber auch Werte doppelt


-- mehrere Angaben im OVER PARTITION BY
-- mittlere Frachtkosten pro Kunde UND Frächter
SELECT	  OrderID
		, CustomerID
		, ShipVia
		, Freight
		, AVG(Freight)
					OVER (PARTITION BY ShipVia, CustomerID) AS [mittlere Frachtkosten]
FROM Orders
ORDER BY CustomerID

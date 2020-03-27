-- WH von Tag 1

--SELECT *
--FROM Tabelle
--WHERE Bedingung
--ORDER BY Spalte ASC (ascending: aufsteigend)| DESC (descending: absteigend)


SELECT	  CustomerID
		, CompanyName
		, 'Hallo'
		, 123
--		, Spalte1*Spalte2 ... Berechnungen
FROM Customers


/*

	Gib die Bestellnummer, den Wunschtermin, das Lieferdatum und die Lieferverzögerung aus.
	Ergebnisse von Bestellungen, die noch nicht geliefert wurden, sollen nicht ausgegeben werden.
	Ordne das Ergebnis absteigend von der größten zur kleinsten Lieferverzögerung.

*/


SELECT	  OrderID
		, RequiredDate
		, ShippedDate
		, DATEDIFF(dd, RequiredDate, ShippedDate) AS Lieferverzögerung
FROM Orders
WHERE ShippedDate IS NOT NULL
ORDER BY Lieferverzögerung DESC
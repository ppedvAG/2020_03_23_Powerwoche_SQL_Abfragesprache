-- temporäre Tabellen

/*

	-- lokale temporäre Tabellen
	-- existiert nur in der aktuellen Session
	#Tabellenname


	-- globale temporäre Tabellen
	-- Zugriff auch aus anderen Sessions
	##Tabellenname


	-- hält nur solange wie die Session besteht/die Verbindung da ist

	-- kann auch gelöscht werden

*/

SELECT CustomerID, Freight
INTO #testtable
FROM Orders


SELECT *
FROM #testtable



SELECT CustomerID, CompanyName
INTO ##test2
FROM Customers

SELECT *
FROM ##test2
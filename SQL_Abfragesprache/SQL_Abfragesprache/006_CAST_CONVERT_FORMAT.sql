-- CAST, CONVERT, FORMAT


-- ********************* CAST **************************************

-- funktioniert:
SELECT '123' + 2

-- funktioniert nicht:
SELECT '123.3' + 2


/*
	implizite und explizite Konvertierung in der Microsoft-Dokumentation:
	https://docs.microsoft.com/de-de/sql/t-sql/data-types/data-type-conversion-database-engine?view=sql-server-ver15
*/


-- ich kann/darf das selbst in einen anderen Datentyp umwandeln:
-- funktioniert:

SELECT CAST('123.3' AS float) + 2  -- 125,3

-- geht auch mit Datum... SINN?? und Achtung, kein Einfluss auf das Format
SELECT CAST(SYSDATETIME() AS varchar)


-- Vorsicht mit Anzahl an Zeichen
SELECT CAST(SYSDATETIME() AS varchar(3)) -- macht keinen Sinn!!


-- mit Abfrage aus DB (nur mit Cast kein Einfluss auf Format!)
SELECT	  CAST(BirthDate AS varchar)
FROM Employees


-- Vorsicht!! Umgekehrt kann es zu Problemen führen!!
SELECT CAST('2020-03-23' AS date) -- Systemabhängig, ob es funktioniert!! Was ist Tag, was ist Monat??


-- ***************************** CONVERT ********************************

-- Syntax:
-- CONVERT(data_type[(length)], expression[, style])
-- CONVERT(1 in welchen Datentyp soll konvertiert werden
--		   2 WAS soll konvertiert werden
--		   3 optional: Style)


SELECT CONVERT(varchar(10), 12345.6)

-- funktioniert auch mit Datum:
SELECT CONVERT(varchar, SYSDATETIME())

-- wieder aufpassen mit Länge:
SELECT CONVERT(varchar(3), SYSDATETIME()) -- sinnlos!


SELECT CONVERT(varchar, SYSDATETIME(), 104) -- dt. Schreibweise
SELECT CONVERT(varchar, SYSDATETIME(), 4) -- nur letzte zwei Stellen vom Jahr



-- Date und Time Styles in der Microsoft Dokumentation:
/*
	https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-2017#date-and-time-styles
*/


SELECT	  CONVERT(varchar, SYSDATETIME(), 104) AS D
		, CONVERT(varchar, SYSDATETIME(), 101) AS US
		, CONVERT(varchar, SYSDATETIME(), 103) AS GB



-- ***************************** FORMAT **************************************
-- Ausgabe-Datentyp ist nvarchar

SELECT FORMAT(1234567890, '###-###/##-##')

SELECT FORMAT(431234567890, '+' + '##/### ## ## ###')


--

SELECT GETDATE()
SELECT FORMAT(GETDATE(), 'dd.MM.yyyy') -- ACHTUNG: AUSNAHMEFALL - Monat MM MUSS großgeschrieben werden, sonst wird die Minute angezeigt!!



SELECT FORMAT(GETDATE(), 'dd.MM.yyyy') AS Datum

-- Achtung, geht NICHT:
SELECT FORMAT('2020-03-23', 'dd.MM.yyyy')


-- Datum aus DB:
SELECT FORMAT(BirthDate, 'dd.MM.yyyy') AS BirthDate
FROM Employees


-- mit Culture-Parameter:
SELECT FORMAT(SYSDATETIME(), 'd', 'de-de')

-- Text ('D'):
SELECT    FORMAT(SYSDATETIME(), 'D', 'de-de') AS D
		, FORMAT(SYSDATETIME(), 'D', 'en-us') AS US
		, FORMAT(SYSDATETIME(), 'D', 'en-gb') AS GB
		, FORMAT(SYSDATETIME(), 'D', 'sv') AS Schweden


-- Zahlen ('d'):
SELECT    FORMAT(SYSDATETIME(), 'd', 'de-de') AS D
		, FORMAT(SYSDATETIME(), 'd', 'en-us') AS US
		, FORMAT(SYSDATETIME(), 'd', 'en-gb') AS GB
		, FORMAT(SYSDATETIME(), 'd', 'sv') AS Schweden

-- FORMAT(1, 2, 3)
-- 1: Was wollen wir verwenden - Spalte? Sysdatetime? ...
-- 2: als was wollen wir es darstellen? 'd' = Datum in Zahlen, 'D' = Datum mit Text 
-- 3: Culture-Code, also z.B. de-de



-- Supported Culture Codes in der Microsoft-Dokumentation:
/*
	https://docs.microsoft.com/de-de/bingmaps/rest-services/common-parameters-and-types/supported-culture-codes
*/




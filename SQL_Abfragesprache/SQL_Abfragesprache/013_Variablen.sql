-- Variablen

/*

	-- lokale Variablen
	-- Zugriff nur in der Session, wo sie erstellt wurde
	@varname


	-- globale Variablen
	-- Zugriff auch von auﬂerhalb der Session
	@@varname


	-- Lebenszeit: nur solange der Batch l‰uft


	-- Variable deklarieren
	-- welchen Datentyp soll diese Variable erhalten

	Syntax:

	DECLARE @varname AS Datentyp

*/

-- Bsp:

DECLARE @var1 AS int

-- Wert zuweisen:
SET @var1 = 100

SELECT @var1


-- Beispiel mit FORMAT und Datum
DECLARE @myDate datetime2 = SYSDATETIME()
SELECT FORMAT(@myDate, 'dd.MM.yyyy')

-- ACHTUNG- Datentypen! - und systemabh‰ngig
DECLARE @myDate1 datetime2 = '2020-03-24'
SELECT FORMAT(@myDate1, 'dd.MM.yyyy')


DECLARE @freight AS money = 50

SELECT *
FROM Orders
WHERE Freight < @freight
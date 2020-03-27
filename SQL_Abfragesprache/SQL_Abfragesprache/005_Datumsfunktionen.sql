-- Datumsfunktionen


-- *************************** Datum abfragen ***********************

-- Datentyp datetime
SELECT GETDATE()

-- Datentyp datetime2
SELECT SYSDATETIME()


-- ******************** Datumsberechnungen: DATEADD ******************

SELECT DATEADD(hh, 10, '2020-03-23')


SELECT DATEADD(hh, 10, '2020-03-23 13:54:29.234')


SELECT DATEADD(hh, 10, SYSDATETIME())


-- Sinn?
SELECT DATEADD(hh, 10, BirthDate)
From Employees


-- damit kann man auch Datum abziehen (negative Werte sind erlaubt)

SELECT DATEADD(hh, -10, '2020-03-23')  -- 2020-03-22 14:00:00.000


SELECT DATEADD(hh, -10, BirthDate)
From Employees



--  ********************* Datumsdifferenz erstellen: DATEDIFF ***************

-- Differenz zwischen zwei Daten
-- Tage bis zum nächsten Feiertag in Deutschland:
SELECT DATEDIFF(dd, '2020-03-23', '2020-04-10') -- 18



SELECT DATEDIFF(dd, '2020-04-10', '2020-03-23') -- -18 (negatives Vorzeichen)


SELECT DATEDIFF(dd, SYSDATETIME(), '2020-04-10') -- 18



/*
	Intervalle/Abkürzungen

	year, yyyy, yy = Jahr
	quarter, qq, q = Quartal
	month, MM, M = Monat
	week, ww, wk = Woche
	day, dd, d = Tag
	minute, mi, n = Minute
	second, ss, s = Sekunde
	millisecond, ms = Millisekunde
	nanosecond, ns = Nanosekunde

	weekday, dw, w = Wochentag
	dayofyear, dy, y = Day of the year


*/


-- ******************************* Datumsteile ausgeben: DATEPART ************

SELECT DATEPART(dd, '2020-03-23')
SELECT DATEPART(MM, '2020-03-23')

-- In welchem Quartal liegt der Karfreitag?

SELECT DATEPART(qq, '2020-04-10') -- 2


-- ********************* Datumsname ausgeben lassen: DATENAME *****************

SELECT DATENAME(dd, '2020-03-23') -- bringt nix!

SELECT DATENAME(dw, '2020-03-23') -- Monday
SELECT DATENAME(MM, '2020-03-23') -- March



-- Welches Datum haben wir in 38 Tagen?
SELECT DATEADD(dd, 38, SYSDATETIME())

-- Welcher Wochentag war Dein Geburtstag?
SELECT DATENAME(dw, '1981-04-22')

-- Vor wievielen Jahren kam der erste Star Wars Film in die Kinos? (25. Mai 1977 )
SELECT DATEDIFF(yy, '1977', GETDATE()) -- 43


-- In welchem Quartal liegt der österreichische Nationalfeiertag (26.10.)?
SELECT DATEPART(qq, '2020-10-26') -- 4


-- Gib Tag, Monat und Jahr Deines Geburtstages in einer eigenen Spalte mit der jeweils entsprechenden Überschrift an:

-- Tag	 Monat	 Jahr
--  22	  04	 1981


SELECT	  DATEPART(dd, '1981-04-22') AS Tag
		, DATEPART(MM, '1981-04-22') AS Monat
		, DATEPART(yy, '1981-04-22') AS Jahr


SELECT	  DAY('1981-04-22') AS Tag
		, MONTH('1981-04-22') AS Monat
		, YEAR('1981-04-22') AS Jahr


-- Gib die Datumsdifferenz zwischen Lieferdatum und Wunschtermin der Bestellungen aus.

SELECT	  DATEDIFF(dd, RequiredDate, ShippedDate) AS Lieferverzögerung
FROM Orders

-- Gib die Mitarbeiternummer, den vollständigen Namen (in einer Spalte), die Anrede, das Geburtsdatum (ohne Zeitangabe) und die Telefonnummer aller Angestellten aus.


SELECT	  EmployeeID AS Mitarbeiternummer
		, CONCAT(FirstName, ' ', LastName) AS [vollständiger Name]
		, TitleOfCourtesy AS Anrede
		, LEFT(BirthDate, 12) AS Geburtsdatum -- schönere Lösung gibts im nächsten Kapitel :)
		, HomePhone AS Telefonnummer
FROM Employees


-- bisschen schöner:
SELECT	  EmployeeID AS Mitarbeiternummer
		, CONCAT(FirstName, ' ', LastName) AS [vollständiger Name]
		, TitleOfCourtesy AS Anrede
		, CONVERT(varchar, BirthDate, 104) AS Geburtsdatum
		, HomePhone AS Telefonnummer
FROM Employees


SELECT *
FROM [Order Details]
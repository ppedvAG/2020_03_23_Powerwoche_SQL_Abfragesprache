-- Simple Select/einfache Abfragen

/*
	Text, Zahlen, Rechnungen

*/

-- Text unter Hochkommata setzen
SELECT 'Hallo'

-- Zahlen nicht
SELECT 123

-- Berechung:
SELECT 100*3

-- Text!
SELECT '100*3'


-- Spaltenüberschrift vergeben
-- ALIAS

SELECT 100*3 AS Berechnung



SELECT 100, 'Testtext', 'mehr Text', 100*3


-- Format??
SELECT 100, 
	'Testtext', 
	'mehr Text', -- Problem: Komma
--	100*3

-- bisschen schöner: alles kann auskommentiert werden und funktioniert trotzdem
SELECT   100
		, 'Testtext'
		, 'mehr Text'
--		, 100*3


-- Groß-/Kleinschreibung egal
select 100
SELECT 100

SELECT 100 -- STRG + SHIFT + U (UPPERCASE)
select 100 -- STRG + SHIFT + L (lowercase)


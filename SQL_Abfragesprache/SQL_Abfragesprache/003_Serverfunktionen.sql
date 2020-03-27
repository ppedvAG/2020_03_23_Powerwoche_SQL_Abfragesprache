-- häufige Serverfunktionen

-- *********************** String-Funktionen ***************************
--  TRIM, LEN, DATALENGTH

SELECT 'Test'
SELECT 'Test        '


SELECT RTRIM('Test        ')


-- Wieviele Zeichen sind das denn?
SELECT 'Test        '
SELECT RTRIM('Test        ')

SELECT LEN('Test        ') -- 4??

SELECT DATALENGTH('Test        ') -- 12
SELECT DATALENGTH(RTRIM('Test        ')) -- wieviele Zeichen sind es noch, nachdem wir die Leerzeichen weggeschnitten haben: 4

SELECT LTRIM('   Test')
SELECT TRIM('    Test   ')

-- DATALENGTH: Vorsicht bei Datentyp nvarchar oder nchar; doppelt so viel (wegen Unicode)!


-- DATENTYP! Unicode - doppelt so viel (CustomerID sind nur 5 Zeichen)
SELECT DATALENGTH(CustomerID) -- 10
FROM Customers

SELECT Len(CustomerID) -- 5
FROM Customers


-- ************************ REVERSE *******************************
-- Text in umgekehrter Reihenfolge anzeigen


SELECT REVERSE('REITTIER')
SELECT REVERSE('Trug Tim eine so helle Hose nie mit Gurt?')


-- ********************* LEFT, RIGHT, SUBSTRING ************************+

-- Zeichen ausschneiden

-- schneidet die ersten paar Zeichen aus
SELECT LEFT('Testtext', 4)

SELECT RIGHT('Testtext', 4)


-- Substring
SELECT SUBSTRING('Testtext', 4, 2)
-- wovon schneiden wir aus?
-- von welcher Stelle ausgehend?
-- wieviele Zeichen?


-- "reinstopfen" - STUFF
SELECT STUFF('Testtext', 5, 0, '_Hallo_')
-- Wo wollen wir was reinstopfen?
-- Bei welcher Stelle beginnend?
-- Wieviele Zeichen wollen wir weglöschen?
-- Was wollen wir einfügen?


--SELECT STUFF('Testtext', 4, 2, '_Hallo_')

/*
Angenommen, durch einen Fehler gibt es Leerzeichen in einem String:
'    Test    '
.a) Entferne die Leerzeichen
.b) Gib die Länge des Strings vorher und nachher in einer Tabelle aus:

*/
SELECT DATALENGTH('     Test     ') AS Vorher
		, DATALENGTH(TRIM('     Test     ')) AS Nachher


/*

Die letzten drei Stellen einer Telefonnummer sollen durch xxx ersetzt werden:
z.B.:  +49 86779889xxx
*/

-- Möglichkeit 1
SELECT STUFF('1234567890', DATALENGTH('1234567890')-2, 3, 'xxx')

-- Möglichkeit 2
SELECT STUFF('1234567890', 10, 3, 'xxx') -- geht nur bei gleicher Länge


SELECT	  Phone
		, STUFF(Phone, 10, 3, 'xxx')
FROM Customers


SELECT	  Phone
		, STUFF(Phone, (LEN(Phone)-2), 3, 'xxx') -- in diesem Fall mit LEN (weil Unicode!)
FROM Customers


-- Möglichkeit 3
SELECT LEFT('1234567890', 7) + 'xxx'  -- geht nur mit gleicher Länge
SELECT LEFT('1234567890', DATALENGTH('1234567890')-3) + 'xxx'




SELECT LEFT(Phone, LEN(Phone)-3) + 'xxx'
FROM Customers


-- Möglichkeit 4

SELECT REVERSE('1234567890') --0987654321


SELECT STUFF(REVERSE('1234567890'), 1, 3, 'xxx')


SELECT REVERSE(STUFF(REVERSE('1234567890'), 1, 3, 'xxx'))



SELECT REVERSE(STUFF(REVERSE(Phone), 1, 3, 'xxx'))
FROM Customers



-- ********************************** CONCAT ************************
-- Strings zusammenfügen


SELECT CONCAT('abc', 'def', 'ghi')

SELECT CONCAT('Ich weiß, ', 'dass ich', ' nichts weiß') AS Zitat

SELECT CONCAT('Ich weiß, ', 'dass ich', ' ', 'nichts weiß') AS Zitat


SELECT CONCAT('James', ' ', 'Bond') AS FullName


SELECT CONCAT(FirstName, ' ', LastName) AS Angestelltenname
FROM Employees



SELECT CONCAT(TRIM(FirstName), ' ', TRIM(LastName)) AS Angestelltenname
FROM Employees


-- William Shakespeare:

SELECT CONCAT(
			  LEFT('Wilham Shakesbeer', 3)
			, 'li'
			, SUBSTRING('Wilham Shakesbeer', 5, 9)
			, 'peare'
)


-- **************************** REPLICATE ****************
-- Zeichen oder Zeichenfolge mehrfach ausgeben

SELECT REPLICATE('?', 5) -- ?????

SELECT REPLICATE('abc', 3) -- abcabcabc

-- Groß- und Kleinbuchstaben
-- alles in Großbuchstaben:
SELECT UPPER('test')

SELECT UPPER(LastName)
FROM Employees

-- alles in Kleinbuchstaben
SELECT LOWER('TEST')
SELECT LOWER(LastName)
FROM Employees


-- ***************************** CHARINDEX *************************
-- an welcher Stelle befindet sich ein gesuchtes Zeichen?

SELECT CHARINDEX('a', 'Leo') -- 0 (gibts nicht)

-- Groß-/Kleinschreibung spielt bei Suche keine Rolle
SELECT CHARINDEX('f', 'ALFKI') -- 3
SELECT CHARINDEX('F', 'alfki') -- 3

-- man kann auch Leerzeichen suchen
SELECT CHARINDEX(' ', 'James Bond') -- 6

-- man kann auch nach Zeichenfolgen suchen
SELECT CHARINDEX('schnecke', 'Zuckerschnecke') -- 7 (die Stelle, an der die gesuchte Zeichenfolge beginnt)

-- Charindex gibt mir die ERSTE Stelle, an der das gesuchte Zeichen gefunden wird
SELECT CHARINDEX(' ', 'Wolfgang Amadeus Mozart')


-- wie bekomme ich denn das LETZTE Leerzeichen?

SELECT LEN('Wolfgang Amadeus Mozart') 
	- CHARINDEX(' ', REVERSE('Wolfgang Amadeus Mozart'))+1

	
SELECT LEN('Johann Sebastian Bach') 
	- CHARINDEX(' ', REVERSE('Johann Sebastian Bach'))+1

	
SELECT LEN('Klaus Maria Brandauer') 
	- CHARINDEX(' ', REVERSE('Klaus Maria Brandauer'))+1


-- wir können auch Sonderzeichen suchen
SELECT CHARINDEX('$', '450$')

SELECT CHARINDEX('%', '45%')


-- **************************** REPLACE ****************
-- bestimmte Zeichen ersetzen

SELECT REPLACE('Hallo!', 'a', 'e') -- Hello!

SELECT REPLACE(REPLACE(REPLACE('Hallo!', 'a', 'e'), '!', '?'), 'h', 'B') -- Bello?



-- Berechnungen

SELECT SQUARE(5)
SELECT SQRT(25)

/*
	Von der Telefonnummer aus der Customers-Tabelle sollen nur die letzten 3 Zeichen angezeigt werden; alle anderen sollen mit x ersetzt werden. (xxxxxxxxxxxxxxx789)

*/


-- Security-Variante:
SELECT	  CONCAT('xxxx', RIGHT(Phone, 3))
		, Phone
FROM Customers

-- andere Möglichkeit:
SELECT REPLICATE('x', LEN(Phone)-3) + RIGHT(Phone, 3)
		, Phone
FROM Customers

-- ****

SELECT	  CONCAT(REPLICATE('x', LEN(Phone)-3), RIGHT(Phone, 3)) AS Phone
		, Phone
FROM Customers
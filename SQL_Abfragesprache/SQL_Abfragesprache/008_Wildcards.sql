-- Wildcards nur beim LIKE
-- außer * beim SELECT (alle Spalten)

-- % steht für beliebig viele unbekannte Zeichen (0 - ?)
-- [] steht für genau ein Zeichen aus einem bestimmten Wertebereich
-- [] funktioniert auch mit Sonderzeichen
-- [] funktioniert für von-bis z.B. [a-c]

-- | steht für oder

-- ^ steht für NICHT z.B. '[^a-c]%' - NICHT mit a-c beginnend

-- _ steht für GENAU EIN unbekanntes Zeichen


-- alle, die mit ALF beginnen
SELECT *
FROM Customers
WHERE CustomerID LIKE 'ALF%'


-- alle, die mit MI enden
SELECT *
FROM Customers
WHERE CustomerID LIKE '%mi' -- Groß-/Kleinschreibung egal


-- alle, die ein 'kiste' im Namen haben
SELECT *
FROM Customers
WHERE CompanyName LIKE '%kiste%'


-- alle, deren Firmenname mit D beginnt?
SELECT *
FROM Customers
WHERE CompanyName LIKE 'D%'


-- Gib alle Produkte aus, deren Name mit „coffee“ endet.
SELECT *
FROM Products
WHERE ProductName LIKE '%coffee'


-- Gib alle Produkte aus, deren Name mit 'L' beginnt.
SELECT *
FROM Products
WHERE ProductName LIKE 'L%'


-- Gib alle Produkte aus, die ein 'ost' im Namen haben.
SELECT *
FROM Products
WHERE ProductName LIKE '%ost%'


-- alle Kunden, die mit a beginnen, irgendwo ein f haben
SELECT *
FROM Customers
WHERE CustomerID LIKE 'a%f%'


-- alle Kunden, die mit a beginnen, irgendwo ein f haben und aus Deutschland sind
SELECT *
FROM Customers
WHERE CustomerID LIKE 'a%f%' AND Country = 'Germany'



-- Bestellungen: alle von Angestellten 1, 3, 5, von Kunden, die mit r beginnen und deren Frachtkosten größer als 100 sind
SELECT *
FROM Orders
WHERE EmployeeID IN(1, 3, 5) AND CustomerID LIKE 'r%' AND Freight > 100


-- Gib alle Produkte aus, die vom Anbieter (SupplierID) 5, 10 oder 15 stammen, von denen mehr als 10 Stück vorrätig sind und deren Stückpreis unter 100 liegt. Ordne das Ergebnis absteigend vom höchsten zum niedrigsten Stückpreis.

SELECT *
FROM Products
WHERE SupplierID IN(5, 10, 15) AND UnitsInStock > 10 AND UnitPrice < 100
ORDER BY UnitPrice DESC


-- Wertebereiche angeben

-- Eckige Klammern bisher z.B. [vollständiger Name], [Order Details]
-- Eckige Klammern bei LIKE ... Wertebereich



-- alle Kunden, die mit a, b oder c beginnen
SELECT *
FROM Customers
WHERE CustomerID LIKE 'a%' OR CustomerID LIKE 'b%' OR CustomerID LIKE 'c%'

-- ODER:
SELECT *
FROM Customers
WHERE CustomerID LIKE '[a-c]%'


-- alle, die mit a ODER c beginnen
SELECT *
FROM Customers
WHERE CustomerID LIKE 'a%' OR CustomerID LIKE 'c%'

-- Oder:
SELECT *
FROM Customers
WHERE CustomerID LIKE '[ac]%'


-- mit Sonderzeichen
SELECT *
FROM Customers
WHERE CompanyName LIKE '%[%]%'


-- alle, die ein Hochkomma im Namen haben?
SELECT *
FROM Customers
WHERE CompanyName LIKE '%''%'


-- andere Version für Suche nach Sonderzeichen: ESCAPE
SELECT *
FROM Customers
WHERE CompanyName LIKE '%!%%' ESCAPE '!'



-- alle CompanyNames, die mit a oder c beginnen und mit einem m oder e enden
SELECT *
FROM Customers
WHERE CompanyName LIKE '[ac]%' OR CompanyName LIKE '%[me]'

-- oder:
SELECT *
FROM Customers
WHERE CompanyName LIKE '[ac]%[me]'


-- Gib alle Produkte aus, deren Name mit D-L beginnt und mit a, b, c, d oder m, n, o endet.
SELECT *
FROM Products
WHERE ProductName LIKE '[d-l]%[abcdmno]'

-- oder:
SELECT *
FROM Products
WHERE ProductName LIKE '[d-l]%' AND (ProductName LIKE '%[a-d]' OR ProductName LIKE '%[m-o]')

-- oder:
SELECT *
FROM Products
WHERE ProductName LIKE '[d-l]%[a-d|m-o]' -- | steht für oder


-- unsere CustomerID besteht aus 5 Buchstaben
-- angenommen, es ist ein Fehler passiert
-- CMXY5 ... wie finde ich die falschen Einträge?
-- lskdjlfkjsldkjf 
-- csb?ss
-- a2b3c


-- wie finde ich denn das, was erlaubt ist:
SELECT *
FROM Customers
WHERE CustomerID LIKE '[a-z][a-z][a-z][a-z][a-z]'
--oder:
SELECT *
FROM Customers
WHERE CustomerID LIKE REPLICATE('[a-z]', 5)

-- falsche Einträge:
SELECT *
FROM Customers
WHERE CustomerID NOT LIKE REPLICATE('[a-z]', 5)



-- bei PinCode z.B.
--SELECT *
--FROM Tabelle
--WHERE Pin NOT LIKE '[0-9][0-9][0-9][0-9]'



-- NOT - nicht als Wildcard:

-- alle, die NICHT mit a, b oder c beginnen
SELECT *
FROM Customers
WHERE CompanyName LIKE '[^a-c]%' -- ^ steht für NICHT, also alle, die NICHT mit a-c beginnen


-- nach genau einem unbekannten Zeichen suchen

SELECT *
FROM Customers
WHERE Fax LIKE '(5) 555-729_'


-- alle Kunden (CompanyName), die mit d, e oder f beginnen, der letzte Buchstabe ist ein l und der drittletzte ein d

SELECT *
FROM Customers
WHERE CompanyName LIKE '[d-f]%d_l'


/*
	ddxl
	edel
	fxxxxxxxxxxxxxxdxl

	Ernst Handel (in Northwind DB)
	e........d.l


*/

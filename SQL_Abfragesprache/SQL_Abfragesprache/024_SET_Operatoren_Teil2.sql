-- SET Operatoren
-- UNION, UNION ALL
-- INTERSECT, EXCEPT


-- UNION macht DISTINCT
SELECT 'Testtext'
UNION
SELECT 'Testtext'

-- wenn ich kein DISTINCT möchte, dann UNION ALL
SELECT 'Testtext'
UNION ALL
SELECT 'Testtext'


-- **************** INTERSECT, EXCEPT *********************

CREATE TABLE #a (id INT)

CREATE TABLE #b (id INT)


INSERT INTO #a (id) VALUES (1), (NULL), (2), (1)


INSERT INTO #b (id) VALUES (1), (NULL), (3), (1)

-- UNION
SELECT id
FROM #a
UNION
SELECT id
FROM #b
-- NULL, 1, 2, 3


-- UNION ALL
SELECT id
FROM #a
UNION ALL
SELECT id
FROM #b
-- 1, NULL, 2, 1, 1, NULL, 3, 1


-- INTERSECT - was ist gleich?
SELECT id
FROM #a
INTERSECT
SELECT id
FROM #b
-- NULL, 1

-- EXCEPT - was ist NICHT gleich?
SELECT id
FROM #a
EXCEPT
SELECT id
FROM #b
-- das, was in der Tabelle a vorkommt, aber nicht in Tabelle b
-- 2

-- umgekehrte Reihenfolge:
SELECT id
FROM #b
EXCEPT
SELECT id
FROM #a
-- wir bekommen das, was in Tabelle b vorkommt, aber nicht in Tabelle a
-- 3

-- INNER JOIN
SELECT a.id
FROM #a a INNER JOIN #b b ON a.id = b.id
-- 1, 1, 1, 1






-- VIEW WITH CHECK OPTION

CREATE TABLE Helden(
		firstname varchar(50),
		lastname varchar(50),
		age smallint
		)

INSERT INTO Helden (firstname, lastname, age)
VALUES ('James', 'Bond', 40),
	   ('Bruce', 'Wayne', 35),
	   ('Peter', 'Parker', 23)

SELECT * FROM Helden


CREATE VIEW v_TestHelden
AS
SELECT firstname, lastname, age
FROM Helden
WHERE age IS NOT NULL

SELECT *
FROM v_TestHelden

INSERT INTO Helden (firstname, lastname, age)
VALUES ('Clark', 'Kent', NULL)


INSERT INTO v_TestHelden (firstname, lastname, age)
VALUES ('Luke', 'Skywalker', 18)


SELECT * FROM Helden



INSERT INTO v_TestHelden (firstname, lastname, age)
VALUES ('Obi Wan', 'Kenobi', NULL)


SELECT * FROM v_TestHelden

SELECT * FROM Helden


DROP VIEW v_TestHelden



CREATE VIEW v_TestHelden
AS
SELECT firstname, lastname, age
FROM Helden
WHERE age IS NOT NULL
WITH CHECK OPTION


SELECT * FROM v_TestHelden

INSERT INTO v_TestHelden (firstname, lastname, age)
VALUES ('Mickey', 'Mouse', 42)


INSERT INTO v_TestHelden (firstname, lastname, age)
VALUES ('Donald', 'Duck', NULL)

SELECT * FROM Helden

INSERT INTO Helden
VALUES ('Donald', 'Duck', NULL)

SELECT * FROM Helden

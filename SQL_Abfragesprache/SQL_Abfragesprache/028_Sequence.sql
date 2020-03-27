-- seit SQL Server 2012

CREATE SEQUENCE test_sq
	START WITH 1
	INCREMENT BY 1

CREATE SEQUENCE test_sq2
	START WITH 1
	INCREMENT BY 1


-- SELECT NEXT VALUE FOR


CREATE TABLE SeqTest
	(
		ID int PRIMARY KEY,
		Testname varchar(50),
		Testnumber int
	)

	
INSERT INTO SeqTest (ID, Testname, Testnumber)
VALUES (NEXT VALUE FOR test_sq, 'Mickey', 123),
	(NEXT VALUE FOR test_sq, 'Donald', 345),
	(NEXT VALUE FOR test_sq, 'Minnie', 689)



CREATE TABLE SeqTest2
	(
		ID int PRIMARY KEY
			DEFAULT (NEXT VALUE FOR test_sq2),
		Testname varchar(50),
		Testnumber int
	)


INSERT INTO SeqTest2 (Testname, Testnumber)
VALUES ('Mickey', 123),
	('Donald', 345),
	('Minnie', 689)
		



SELECT * FROM SeqTest


SELECT * FROM SeqTest2

CREATE TABLE SeqTest3
	(
		ID int PRIMARY KEY
			DEFAULT (NEXT VALUE FOR test_sq2),
		Testname varchar(50),
		Testnumber int
	)

	
INSERT INTO SeqTest3 (Testname, Testnumber)
VALUES ('Mickey', 123),
	('Donald', 345),
	('Minnie', 689)

	
SELECT * FROM SeqTest3


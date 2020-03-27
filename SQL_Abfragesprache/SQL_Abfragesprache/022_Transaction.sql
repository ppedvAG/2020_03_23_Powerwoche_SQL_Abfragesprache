-- Transaction

USE MyTestDB
INSERT INTO Kunde(Vorname, Nachname)
VALUES ('Mickey', 'Mouse'),
		('Donald', 'Duck'),
		('Kater', 'Karlo'),
		('Daisy', 'Duck')

SELECT *
FROM Kunde



BEGIN TRAN UserNameUpdate
	
	UPDATE Kunde
	SET Vorname = 'Minnie'
	WHERE KundenID = 102

-- ROLLBACK TRAN --?

-- COMMIT TRAN --?


SELECT *
FROM Kunde
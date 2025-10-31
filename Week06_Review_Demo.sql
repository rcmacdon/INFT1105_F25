-- -----------------------------
-- Title:	Week 6 - Review
-- Author:	Clint MacDonald
-- Date:	October. 14, 2025
-- Purpose:	Preparing for the midterm test, and getting caught up
-- -----------------------------

SELECT * FROM players
WHERE firstname = 'clint';

SELECT * FROM players
ORDER BY firstname;

SELECT * FROM players
WHERE LOWER(firstname) = 'clint';


SELECT 
	firstname + ' ' + lastname AS fullname,
	regnumber
FROM players
WHERE UPPER(firstname + ' ' + lastname) LIKE 'C%'
ORDER BY fullname;

SELECT firstname
from players

-- ----------------------------
-- Title:	Week 8 - Intro to SQL Review
-- Author:	Clint MacDonald
-- Date:	Oct. 31, 2025
-- Purpose: To review Intro to SQL and get ready to move forward next week
-- ----------------------------

-- DML, DDL, TCL
-- DML - Data Manipulation Language - About the Data
-- DDL - Data Definition Language - About the Structure
-- TCL - Transaction Control Language - Multi-Statement Algorithms

-- DML Basics

-- CRUD
-- Create	- INSERT
-- Read		- SELECT
-- Update	- UPDATE
-- Delete	- DELETE

-- DDL
-- Statements
-- CREATE TABLE
-- ALTER
-- DROP
-- CREATE VIEW
-- CREATE PROCEDURE
-- CREATE FUNCTION
-- CREATE TRIGGER

-- ---------------------------------
-- SELECT

-- SELECT * FROM table;
-- * means all columns
-- we get all rows because there is no WHERE clause

SELECT * FROM teams;

SELECT teamname
FROM teams;

SELECT 
	teamid,
	teamname
FROM teams;

SELECT CONCAT(firstname, ' ', lastname) AS full_name
FROM players;

SELECT firstname + ' ' + lastname AS fullname
FROM players;

SELECT firstname + ' ' + lastname AS fullname
FROM players
ORDER BY lastname;

SELECT firstname + ' ' + lastname AS fullname
FROM players
ORDER BY lastname DESC;

SELECT firstname + ' ' + lastname AS fullname
FROM players
ORDER BY 
	lastname, 
	firstname;


SELECT firstname + ' ' + lastname AS fullname
FROM players
ORDER BY fullname;

-- WHERE
SELECT *
FROM players
WHERE playerID > 10000 AND playerID < 100000000
ORDER BY playerID;

SELECT *
FROM players
WHERE playerID BETWEEN 10000 AND 100000000
ORDER BY playerID;

-- Wildcards

-- output all players whose first name starts with S
SELECT *
FROM players
WHERE UPPER(firstname) LIKE 'S%'
ORDER BY firstname;

-- output all players whose first name starts with S or M
SELECT *
FROM players
WHERE 
	UPPER(firstname) LIKE 'S%'
	OR UPPER(firstname) LIKE 'M%'
ORDER BY firstname;

-- output all players whose first name starts with S or M and their last name starts with T
SELECT *
FROM players
WHERE 
	UPPER(firstname) LIKE 'S%'
	OR UPPER(firstname) LIKE 'M%'
	AND LOWER(lastname) LIKE 't%'
ORDER BY firstname;
-- does not run as expected because of ORDER OF PRECEDENCE  (AND goes before OR)
-- Order of Precedence is an extension to Order of Operations (BEDMAS, AND, OR)

SELECT *
FROM players
WHERE 
	(UPPER(firstname) LIKE 'S%'
	OR UPPER(firstname) LIKE 'M%')
	AND LOWER(lastname) LIKE 't%'
ORDER BY firstname;

-- ORDER OF EXECUTION

SELECT firstname + ' ' + lastname AS fullname
FROM players
WHERE UPPER(fullname) LIKE 'A%'
ORDER BY fullname;
-- SQL code DOES NOT run top to bottom

-- ORDER OF EXECUTION
-- 1) FROM - source of the data
-- 2) WHERE - filter out unwanted data
-- 3) SELECT - what columns we want to see
-- 4) ORDER BY - sort the data

-- At the time the above WHERE clause executes, the fullname alias DOES NOT EXIST

SELECT firstname + ' ' + lastname AS fullname
FROM players
WHERE UPPER(firstname) LIKE 'A%'
ORDER BY fullname;

-- CRUD

-- INSERT
-- Adding new data to the database

-- LONG WAY
-- INSERT INTO <tablename> 
--		( comma separated field list) 
--		VALUES 
--		(comma separated value list);

-- Columns can be in any order, and only includes those you want...  
--                              except ALL NOT NULL columns MUST be included.

INSERT INTO locations
	( locationID, locationname, isactive)
	VALUES
	( 90, 'temp location', 1 );

-- SHORT WAY
-- INSERT INTO <tablename> 
--		VALUES (comma separated value list);

-- ALL fields, except autonumber fields, must be included in the order they were created 
--                                (NOT NULL is irrelevent)

INSERT INTO locations
	VALUES ( 91, 'temp location 2', null, 1);

-- if the PK is autonumber (identity) then skip it all together

SELECT * FROM locations;


-- UPDATE

-- UPDATE <tablename>
--		SET		<fieldname> = <value>,
-- 				<fieldname> = <value>,
--				....
--				<fieldname> = <value>
-- WHERE <filter criteria>;

UPDATE players
	SET lastname = 'MacDonald';
	-- OH SHIT!
	-- I JUST GOT FIRED

UPDATE players
	SET lastname = 'MacDonald'
WHERE lastname = 'Smith';
-- not UNIQUE ENOUGH
UPDATE players
	SET lastname = 'MacDonald'
WHERE playerid = 123456;


-- DELETE STATEMENT
-- DELETE FROM <tablename>
-- WHERE <filter criteria>

DELETE FROM players;
DELETE FROM goalscorers;
-- DAMN, don't forget the WHERE clause
-- again, make sure the WHERE clause is UNIQUE enough.....


SELECT * FROM players;












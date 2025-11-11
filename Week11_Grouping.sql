-- *********************************
-- INFT1105 Week 11
-- Clint MacDonald
-- Nov. 11 and 18, 2025
-- Sub-Queries 
-- ******************

-- Different types of Queries

-- Three different kinds
-- 1) Table		- all SELECT statements (unknown # rows, unknown # cols)
-- 2) List      - mostly 1 column results (unknown # rows) (can be 2 columns)
-- 3) Scalar    - 1 row and 1 column (i.e. 1 value)

-- How many players are not currently on a team?

-- an easier way to understand this is:
-- TOTAL number players - players on teams!
-- = 595 - 230
-- = 365
SELECT (
	(SELECT COUNT(playerID) FROM players)
	- 
	(SELECT COUNT(DISTINCT playerID) FROM rosters)
	);

-- Table, list, or Scalar
SELECT teamid
FROM teams
WHERE teamname = 'Noobs';
-- LIST 

SELECT teamname
FROM teams
WHERE teamID = 212;

-- example:
-- trophy for the player who scored the most goals in a single game.

-- first - how many goals was the most?
SELECT MAX(numGoals) as mostGoals
FROM goalscorers;
-- answer is 5

-- which playerid did this?
SELECT playerID 
FROM goalscorers
WHERE numGoals = 5;
-- 2190470

-- who is this?
SELECT
	firstname,
	lastname
FROM players
WHERE playerID = 2190470;

-- but this is all Hard Coded
SELECT
	firstname,
	lastname
FROM players
WHERE playerID IN (
	SELECT playerID 
	FROM goalscorers
	WHERE numGoals = (
		SELECT MAX(numGoals)
		FROM goalscorers
		)
	);





-- *********************************
-- INFT1105 Week 10
-- Clint MacDonald
-- Nov. 11, 2025
-- Grouping and Aggregate Functions 
-- *********************************

-- read dbs211.ca - go to dbs710, week 2 (Supplementary reading)
-- http://dbs211.ca/courses/dbs710/Week02.html

-- There are only 7 Aggregate Functions
-- COUNT
-- SUM
-- AVG (AVERAGE)
-- MIN
-- MAX
-- STDDEV (Standard Deviation)
-- VAR (Variance)

-- How many players are in the database?
SELECT COUNT(*) 
FROM players;
-- using * here is inefficient

SELECT COUNT(playerID) 
FROM players;
-- much more efficent!

-- How many players are actively assigned to a team?

SELECT COUNT(rosterID)
FROM rosters
WHERE isActive = 1;

-- what if I want to only count the player once if they are there twice!
-- we need th DISTINCT keyword
SELECT COUNT(DISTINCT playerID)
FROM rosters
WHERE isActive = 1;

-- How many players are NOT on a team?

SELECT
	COUNT(p.playerID) AS numPlayers
FROM 
	players p
	LEFT JOIN rosters r ON p.playerID = r.playerID
WHERE r.playerID IS NULL;

-- How many players on each team
SELECT
	teamname,
	COUNT(playerID) AS numPlayers
FROM
	teams t
	JOIN rosters r ON t.teamid = r.teamid
GROUP BY 
	t.teamid,
	teamname
ORDER BY teamname;

-- Clint's Law
-- Any field included in the SELECT clause that is NOT part of 
-- an aggregate function or a sub-query, MUST be included in the
-- GROUP BY clause.

SELECT COUNT(teamID) FROM teams;
-- so there is a team missing!
-- how do we include ALL teams!
SELECT
	teamname,
	COUNT(playerID) AS numPlayers
FROM
	teams t
	LEFT JOIN rosters r ON t.teamid = r.teamid
GROUP BY 
	t.teamid,
	teamname
ORDER BY teamname;

-- exact same question
-- but only include teams with less than 19 players
SELECT
	teamname,
	COUNT(playerID) AS numPlayers
FROM
	teams t
	LEFT JOIN rosters r ON t.teamid = r.teamid
GROUP BY 
	t.teamid,
	teamname
HAVING 
	COUNT(playerID) < 19
ORDER BY teamname;
-- Problem

-- ORDER OF EXECUTION
-- ---------------------------
-- FROM with JOIN
-- WHERE
-- GROUP BY
-- HAVING
-- SELECT as a loop
-- ORDER BY


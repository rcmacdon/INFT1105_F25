-- ----------------------------------------
-- Title:	INFT1105 - Week 9 
-- Author:	Clint MacDonald
-- Date:	Nov. 4, 2025
-- Purpose:	Introduction to JOINs
-- ----------------------------------------

-- Also looking at Table Aliases

-- Example 1
-- Using the teamID, list all players by name who play on a given team
-- use teamid = 212 for this example
SELECT
	p.playerID,
	r.playerID,
	teamID,
	firstname,
	lastname,
	r.isActive
FROM players p, rosters r  -- ANSI89 JOIN  NEVER NEVER NEVER NEVER
WHERE p.playerID = r.playerID;

-- ANSI92 , invented 1992 changed this...
SELECT
	p.playerID,
	teamID,
	firstname,
	lastname,
	r.isActive
FROM 
	players p 
	JOIN rosters r ON p.playerID = r.playerID
	-- ANSI92 JOIN  YES YES YES YES
WHERE teamID = 212;

-- INNER JOIN

-- Example 2
-- List all teams by name, and the names of the players on the team
SELECT
	teamname,
	firstname,
	lastname
FROM
	players p
	JOIN rosters r ON p.playerid = r.playerid
	JOIN teams t ON r.teamid = t.teamid
ORDER BY
	teamname,
	lastname,
	firstname;

-- Example 3:
-- End of the season banquet.
-- invite ALL players... even if they are not on a team....
-- but...I need to know what team the player is on...

-- we need OUTER JOINs
SELECT
	firstname,
	lastname,
	teamname
FROM
	players p LEFT OUTER JOIN rosters r ON p.playerid = r.playerid
	LEFT OUTER JOIN teams t ON r.teamid = t.teamid
ORDER BY
	lastname,
	firstname;

-- Example 4
-- List ALL locations, and which games are played there.  
-- Make sure to include all locations even if no games are played there.
SELECT
	l.locationid,
	locationname,
	gameid,
	gamedatetime
FROM locations l
	LEFT OUTER JOIN games g ON l.locationid = g.locationid
ORDER BY
	locationname,
	gamedatetime;

	-- is the EXACT SAME AS:
SELECT
	l.locationid,
	locationname,
	gameid,
	gamedatetime
FROM games g
	RIGHT OUTER JOIN locations l ON l.locationid = g.locationid
ORDER BY
	locationname,
	gamedatetime;

-- Example 5:
-- List all players, and 
-- if they scored a goal, how many goals did they score in each game
SELECT
	firstname,
	lastname,
	numGoals
FROM 
	players p
	LEFT JOIN goalscorers gs ON p.playerid = gs.playerid
ORDER BY 
	lastname, 
	firstname;


-- INVERSE JOINS  (not matching only)
-- List all teams, that do not have any players registered!

SELECT
	t.teamID,
	teamname
FROM teams t
	LEFT JOIN rosters r ON t.teamID = r.teamID
WHERE r.teamID IS NULL
ORDER BY teamname;


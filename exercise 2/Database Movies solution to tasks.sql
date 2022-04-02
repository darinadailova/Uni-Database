--Exercise 2

--Tasks 1
--Напишете заявка, която извежда имената на актьорите мъже, участвали във
--филма The Usual Suspects. 
(SELECT STARNAME
FROM dbo.STARSIN
WHERE MOVIETITLE = 'The Usual Suspects')
INTERSECT
(SELECT NAME
FROM dbo.MOVIESTAR
WHERE GENDER = 'M');

--Task 2
--Напишете заявка, която извежда имената на актьорите, участвали във филми от
--1995, продуцирани от студио MGM.
SELECT STARNAME
FROM dbo.STARSIN
WHERE MOVIEYEAR = 1995 
AND MOVIETITLE IN (SELECT TITLE
			       FROM dbo.MOVIE
				   WHERE STUDIONAME = 'MGM');

--Task 3
--Напишете заявка, която извежда имената на продуцентите, които са
--продуцирали филми на студио MGM.
SELECT NAME
FROM dbo.MOVIEEXEC
WHERE CERT# IN (SELECT PRODUCERC#
				FROM dbo.MOVIE
				WHERE STUDIONAME = 'MGM');

--Task 4
--Напишете заявка, която извежда имената на всички филми с дължина, поголяма от дължината на филма Star Wars.
SELECT TITLE
FROM dbo.MOVIE
WHERE LENGTH > (SELECT LENGTH
				FROM DBO.MOVIE
				WHERE TITLE = 'Star Wars');

--Task 5
--Напишете заявка, която извежда имената на продуцентите с нетни активи поголеми от тези на Stephen Spielberg.
SELECT CERT#
FROM dbo.MOVIEEXEC
WHERE NETWORTH > (SELECT NETWORTH
				  FROM dbo.MOVIEEXEC
				  WHERE NAME = 'Stephen Spielberg');

--Task 6
--Напишете заявка, която извежда имената на всички филми, които са
--продуцирани от продуценти с нетни активи по-големи от тези на Stephen
--Spielberg.
SELECT TITLE 
FROM dbo.MOVIE
WHERE PRODUCERC# IN (SELECT CERT#
					 FROM dbo.MOVIEEXEC
                     WHERE NETWORTH > (SELECT NETWORTH
				                       FROM dbo.MOVIEEXEC
				                       WHERE NAME = 'Stephen Spielberg'));
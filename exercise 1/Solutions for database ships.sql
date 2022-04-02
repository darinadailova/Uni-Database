--exercise 1

--Tasks for database Ships
--Task 1
--Напишете заявка, която извежда класа и страната за всички класове с помалко от 10 оръдия.
SELECT CLASS, COUNTRY
FROM dbo.CLASSES
WHERE NUMGUNS < 10;

--Task 2
--Напишете заявка, която извежда имената на корабите, пуснати на вода
--преди 1918. Задайте псевдоним shipName на колоната.
SELECT NAME AS SHIPNAME
FROM dbo.SHIPS
WHERE LAUNCHED < 1918;

--Task 3
--Напишете заявка, която извежда имената на корабите потънали в битка и
--имената на съответните битки.
SELECT SHIP, BATTLE
FROM dbo.OUTCOMES
WHERE RESULT = 'sunk';

--Task 4
--Напишете заявка, която извежда имената на корабите с име, съвпадащо
--с името на техния клас.
SELECT NAME
FROM dbo.SHIPS
WHERE NAME = CLASS;

--Task 5
--Напишете заявка, която извежда имената на корабите, които започват с
--буквата R.
SELECT NAME
FROM dbo.SHIPS
WHERE NAME LIKE 'r%';

--Task 6
--Напишете заявка, която извежда имената на корабите, които съдържат 2
--или повече думи.
SELECT NAME
FROM dbo.SHIPS
WHERE NAME LIKE '% %';
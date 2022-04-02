-- exercise 1 

--tasks for database movies

--Task 1
--Напишете заявка, която извежда адреса на студио ‘Disney’
select ADDRESS
from dbo.studio
where name = 'Disney';

--Task2
--Напишете заявка, която извежда рождената дата на актьора Jack
--Nicholson
select birthdate
from dbo.MOVIESTAR
where name = 'Jack Nicholson';

--Task 3
--Напишете заявка, която извежда имената на актьорите, които са
--участвали във филм от 1980 или във филм, в чието заглавие има думата
--‘Knight’
select starname
from dbo.STARSIN
where MOVIEYEAR = 1980 OR MOVIETITLE = '%Knight%';

--Task 4
--Напишете заявка, която извежда имената на продуцентите с нетни
--активи над 10 000 000 долара
select name
from dbo.MOVIEEXEC
where NETWORTH > 10000000;

--Task 5
--Напишете заявка, която извежда имената на актьорите, които са мъже
--или живеят на Prefect Rd.
select name
from dbo.MOVIESTAR
where GENDER = 'M' or ADDRESS = 'Prefect Rd';
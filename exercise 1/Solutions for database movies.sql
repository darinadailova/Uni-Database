-- exercise 1 

--tasks for database movies
--Task 1
select ADDRESS
from dbo.studio
where name = 'Disney';

--Task2
select birthdate
from dbo.MOVIESTAR
where name = 'Jack Nicholson';

--Task 3
select starname
from dbo.STARSIN
where MOVIEYEAR = 1980 OR MOVIETITLE = '%Knight%';

--Task 4
select name
from dbo.MOVIEEXEC
where NETWORTH > 10000000;

--Task 5
select name
from dbo.MOVIESTAR
where GENDER = 'M' or ADDRESS = 'Prefect Rd';
--Exercise 3

--Movies

--Task 1
--Напишете заявка, която извежда имената на актрисите, които са също и
--продуценти с нетни активи над 10 милиона.
select actress.NAME
from dbo.MOVIESTAR actress
where actress.GENDER = 'F' and exists (select director.NAME
							          from dbo.MOVIEEXEC director
								      where actress.NAME = director.NAME
									  and director.NETWORTH > 10000000);

--Task 2
--Напишете заявка, която извежда имената на тези актьори (мъже и жени),
--които не са продуценти.
select actor.name
from dbo.MOVIESTAR actor
where actor.NAME not in (select director.NAME
						 from dbo.MOVIEEXEC director
						 );

--Task 3
--Напишете заявка, която извежда имената на всички филми с дължина,
--по-голяма от дължината на филма ‘Star Wars’
select title
from dbo.MOVIE
where LENGTH > (select LENGTH
				from dbo.MOVIE
				where TITLE = 'Star Wars');

--Task 4
--Напишете заявка, която извежда имената на продуцентите и имената на
--филмите за всички филми, които са продуцирани от продуценти с нетни
--активи по-големи от тези на ‘Merv Griffin’
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
select movie.TITLE, director.NAME
from MOVIE movie, MOVIEEXEC director
where movie.PRODUCERC# in (select cert#
						   from MOVIEEXEC
						   where NETWORTH > (select NETWORTH
						                     from MOVIEEXEC
											 where NAME = 'Merv Griffin'))
and
movie.PRODUCERC# = director.CERT#;

--PC
--Task 1
--Напишете заявка, която извежда производителите на персонални
--компютри с честота над 500.
select maker
from product
where type = 'PC' 
and model in (select model
			  from pc
			  where speed > 500);

--Task 2
--Напишете заявка, която извежда код, модел и цена на принтерите с най-висока цена.
select code, model, price
from printer
where price >= all (select price
				   from printer
				   );

--Task 3
--Напишете заявка, която извежда лаптопите, чиято честота е по-ниска от
--честотата на всички персонални компютри.
select *
from laptop
where speed < all (select speed
			   from pc)
--Task 4
--Напишете заявка, която извежда модела и цената на продукта (PC,
--лаптоп или принтер) с най-висока цена.
select model, price
from pc
where price >= all (select price from pc
					union
					select price from laptop
					union
					select price from printer
				   )
union

select model, price
from laptop
where price >= all (select price from pc
					union
					select price from laptop
					union
					select price from printer
				   )
union

select model, price
from printer
where price >= all (select price from pc
					union
					select price from laptop
					union
					select price from printer
				   );

--Task 5
--Напишете заявка, която извежда производителя на цветния принтер с
--най-ниска цена.
select pr.maker
from product pr, printer printer
where printer.color = 'y'
and printer.price <= all (select price from printer where color = 'y')
and pr.model = printer.model;

--Task 6
--Напишете заявка, която извежда производителите на тези персонални
--компютри с най-малко RAM памет, които имат най-бързи процесори.
select maker
from product
where model in (select p.model
				from pc p
				where ram <= ALL(select ram from pc)
				and speed >= ALL(select speed from pc where ram=p.ram));

--SHIPS
--Task 1
--Напишете заявка, която извежда страните, чиито кораби са с най-голям
--брой оръдия.
select distinct COUNTRY
from CLASSES
where NUMGUNS >= all (select NUMGUNS from CLASSES);

--Task 2
--Напишете заявка, която извежда класовете, за които поне един от
--корабите е потънал в битка.
select distinct cl.CLASS
from CLASSES cl, OUTCOMES o, Ships s
where o.RESULT = 'sunk'
and s.CLASS = cl.CLASS
and s.NAME = o.SHIP;

--Task 3
--Напишете заявка, която извежда името и класа на корабите с 16 инчови
--оръдия.
select s.NAME, s.CLASS
from CLASSES cl, SHIPS s
where cl.BORE = 16
and s.CLASS = cl.CLASS;

--Task 4
--Напишете заявка, която извежда имената на битките, в които са
--участвали кораби от клас ‘Kongo’.
select o.BATTLE
from OUTCOMES o, SHIPS s
where o.SHIP = s.NAME
and s.CLASS = 'Kongo';

--Task 5
--Напишете заявка, която извежда класа и името на корабите, чиито брой
--оръдия е по-голям или равен на този на корабите със същия калибър
--оръдия.
select cl.CLASS, s.NAME
from SHIPS s, CLASSES cl
where cl.NUMGUNS >= all (select NUMGUNS from CLASSES where BORE = cl.BORE)
and s.CLASS = cl.CLASS;
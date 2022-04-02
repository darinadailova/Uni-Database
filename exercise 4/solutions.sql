--Exercise 4

--Movies

--Task 1
--Напишете заявка, която извежда името на продуцента и имената на
--филмите, продуцирани от продуцента на филма ‘Star Wars’.
select movie.TITLE, movieexe.NAME
from MOVIE movie
inner join MOVIEEXEC movieexe on movie.PRODUCERC# = movieexe.CERT#
where movie.PRODUCERC# = (select MOVIE.PRODUCERC#
                          from MOVIE
						  where MOVIE.TITLE = 'Star Wars');

--Task 2
--Напишете заявка, която извежда имената на продуцентите на филмите, в
--които е участвал ‘Harrison Ford’.
select distinct director.NAME
from MOVIEEXEC director
join MOVIE mv on mv.PRODUCERC# = director.CERT#
where mv.TITLE in (select STARSIN.MOVIETITLE
				   from STARSIN
				   where STARSIN.STARNAME = 'Harrison Ford');

--Task 3
--Напишете заявка, която извежда името на студиото и имената на
--актьорите, участвали във филми, произведени от това студио, подредени
--по име на студио.
select distinct mv.STUDIONAME, stars.STARNAME
from MOVIE mv
join STARSIN stars on stars.MOVIETITLE = mv.TITLE
order by mv.STUDIONAME;

--Task 4
--Напишете заявка, която извежда имената на актьорите, участвали във
--филми на продуценти с най-големи нетни активи.
select stars.STARNAME
from STARSIN stars
join MOVIE mv on mv.TITLE = stars.MOVIETITLE
where mv.PRODUCERC# in (select MOVIEEXEC.CERT#
	                    from MOVIEEXEC
						where MOVIEEXEC.NETWORTH >= all (select MOVIEEXEC.NETWORTH from MOVIEEXEC));

--Task 5
--Напишете заявка, която извежда имената на актьорите, които не са
--участвали в нито един филм.
select mv.NAME, stars.MOVIETITLE
from MOVIESTAR mv
left join STARSIN stars on stars.STARNAME = mv.NAME
where stars.MOVIETITLE is null;

--PC

--Task 1
--Напишете заявка, която извежда производител, модел и тип на продукт
--за тези производители, за които съответният продукт не се продава
--(няма го в таблиците PC, Laptop или Printer)
select p.maker, p.model, p.type
from product p
where p.model not in (select model from laptop
                      union
					  select model from pc
					  union
					  select model from printer);

--Task 2
--Намерете всички производители, които правят както лаптопи, така и
--принтери
select distinct p.maker
from product p
join product p2 on p.maker = p2.maker
where p.type = 'Laptop' and p2.type = 'Printer';

--Task 3
--Намерете размерите на тези твърди дискове, които се появяват в два
--или повече модела лаптопи.
select distinct l1.hd
from laptop l1
join laptop l2 on l1.hd = l2.hd and l1.model != l2.model;

--Task 4
--Намерете всички модели персонални компютри, които нямат регистриран
--производител.
select p.model
from pc p
where p.model not in (select model from product where type = 'PC');

--SHIPS

--Task 1
--Напишете заявка, която извежда цялата налична информация за всеки
--кораб, включително и данните за неговия клас. В резултата не трябва да
--се включват тези класове, които нямат кораби.
select * 
from ships
inner join classes on classes.class = ships.class
order by name;

--Task 2
--Повторете горната заявка, като този път включите в резултата и
--класовете, които нямат кораби, но съществуват кораби със същото име
--като тяхното.
select * 
from ships
right join classes on classes.class = ships.class
order by name;

--Task 3
--За всяка страна изведете имената на корабите, които никога не са
--участвали в битка.
select cl.COUNTRY, s.NAME
from SHIPS s
join CLASSES cl on s.CLASS = cl.CLASS
where s.NAME not in (select SHIP from OUTCOMES)
order by COUNTRY;

--Task 4
--Намерете имената на всички кораби с поне 7 оръдия, пуснати на вода
--през 1916, но наречете резултатната колона Ship Name.select s.NAME as ShipNamefrom SHIPS sjoin CLASSES cl on s.CLASS = cl.CLASSwhere s.LAUNCHED = 1916 and cl.NUMGUNS >= 7;--Task 5--Изведете имената на всички потънали в битка кораби, името и дата на
--провеждане на битките, в които те са потънали. Подредете резултата по
--име на битката.
select o.SHIP, b.NAME, b.DATE
from OUTCOMES o
right join BATTLES b on b.NAME = o.BATTLE
where o.RESULT = 'sunk'
order by b.NAME;

--Task 6
--Намерете името, водоизместимостта и годината на пускане на вода на
--всички кораби, които имат същото име като техния клас.
select s.NAME, cl.DISPLACEMENT, s.LAUNCHED
from CLASSES cl
join SHIPS s on s.CLASS = cl.CLASS
where s.NAME = cl.CLASS;

--Task 7
--Намерете всички класове кораби, от които няма пуснат на вода нито един
--кораб.
select *
from CLASSES
where CLASS not in (select class from SHIPS);

--Task 8
--Изведете името, водоизместимостта и броя оръдия на корабите,
--участвали в битката ‘North Atlantic’, а също и резултата от битката.
select  s.NAME, cl.DISPLACEMENT, cl.NUMGUNS, o.RESULT
from SHIPS s, CLASSES cl, OUTCOMES o
where s.CLASS = cl.CLASS
and s.NAME = o.SHIP
and o.BATTLE = 'North Atlantic';

--solution 2
select s.NAME ship_name,
	   c.DISPLACEMENT,
	   c.NUMGUNS,
	   o.RESULT
  from SHIPS s
  join CLASSES c on c.CLASS = s.CLASS
  join OUTCOMES o on o.SHIP = s.NAME
 where o.BATTLE = 'North Atlantic';
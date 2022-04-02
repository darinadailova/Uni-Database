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

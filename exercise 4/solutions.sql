--Exercise 4

--Movies

--Task 1
--�������� ������, ����� ������� ����� �� ���������� � ������� ��
--�������, ����������� �� ���������� �� ����� �Star Wars�.
select movie.TITLE, movieexe.NAME
from MOVIE movie
inner join MOVIEEXEC movieexe on movie.PRODUCERC# = movieexe.CERT#
where movie.PRODUCERC# = (select MOVIE.PRODUCERC#
                          from MOVIE
						  where MOVIE.TITLE = 'Star Wars');

--Task 2
--�������� ������, ����� ������� ������� �� ������������ �� �������, �
--����� � �������� �Harrison Ford�.
select distinct director.NAME
from MOVIEEXEC director
join MOVIE mv on mv.PRODUCERC# = director.CERT#
where mv.TITLE in (select STARSIN.MOVIETITLE
				   from STARSIN
				   where STARSIN.STARNAME = 'Harrison Ford');

--Task 3
--�������� ������, ����� ������� ����� �� �������� � ������� ��
--���������, ��������� ��� �����, ����������� �� ���� ������, ���������
--�� ��� �� ������.
select distinct mv.STUDIONAME, stars.STARNAME
from MOVIE mv
join STARSIN stars on stars.MOVIETITLE = mv.TITLE
order by mv.STUDIONAME;

--Task 4
--�������� ������, ����� ������� ������� �� ���������, ��������� ���
--����� �� ���������� � ���-������ ����� ������.
select stars.STARNAME
from STARSIN stars
join MOVIE mv on mv.TITLE = stars.MOVIETITLE
where mv.PRODUCERC# in (select MOVIEEXEC.CERT#
	                    from MOVIEEXEC
						where MOVIEEXEC.NETWORTH >= all (select MOVIEEXEC.NETWORTH from MOVIEEXEC));

--Task 5
--�������� ������, ����� ������� ������� �� ���������, ����� �� ��
--��������� � ���� ���� ����.
select mv.NAME, stars.MOVIETITLE
from MOVIESTAR mv
left join STARSIN stars on stars.STARNAME = mv.NAME
where stars.MOVIETITLE is null;

--PC

--Task 1
--�������� ������, ����� ������� ������������, ����� � ��� �� �������
--�� ���� �������������, �� ����� ����������� ������� �� �� �������
--(���� �� � ��������� PC, Laptop ��� Printer)
select p.maker, p.model, p.type
from product p
where p.model not in (select model from laptop
                      union
					  select model from pc
					  union
					  select model from printer);

--Task 2
--�������� ������ �������������, ����� ������ ����� �������, ���� �
--��������
select distinct p.maker
from product p
join product p2 on p.maker = p2.maker
where p.type = 'Laptop' and p2.type = 'Printer';

--Task 3
--�������� ��������� �� ���� ������ �������, ����� �� �������� � ���
--��� ������ ������ �������.
select distinct l1.hd
from laptop l1
join laptop l2 on l1.hd = l2.hd and l1.model != l2.model;

--Task 4
--�������� ������ ������ ���������� ��������, ����� ����� �����������
--������������.
select p.model
from pc p
where p.model not in (select model from product where type = 'PC');

--SHIPS

--Task 1
--�������� ������, ����� ������� ������ ������� ���������� �� �����
--�����, ����������� � ������� �� ������� ����. � ��������� �� ������ ��
--�� �������� ���� �������, ����� ����� ������.
select * 
from ships
inner join classes on classes.class = ships.class
order by name;

--Task 2
--��������� ������� ������, ���� ���� ��� �������� � ��������� �
--���������, ����� ����� ������, �� ����������� ������ ��� ������ ���
--���� �������.
select * 
from ships
right join classes on classes.class = ships.class
order by name;

--Task 3
--�� ����� ������ �������� ������� �� ��������, ����� ������ �� ��
--��������� � �����.
select cl.COUNTRY, s.NAME
from SHIPS s
join CLASSES cl on s.CLASS = cl.CLASS
where s.NAME not in (select SHIP from OUTCOMES)
order by COUNTRY;

--Task 4
--�������� ������� �� ������ ������ � ���� 7 ������, ������� �� ����
--���� 1916, �� �������� ������������ ������ Ship Name.select s.NAME as ShipNamefrom SHIPS sjoin CLASSES cl on s.CLASS = cl.CLASSwhere s.LAUNCHED = 1916 and cl.NUMGUNS >= 7;--Task 5--�������� ������� �� ������ �������� � ����� ������, ����� � ���� ��
--���������� �� �������, � ����� �� �� ��������. ��������� ��������� ��
--��� �� �������.
select o.SHIP, b.NAME, b.DATE
from OUTCOMES o
right join BATTLES b on b.NAME = o.BATTLE
where o.RESULT = 'sunk'
order by b.NAME;

--Task 6
--�������� �����, ����������������� � �������� �� ������� �� ���� ��
--������ ������, ����� ���� ������ ��� ���� ������ ����.
select s.NAME, cl.DISPLACEMENT, s.LAUNCHED
from CLASSES cl
join SHIPS s on s.CLASS = cl.CLASS
where s.NAME = cl.CLASS;

--Task 7
--�������� ������ ������� ������, �� ����� ���� ������ �� ���� ���� ����
--�����.
select *
from CLASSES
where CLASS not in (select class from SHIPS);

--Task 8
--�������� �����, ����������������� � ���� ������ �� ��������,
--��������� � ������� �North Atlantic�, � ���� � ��������� �� �������.
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
--exercise 6

--Movies

--Task 1
--�������� ������, ����� ������� �������� � ������ �� ������ �����, ����� ��
--��-����� �� 120 ������ � �� ������� ����� 2000 �. ��� ��������� �� ����� �
--����������, ���������� � �������� �� ���� ���� ���� �� �� �������.
select m.TITLE, m.YEAR, m.LENGTH
from MOVIE m
where (m.LENGTH > 120 or m.LENGTH is null)and m.YEAR < 2000

--Task 2
--�������� ������, ����� ������� ��� � ��� �� ������ ������� (���� � ����),
--����� ��� ������� � 'J' � �� ������ ���� 1948 ������. ���������� �� ����
--�������� �� ��� � ��������� ���.
select MOVIESTAR.NAME, MOVIESTAR.GENDER
from MOVIESTAR
where MOVIESTAR.NAME like 'J%' and year(MOVIESTAR.BIRTHDATE) > 1948
order by MOVIESTAR.NAME desc;

--Task 3
--�������� ������, ����� ������� ��� �� ������ � ���� �� ���������,
--��������� ��� �����, ����� �� ��������� �� ���� ������.
select m.STUDIONAME, count(distinct stars.STARNAME)
from MOVIE m
join STARSIN stars on stars.MOVIETITLE = m.TITLE
group by m.STUDIONAME;

--Task 4
--�������� ������, ����� �� ����� ������ ������� ��� �� ������� � ���� ��
--�������, � ����� �������� � ��������.
select s.STARNAME, count(distinct s.MOVIETITLE)
from STARSIN s
group by s.STARNAME;

--Task 5
--�������� ������, ����� �� ����� ������ ������� ��� �� �������� � ��������
--�� �����, ������� �������� �� ����� �� ���� ������.
select m.STUDIONAME, m.TITLE, m.YEAR
from MOVIE m
where m.YEAR >= all (select m2.year from MOVIE m2 where m2.STUDIONAME = m.STUDIONAME);

--Task 6
--�������� ������, ����� ������� ����� �� ���-������ ������ (���).
select top 1 ms.NAME
from MOVIESTAR ms
where ms.GENDER = 'M'
order by ms.BIRTHDATE desc;

--Task 7
--�������� ������, ����� ������� ��� �� ������ � ��� �� ������ �� ����
--�������, ��������� � ���-����� ����� �� ���� ������.
select t3.studioname, t3.starname, t3.num_movies 
from (select studioname, starname, count(title) as num_movies 
	  from movie right join starsin on movietitle = title 
	  group by studioname, starname) t3 
	  inner join 
	  (select studioname, max(num_movies) as num_movies 
	  from (select studioname, starname, count(title) as num_movies 
	  from movie right join starsin on movietitle = title 
	  group by studioname, starname) t1 group by studioname) t2 
	  on t2.studioname = t3.studioname and t2.num_movies = t3.num_movies;

--Task 8
--�������� ������, ����� ������� �������� � ������ �� �����, � ���� ��
--���������, ��������� � ���� ���� �� ���� ����� � ������ �� ����� �������.
select p.TITLE, p.YEAR, p.starsTotal
from (select m.TITLE, m.YEAR, count(s.STARNAME) as starsTotal
      from MOVIE m
	  join STARSIN s on s.MOVIETITLE = m.TITLE
	  group by m.TITLE, m.YEAR) p
where p.starsTotal > 2;

--SHIPS

--Task 1
--�������� ������, ����� ������� ������� �� ������ ������ ��� ����������,
--����� �� ��������� � ���� ���� ����� � ����� ����� �������� � C ��� K.
select distinct o.SHIP
from OUTCOMES o
where o.ship like 'C%' or o.ship like 'K%';

--Task 2
--�������� ������, ����� ������� ��� � ������� �� ������ ������, �����
--������ �� �� �������� � ����� (���� � �� �� �� ���������).select distinct s.NAME, cl.COUNTRYfrom SHIPS sleft join CLASSES cl on cl.CLASS = s.CLASSleft join OUTCOMES o on o.SHIP = s.NAMEwhere o.RESULT != 'sunk' or o.RESULT is null;--solution 2select s.NAME, cl.COUNTRYfrom SHIPS s, CLASSES clwhere s.CLASS = cl.CLASSand not exists (select 1 from OUTCOMES where RESULT = 'sunk' and SHIP = s.NAME)--Task 3--�������� ������, ����� ������� ��������� � ���� �� ���������� ������ ��
--���� �������. �������, ����� ����� ������ ��� ���� �����, �� ��� �� �
--�������� � �����, ���� �� ����� ��������.
select cl.COUNTRY, count(o.RESULT) as sunkedShips
from CLASSES cl
left join Ships s on cl.CLASS = s.CLASS
left join OUTCOMES o on o.SHIP = s.NAME 
where o.RESULT = 'sunk' or o.RESULT is null
group by cl.COUNTRY;

--Task 4
--�������� ������, ����� ������� ��� �� �������, ����� �� ��-������� (�
--������ ��������� ������) �� ������� ��� Guadalcanal.
select distinct o.BATTLE
from OUTCOMES o
where (select count(ship) from OUTCOMES where battle = o.BATTLE) > 
      (select count(ship) from OUTCOMES where battle = 'Guadalcanal');

--Task 5
--�������� ������, ����� ������� ��� �� �������, ����� �� ��-������� (�
--������ ��������� ������) �� ������� ��� Surigao Strait.select battle 
from outcomes 
group by battle 
having count(distinct ship) > (select count(distinct ship) 
			       from outcomes 
			       where battle = 'Surigao Strait');

--Task 6
--�������� ������, ����� ������� ������� �� ���-������ ������ � ���-�����
--������.

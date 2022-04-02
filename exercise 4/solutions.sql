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

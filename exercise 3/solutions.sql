--Exercise 3

--Movies

--Task 1
--�������� ������, ����� ������� ������� �� ���������, ����� �� ���� �
--���������� � ����� ������ ��� 10 �������.
select actress.NAME
from dbo.MOVIESTAR actress
where actress.GENDER = 'F' and exists (select director.NAME
							          from dbo.MOVIEEXEC director
								      where actress.NAME = director.NAME
									  and director.NETWORTH > 10000000);

--Task 2
--�������� ������, ����� ������� ������� �� ���� ������� (���� � ����),
--����� �� �� ����������.
select actor.name
from dbo.MOVIESTAR actor
where actor.NAME not in (select director.NAME
						 from dbo.MOVIEEXEC director
						 );

--Task 3
--�������� ������, ����� ������� ������� �� ������ ����� � �������,
--��-������ �� ��������� �� ����� �Star Wars�
select title
from dbo.MOVIE
where LENGTH > (select LENGTH
				from dbo.MOVIE
				where TITLE = 'Star Wars');

--Task 4
--�������� ������, ����� ������� ������� �� ������������ � ������� ��
--������� �� ������ �����, ����� �� ����������� �� ���������� � �����
--������ ��-������ �� ���� �� �Merv Griffin�
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
--�������� ������, ����� ������� ��������������� �� ����������
--�������� � ������� ��� 500.
select maker
from product
where type = 'PC' 
and model in (select model
			  from pc
			  where speed > 500);

--Task 2
--�������� ������, ����� ������� ���, ����� � ���� �� ���������� � ���-������ ����.
select code, model, price
from printer
where price >= all (select price
				   from printer
				   );

--Task 3
--�������� ������, ����� ������� ���������, ����� ������� � ��-����� ��
--��������� �� ������ ���������� ��������.
select *
from laptop
where speed < all (select speed
			   from pc)
--Task 4
--�������� ������, ����� ������� ������ � ������ �� �������� (PC,
--������ ��� �������) � ���-������ ����.
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
--�������� ������, ����� ������� ������������� �� ������� ������� �
--���-����� ����.

--Task 6
--�������� ������, ����� ������� ��������������� �� ���� ����������
--�������� � ���-����� RAM �����, ����� ���� ���-����� ���������.
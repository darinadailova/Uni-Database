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
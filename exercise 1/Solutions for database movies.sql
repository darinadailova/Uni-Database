-- exercise 1 

--tasks for database movies

--Task 1
--�������� ������, ����� ������� ������ �� ������ �Disney�
select ADDRESS
from dbo.studio
where name = 'Disney';

--Task2
--�������� ������, ����� ������� ��������� ���� �� ������� Jack
--Nicholson
select birthdate
from dbo.MOVIESTAR
where name = 'Jack Nicholson';

--Task 3
--�������� ������, ����� ������� ������� �� ���������, ����� ��
--��������� ��� ���� �� 1980 ��� ��� ����, � ����� �������� ��� ������
--�Knight�
select starname
from dbo.STARSIN
where MOVIEYEAR = 1980 OR MOVIETITLE = '%Knight%';

--Task 4
--�������� ������, ����� ������� ������� �� ������������ � �����
--������ ��� 10 000 000 ������
select name
from dbo.MOVIEEXEC
where NETWORTH > 10000000;

--Task 5
--�������� ������, ����� ������� ������� �� ���������, ����� �� ����
--��� ������ �� Prefect Rd.
select name
from dbo.MOVIESTAR
where GENDER = 'M' or ADDRESS = 'Prefect Rd';
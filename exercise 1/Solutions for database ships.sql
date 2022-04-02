--exercise 1

--Tasks for database Ships
--Task 1
--�������� ������, ����� ������� ����� � �������� �� ������ ������� � ������� �� 10 ������.
SELECT CLASS, COUNTRY
FROM dbo.CLASSES
WHERE NUMGUNS < 10;

--Task 2
--�������� ������, ����� ������� ������� �� ��������, ������� �� ����
--����� 1918. ������� ��������� shipName �� ��������.
SELECT NAME AS SHIPNAME
FROM dbo.SHIPS
WHERE LAUNCHED < 1918;

--Task 3
--�������� ������, ����� ������� ������� �� �������� �������� � ����� �
--������� �� ����������� �����.
SELECT SHIP, BATTLE
FROM dbo.OUTCOMES
WHERE RESULT = 'sunk';

--Task 4
--�������� ������, ����� ������� ������� �� �������� � ���, ���������
--� ����� �� ������ ����.
SELECT NAME
FROM dbo.SHIPS
WHERE NAME = CLASS;

--Task 5
--�������� ������, ����� ������� ������� �� ��������, ����� �������� �
--������� R.
SELECT NAME
FROM dbo.SHIPS
WHERE NAME LIKE 'r%';

--Task 6
--�������� ������, ����� ������� ������� �� ��������, ����� �������� 2
--��� ������ ����.
SELECT NAME
FROM dbo.SHIPS
WHERE NAME LIKE '% %';
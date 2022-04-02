--Exercise 2

--Tasks 1
--�������� ������, ����� ������� ������� �� ��������� ����, ��������� ���
--����� The Usual Suspects. 
(SELECT STARNAME
FROM dbo.STARSIN
WHERE MOVIETITLE = 'The Usual Suspects')
INTERSECT
(SELECT NAME
FROM dbo.MOVIESTAR
WHERE GENDER = 'M');

--Task 2
--�������� ������, ����� ������� ������� �� ���������, ��������� ��� ����� ��
--1995, ����������� �� ������ MGM.
SELECT STARNAME
FROM dbo.STARSIN
WHERE MOVIEYEAR = 1995 
AND MOVIETITLE IN (SELECT TITLE
			       FROM dbo.MOVIE
				   WHERE STUDIONAME = 'MGM');

--Task 3
--�������� ������, ����� ������� ������� �� ������������, ����� ��
--����������� ����� �� ������ MGM.
SELECT NAME
FROM dbo.MOVIEEXEC
WHERE CERT# IN (SELECT PRODUCERC#
				FROM dbo.MOVIE
				WHERE STUDIONAME = 'MGM');

--Task 4
--�������� ������, ����� ������� ������� �� ������ ����� � �������, �������� �� ��������� �� ����� Star Wars.
SELECT TITLE
FROM dbo.MOVIE
WHERE LENGTH > (SELECT LENGTH
				FROM DBO.MOVIE
				WHERE TITLE = 'Star Wars');

--Task 5
--�������� ������, ����� ������� ������� �� ������������ � ����� ������ �������� �� ���� �� Stephen Spielberg.
SELECT CERT#
FROM dbo.MOVIEEXEC
WHERE NETWORTH > (SELECT NETWORTH
				  FROM dbo.MOVIEEXEC
				  WHERE NAME = 'Stephen Spielberg');

--Task 6
--�������� ������, ����� ������� ������� �� ������ �����, ����� ��
--����������� �� ���������� � ����� ������ ��-������ �� ���� �� Stephen
--Spielberg.
SELECT TITLE 
FROM dbo.MOVIE
WHERE PRODUCERC# IN (SELECT CERT#
					 FROM dbo.MOVIEEXEC
                     WHERE NETWORTH > (SELECT NETWORTH
				                       FROM dbo.MOVIEEXEC
				                       WHERE NAME = 'Stephen Spielberg'));
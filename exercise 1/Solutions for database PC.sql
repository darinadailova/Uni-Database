--exercise 1

--Tasks for database PC

--Task 1
--Напишете заявка, която извежда модел, честота и размер на диска за
--всички персонални компютри с цена под 1200 долара. Задайте
--псевдоними за атрибутите честота и размер на диска, съответно MHz и
--GB
SELECT MODEL, SPEED AS MHZ, HD AS GB
FROM dbo.pc
WHERE PRICE < 1200;

--Task 2
--Напишете заявка, която извежда производителите на принтери без
--повторения
SELECT DISTINCT MAKER 
FROM dbo.product
WHERE TYPE = 'Printer';

--Task 3
--Напишете заявка, която извежда модел, размер на паметта, размер на
--екран за лаптопите, чиято цена е над 1000 долара
SELECT MODEL, RAM, SCREEN
FROM dbo.laptop
WHERE PRICE > 1000;

--Task 4
--Напишете заявка, която извежда всички цветни принтери
SELECT *
FROM dbo.printer
WHERE color = 'y';

--Task 5
--Напишете заявка, която извежда модел, честота и размер на диска за
--тези персонални компютри със CD 12x или 16x и цена под 2000 долара.
SELECT MODEL,SPEED, HD
FROM dbo.pc
WHERE (CD = '12x' OR CD = '16x') AND PRICE < 2000;
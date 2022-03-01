--exercise 1

--Tasks for database PC
--Task 1
SELECT MODEL, SPEED AS MHZ, HD AS GB
FROM dbo.pc
WHERE PRICE < 1200;

--Task 2
SELECT DISTINCT MAKER 
FROM dbo.product
WHERE TYPE = 'Printer';

--Task 3
SELECT MODEL, RAM, SCREEN
FROM dbo.laptop
WHERE PRICE > 1000;

--Task 4
SELECT *
FROM dbo.printer
WHERE color = 'y';

--Task 5
SELECT MODEL,SPEED, HD
FROM dbo.pc
WHERE (CD = '12x' OR CD = '16x') AND PRICE < 2000;
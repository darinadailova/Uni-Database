--Exercise 2 

--Task 1
SELECT product.maker, laptop.speed
FROM dbo.product, dbo.laptop
WHERE laptop.hd > 9 
AND product.model = laptop.model;

--Task 2
(SELECT MODEL, PRICE
FROM dbo.laptop
WHERE MODEL IN (SELECT MODEL
				FROM dbo.product
				WHERE maker = 'B' AND type = 'Laptop'))
UNION
(SELECT MODEL, PRICE
FROM dbo.pc
WHERE MODEL IN (SELECT MODEL
				FROM dbo.product
				WHERE maker = 'B' AND type = 'PC'))
UNION
(SELECT MODEL, PRICE
FROM dbo.printer
WHERE MODEL IN (SELECT MODEL
				FROM dbo.product
				WHERE maker = 'B' AND type = 'Printer'));

--Task 3
(SELECT MAKER
FROM dbo.product
WHERE TYPE = 'Laptop')
EXCEPT
(SELECT MAKER
FROM dbo.product
WHERE TYPE = 'PC');

--Task 4
SELECT DISTINCT firstPC.hd 
FROM dbo.pc firstPC, dbo.pc secondPC
WHERE firstPC.hd = secondPC.hd
and firstPC.code != secondPC.code;

--Task 5
SELECT firstPC.model,  secondPC.model
FROM dbo.pc  firstPC, dbo.pc secondPC
WHERE firstPC.hd = secondPC.hd 
AND firstPC.speed = secondPC.speed
AND firstPC.code < secondPC.code;

--Task 6
SELECT DISTINCT maker
FROM dbo.product
WHERE type = 'PC' 
AND model in (SELECT MODEL
			  FROM dbo.pc
			  WHERE SPEED > 400
			  GROUP BY model having COUNT(model) > 1);
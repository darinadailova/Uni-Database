--Exercise 2 

--Task 1
--Напишете заявка, която извежда производителя и честотата на лаптопите с
--размер на диска поне 9 GB.
SELECT product.maker, laptop.speed
FROM dbo.product, dbo.laptop
WHERE laptop.hd > 9 
AND product.model = laptop.model;

--Task 2
--Напишете заявка, която извежда модел и цена на продуктите, произведени от
--производител с име B.
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
--Напишете заявка, която извежда производителите, които произвеждат лаптопи,
--но не произвеждат персонални компютри.
(SELECT MAKER
FROM dbo.product
WHERE TYPE = 'Laptop')
EXCEPT
(SELECT MAKER
FROM dbo.product
WHERE TYPE = 'PC');

--Task 4
--Напишете заявка, която извежда размерите на тези дискове, които се предлагат
--в поне два различни персонални компютъра (два компютъра с различен код).
SELECT DISTINCT firstPC.hd 
FROM dbo.pc firstPC, dbo.pc secondPC
WHERE firstPC.hd = secondPC.hd
and firstPC.code != secondPC.code;

--Task 5
--Напишете заявка, която извежда двойките модели на персонални компютри,
--които имат еднаква честота и памет. Двойките трябва да се показват само по
--веднъж, например само (i, j), но не и (j, i).
SELECT firstPC.model,  secondPC.model
FROM dbo.pc  firstPC, dbo.pc secondPC
WHERE firstPC.hd = secondPC.hd 
AND firstPC.speed = secondPC.speed
AND firstPC.code < secondPC.code;

--Task 6
--Напишете заявка, която извежда производителите на поне два различни
--персонални компютъра с честота поне 400.
SELECT DISTINCT maker
FROM dbo.product
WHERE type = 'PC' 
AND model in (SELECT MODEL
			  FROM dbo.pc
			  WHERE SPEED > 400
			  GROUP BY model having COUNT(model) > 1);
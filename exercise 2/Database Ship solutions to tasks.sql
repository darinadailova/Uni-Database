--exercise 2

--Task 1
SELECT NAME
FROM dbo.SHIPS
WHERE CLASS IN (SELECT CLASS
				FROM dbo.CLASSES
				WHERE DISPLACEMENT > 50000);

--Task 2




--Task 3
SELECT COUNTRY
FROM dbo.CLASSES
WHERE TYPE = 'bb' 
AND COUNTRY IN (SELECT COUNTRY
                FROM dbo.CLASSES
				WHERE TYPE = 'bc');

--Task 4
select out1.ship 
from outcomes out1, outcomes out2, battles bat1, battles bat2
where out1.ship = out2.ship and out1.result='damaged'
						and bat1.name = out1.battle 
						and bat2.name = out2.battle
						and bat1.date < bat2.date;
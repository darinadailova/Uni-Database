--exercise 2

--Task 1
--Напишете заявка, която извежда името на корабите с водоизместимост над
--50000.
SELECT NAME
FROM dbo.SHIPS
WHERE CLASS IN (SELECT CLASS
				FROM dbo.CLASSES
				WHERE DISPLACEMENT > 50000);

--Task 2
--Напишете заявка, която извежда имената, водоизместимостта и броя оръдия на
--всички кораби, участвали в битката при Guadalcanal.
select ship.NAME, class.DISPLACEMENT, class.NUMGUNS
from SHIPS ship, CLASSES class, OUTCOMES outcomes
where outcomes.BATTLE = 'Guadalcanal'
and ship.CLASS = class.CLASS
and outcomes.SHIP = ship.NAME;


--Task 3
--Напишете заявка, която извежда имената на тези държави, които имат както
--бойни кораби, така и бойни крайцери.
SELECT COUNTRY
FROM dbo.CLASSES
WHERE TYPE = 'bb' 
AND COUNTRY IN (SELECT COUNTRY
                FROM dbo.CLASSES
				WHERE TYPE = 'bc');

--Task 4
--Напишете заявка, която извежда имената на тези кораби, които са били
--повредени в една битка, но по-късно са участвали в друга битка.
select out1.ship 
from outcomes out1, outcomes out2, battles bat1, battles bat2
where out1.ship = out2.ship and out1.result='damaged'
						and bat1.name = out1.battle 
						and bat2.name = out2.battle
						and bat1.date < bat2.date;
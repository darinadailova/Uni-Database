--exercise 8

--Movies

--Task 1
insert into MOVIESTAR(NAME, BIRTHDATE) values('Nicole Kidman', 1967-20-06);

--Task 2
delete from MOVIEEXEC where NETWORTH < 30000000;

--Task 3
delete MOVIESTAR where ADDRESS is null;

--PC
--Task 4
insert into dbo.pc values(12, '1100', 2400, 2048, 500, '52x', 299);
insert into product values('C', '1100', 'PC');

--Task 5
delete from pc where model = 1100;

--Task 6
delete from laptop where model in (select model
								   from product
								   where type = 'Laptop' and 
								   maker not in (select maker from product where type = 'Printer'));

--Task 7
update product set maker = 'A' where maker = 'B';

--Task 8
update pc set price = price / 2, hd = hd + 20;

--Task 9
update laptop set screen = screen + 1 
where model in (select model from product 
                where type = 'Laptop' and maker = 'B');

--Ships
--Task 10
insert into classes values('Nelson', 'bb', 'Gt.Britain', 9, 16, 34000);
insert into ships values('Nelson', 'Nelson', 1927);
insert into ships values('Rodney', 'Nelson', 1927);

--Task 11
delete from SHIPS where name in (select SHIP from OUTCOMES where RESULT = 'sunk');

--Task 12
update CLASSES set bore = bore * 2.5, DISPLACEMENT = DISPLACEMENT / 1.1;
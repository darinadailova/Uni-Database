--exercise 5

--PC
--Task 1
--�������� ������, ����� ������� �������� ������� �� ������������ ��������.
select cast(AVG(pc.speed) as decimal(10, 2)) from pc;

--Task 2
--�������� ������, ����� ������� ������� ������ �� �������� �� ��������� ��
--����� ������������.
select product.maker, AVG(laptop.screen)
from laptop
join product on laptop.model = product.model
where product.type = 'Laptop'
group by product.maker
order by product.maker;

--Task 3
--�������� ������, ����� ������� �������� ������� �� ��������� � ���� ��� 1000.
select cast(AVG(laptop.speed) as decimal(10, 2))
from laptop
where laptop.price > 1000;

--Task 4
--�������� ������, ����� ������� �������� ���� �� ������������ ��������,
--����������� �� ������������ �A�.
select cast(AVG(pc.price) as decimal(10, 2))
from pc
join product on product.model = pc.model
where product.maker = 'A';

--Task 5
--�������� ������, ����� ������� �������� ���� �� ������������ �������� �
--��������� �� ������������ �B�.
select pr.maker, cast(AVG(prod.price) as decimal(10, 2))
from (select price, model from laptop 
	  union all
	  select price, model from pc) prod
join product pr on pr.model = prod.model
where pr.maker = 'B'
group by maker;

--Task 6
--�������� ������, ����� ������� �������� ���� �� ������������ ��������
--������ ���������� �� �������.
select speed,avg(price) as AvgPrice
from pc 
group by speed
order by speed;

--Task 7
--�������� ������, ����� ������� ���������������, ����� �� ��������� ���� 3
--�������� ���������� ��������� (� �������� ���).
select maker, count(pc.model) as number_of_pc
from product join pc on pc.model=product.model
group by maker having count(pc.model)>=3
order by maker;

--Task 8
--�������� ������, ����� ������� ��������������� � ���-������ ���� ��
--���������� ��������.
select top 1 product.maker, MAX(pc.price) as price
from product join pc on pc.model = product.model
group by product.maker
order by price desc;

--Task 9
--�������� ������, ����� ������� �������� ���� �� ������������ �������� ��
--����� ������� ��-������ �� 800.select pc.speed, AVG(pc.price) as pricefrom product join pc on pc.model = product.model and pc.speed > 800group by pc.speedorder by price;--Task 10--�������� ������, ����� ������� ������� ������ �� ����� �� ���� ����������
--��������, ����������� �� �������������, ����� ����������� � ��������.
--���������� �� �� ������ �� ����� ������� ������������.
select p.maker, cast(AVG(pc.hd) as decimal(10, 2)) as avgPrice
from product p join pc on p.model = pc.model
where p.maker in (select maker from product where type = 'Printer')
group by p.maker;

--SHIPS

--Task 1
--�������� ������, ����� ������� ���� �� ��������� ����� ������.
select count(CLASSES.CLASS)
from CLASSES
where CLASSES.TYPE = 'bb';

--Task 2
--�������� ������, ����� ������� ������� ���� ������ �� ����� ���� ���� �����.
select CLASSES.CLASS, AVG(CLASSES.NUMGUNS)
from CLASSES
where CLASSES.TYPE = 'bb'
group by CLASSES.CLASS;

--Task 3
--�������� ������, ����� ������� ������� ���� ������ �� ������ ����� ������.
select AVG(CLASSES.NUMGUNS) as avgGuns
from CLASSES
where CLASSES.TYPE = 'bb';

--Task 4
--�������� ������, ����� ������� �� ����� ���� ������� � ���������� ������, �
--����� ����� �� ���������� ���� � ������ �� ����.select CLASSES.CLASS, min(SHIPS.LAUNCHED) as firstYear, max(SHIPS.LAUNCHED) as lastYearfrom CLASSESjoin SHIPS on SHIPS.CLASS = CLASSES.CLASSgroup by CLASSES.CLASS;--Task 5--�������� ������, ����� ������� ���� �� ��������, �������� � ����� ������
--�����.
select s.class, count(o.RESULT) as no_sunk
from outcomes o join ships s on o.ship = s.name
where o.result = 'sunk'
group by s.class;

--Task 6
--�������� ������, ����� ������� ���� �� ��������, �������� � ����� ������
--�����, �� ���� ������� � ������ �� 2 ������.select s.class, count(o.RESULT) as no_sunk
from outcomes o join ships s on o.ship = s.name
where o.result = 'sunk' and s.CLASS in (select c.class 
                                        from classes c
								        join ships s on c.class = s.class 
										group by c.class having count(c.class)>=2)
group by s.class;

--Task 7
--�������� ������, ����� ������� ������� ������� �� �������� �� �������� ��
--����� ������.
select country, cast(avg(bore) as decimal(10,2)) as avgBore 
from classes c join ships s on c.class = s.class 
group by country
order by country;
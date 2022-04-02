--exercise 5

--PC
--Task 1
--Напишете заявка, която извежда средната честота на персоналните компютри.
select cast(AVG(pc.speed) as decimal(10, 2)) from pc;

--Task 2
--Напишете заявка, която извежда средния размер на екраните на лаптопите за
--всеки производител.
select product.maker, AVG(laptop.screen)
from laptop
join product on laptop.model = product.model
where product.type = 'Laptop'
group by product.maker
order by product.maker;

--Task 3
--Напишете заявка, която извежда средната честота на лаптопите с цена над 1000.
select cast(AVG(laptop.speed) as decimal(10, 2))
from laptop
where laptop.price > 1000;

--Task 4
--Напишете заявка, която извежда средната цена на персоналните компютри,
--произведени от производител ‘A’.
select cast(AVG(pc.price) as decimal(10, 2))
from pc
join product on product.model = pc.model
where product.maker = 'A';

--Task 5
--Напишете заявка, която извежда средната цена на персоналните компютри и
--лаптопите за производител ‘B’.select from pc, laptop
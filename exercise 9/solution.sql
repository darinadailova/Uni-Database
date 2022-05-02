--exercise 9

--Task 1
--a)
CREATE TABLE product (
	maker CHAR(1),
	model CHAR(4),
	type VARCHAR(7)
);

CREATE TABLE printer (
	code int,
	model char(4),
	price decimal(8, 2)
);

--b)
insert into product values('B', '1234', 'laptop')
insert into printer values(3, '2345', 3333,33)

--v)
alter table printer add type varchar(6) CHECK(type IN ('laser', 'matrix', 'jet'));
alter table printer add color char(1) not null default 'n' CHECK(color IN ('n', 'y'));

--g)
alter table printer drop column price;

--d)
DROP TABLE printer;
DROP TABLE product;
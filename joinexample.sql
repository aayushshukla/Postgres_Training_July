create table products (
 product_id serial primary key,
 product_name varchar(30)
);

create table product_desc(
  pdid  serial primary key,
  product_company varchar(30),
  price int ,
  product_id int,
  constraint fk_pid
  foreign key(product_id)
  references products(product_id)
);

insert into products(product_name) values ('parle g'), ('sunfeast'),('oreo'),
('maggie');

select * from products;

alter table product_desc drop constraint fk_pid;

insert into product_desc(product_company,price,product_id) values
('parle',5,1),
('nestle',30,3);

select * from product_desc;

-- inner join  it will take intersection of column values
select products.product_name,product_desc.product_company,product_desc.price
from products inner join product_desc
on products.product_id = product_desc.product_id;

-- by default join will be inner join 
select products.product_name,product_desc.product_company,product_desc.price
from products  join product_desc
on products.product_id = product_desc.product_id;

--full join
select product_desc.product_company,products.product_name,product_desc.price
from products full join product_desc
on products.product_id =product_desc.product_id;

select product_desc.product_company,products.product_name,product_desc.price
from products full outer join product_desc
on products.product_id =product_desc.product_id;

insert into products(product_name) values ('dabur');

select * from products;

insert into product_desc(product_company,price,product_id) values
('titan',5,10);

select * from product_desc;

--left join  returns all rows from left table and rows from other table 
-- where joined condition is satisfied 
-- if no records found in right table it will return null

select products.product_id,
products.product_name,product_desc.price,product_desc.product_company
from products left join product_desc
on products.product_id =product_desc.product_id order by product_id;
-- no records example 
select products.product_id,
products.product_name,product_desc.price,product_desc.product_company
from products left join product_desc
on products.product_name =product_desc.product_company order by product_id;


select products.product_id,
products.product_name,product_desc.price,product_desc.product_company
from products right join product_desc
on products.product_id =product_desc.product_id order by product_id;

-- right join  is used to return all the rows of right table and rows from other
-- table where the join condition is satishfied
-- if no record found than null 

-- no record example 
select products.product_id,
products.product_name,product_desc.price,product_desc.product_company
from products right outer join product_desc
on products.product_name =product_desc.product_company order by product_id;


-- cross join is used to get all possiblilty of multiple tables 
-- it is also know as cartesian join 

select * from products cross join product_desc;
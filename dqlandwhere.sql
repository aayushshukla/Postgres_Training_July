-- description table 

select * from information_schema.columns where 
table_name='orders';

select column_name,column_default,is_nullable,data_type from
information_schema.columns where table_name='orders';
-- show the list of items that are no longer in use
select * from products where discontinued=1 and units_in_stock>5;

select  product_name, quantity_per_unit,unit_price,units_in_stock
from products where discontinued=1 and units_in_stock>5;

select  product_name, quantity_per_unit,unit_price,units_in_stock,discontinued
from products where discontinued=1 and (units_in_stock>25 OR  unit_price>30);

-- select */colname1,colname2 where  column between low/start and high/end;
select product_name,units_in_stock,unit_price from products
where unit_price between 35 and 50 ;

select * from  products ;

-- show different categories of products
-- Distinct clause -- give unique records it used with select statement
-- it can be implemented on multiple columns 
-- select distinct col1,col2 ,col3..coln from tablename 
select distinct category_id from products;


-- sort the data 
-- order by clause it will sort the data of column in ascending or descending order
-- default sort will be in ascending order
select distinct category_id from products order by category_id;

--sort data in descending order  use desc keyword with order by
-- select * /col from table where condition order by columname desc
select distinct category_id from products order by category_id desc;

-- order shipping details 
select order_id ,ship_name,ship_city,ship_country from orders;
-- sort the order shipping details on basis on country 

select order_id, ship_name, ship_city, ship_country from orders 
order by ship_country ;

select order_id, ship_name, ship_city, ship_country from orders 
order by ship_country desc;

select distinct ship_country,ship_city from orders;

select * from orders;

select DISTINCT ship_city from orders where ship_country='USA';

DO
$$
 declare  
   -- variable name  datatype;
   -- assign value to variable variablename := value
   x int;
   y int;
   -- constant 
   -- contstanname constant datatype := expression/value
   msg constant varchar :='Welcome in anonymous block of pl/sql';
   pi constant int :=3.14;
   begin
     -- raise notice/error/log/info / warning 
	 -- format  msg % , variablename
	 x:=10;
	 y= x*x;
	 raise notice 'welcome message %',msg::TEXT;
	 raise notice  'area of circle %', pi*y;
	 raise notice 'value of x is = % and value of y = %',x,y;
	 --raise info 'value of x is = %',x;
	 --raise warning 'value of x is = %',x;
	 
   end	 	 
$$;
-- select into statement creates a new table and insert the returned data
-- into the table
select product_name into table product_info from products;

-- syntax  :  rowtype variable  variablename tablename%rowtype 
-- it has same datatype of the row of table 

do
$$
  -- rowtype variable 
  declare product_info products%rowtype; -- its datatype is same as the row in products tabele
  begin
    select * from products into product_info where product_id=2;
	raise notice 'product name is % and  product id is %',
	-- rowtypevariable.columnname 
	product_info.product_name , product_info.product_id;
  end;

$$

select * from product_info;

--syntax for for loop
-- <<label>>  for variable in [reverse ] start..end [by step] 
-- loop
-- body of loop
-- end loop [label];

do
$$
 begin 
    for i in 1..10 
	loop
	 -- body of for loop
	 raise notice 'value of i = %',i;
	end loop;
 end;
$$

do
$$
 begin 
    for i in reverse 10..1 
	loop
	 -- body of for loop
	 raise notice 'value of i = %',i;
	end loop;
 end;
$$

-- wap to print even no between 2 to 25

do
$$
  begin 
   for i in 2..25 by 2
   loop
     raise notice 'value of i = %',i;
   end loop;
   end;
$$


do
$$
  declare row_data products%rowtype;
  begin 
    for row_data in select * from products 
	loop
	    raise notice '% %',row_data.product_id,row_data.product_name;
	  
	end loop;
  end;
$$

-- a record is similar to row type variable 
-- it can hold only one row from result set similar to row type
-- difference is row type variable have predefined  structure 
-- record dont have predefined structures
-- syntax variablename record;

do
$$
  declare 
      row_data record; -- record type
  begin 
    for row_data in select * from products 
	loop
	    raise notice ' record data % %',row_data.product_id,row_data.product_name;
	  
	end loop;
  end;
$$
--language plpgsql;

do
$$
  declare i int :=0;
  begin 
     while i<=10 
	  loop
	   raise notice 'value of i %',i;
	   i:=i+1;
	   end loop;
   end;
$$

do
$$
  declare x int :=200;
  begin
   if x>=50 and x<100 
	then 
	   raise notice 'value  % is less than 100 ',x;
	
	 elsif x>100 then raise notice 'value % is greter than 100',x;
	 else raise notice 'invalid value';
   end if;
 end;
$$

do
$$
  declare x int :=10;
          y int :=0;
          z int;
  begin 
       z=  x/y;
	   raise notice 'value of z %',z;
	   
  exception
    when division_by_zero then
	raise exception  'can not divide by zero : zerodivision error';
  end;
$$

--sub block 

do
$$
<<parent_block>>
 declare
     x int :=1;
 begin 
    x := x*10;
	raise notice ' --outer block--- x value %',x;
    -- inner block
	declare x int :=100;
	        y int :=50;
			
		begin 
		    x:=x+5;
			y:=y+5;
			parent_block.x=parent_block.x*60;
			raise notice 'value of x ,y inner block is (%,%)',x,y;
			raise notice  'value of parent x is %',parent_block.x;
		end;
		raise notice ' value of x %',x;
 end; -- outer block end 
 
 
$$
--function overloading  - functions have same name but different arguments
-- function will be overload on basis on number of arguments 

create or replace function add_numbers(x int , y int , z int, out res int ) as
$$
  begin 
     raise notice 'adding three values';
     res = x+y+z;
  end;
$$ language plpgsql
-- over loading add_numbers with 2 param
create or replace function add_numbers(x1 int , y1 int , out res1 int ) as
$$
  begin 
     raise notice 'adding two values';
     res1 = x1+y1;
  end;
$$ language plpgsql

select add_numbers(10,20,40); -- it will invoke function with 3 arguments
select add_numbers(100,200);  -- it will invoke function with 2 arguments
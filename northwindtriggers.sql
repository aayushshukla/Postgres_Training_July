-- write a trigger to prevent deletion of an order that has been already
-- shiped 

select * from orders;

create or replace  function prevent_shipped_orders_deletion()
returns trigger as
$$
 begin 
   if old.shipped_date is not null  then 
        raise sqlstate '22005' using message =' can not delete shipped order';
	end if;
	return new;
 end;

$$ language plpgsql

create or replace trigger trigger_prevent_delete_orders 
before delete on orders
for each row
execute function prevent_shipped_orders_deletion();

delete from orders where shipped_date ='1996-07-16';

select * from employees;

-- write a trigger to prevent insertion of employee if age is less than 18

create or replace function fn_prevent_emp_ins()
returns trigger as 
$$
  declare age int;
  begin 
     select extract(year from age(current_date,new.birth_date)) into age from employees;
	 if age <18 then
	   raise sqlstate '22005' using message = 'you are minor sorry u cant join';
	  end if;
	  return new;
  end;
$$ language plpgsql

create trigger trigger_prevent_minor
before insert on employees
for each row
execute function fn_prevent_emp_ins();

insert into employees (employee_id,first_name,birth_date)values
(20,'goku','2021-09-01');
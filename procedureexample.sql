-- procedures are similar functions but have following differences
--  Procedures dont return a value 
-- fuction is called as part of query or dml command
-- procedures will be called by using CALL statement 
-- A procedure can commit or rollback transction during execution  functions cants
-- creating a procedure to print welcome msg
create or replace procedure pr_marvel() as
$$
  begin 
    raise notice 'captain america and iron  man welcomes up in procedure world';
  end;
$$ language plpgsql


select * from logs;
call pr_marvel();  -- calling procedure name as pr_marvel

create or replace procedure upd_log_table (in lid int , in ldesc varchar)
language plpgsql
as
-- $body$
$$
   begin 
      update logs set log_desc =ldesc where log_id=lid;
   exception when others then 
       raise notice 'there is an exception';
   end ;
$$

call upd_log_table (2,'waiting for response...');

call upd_log_table (10000,'waiting for response...');

create table metrics (updation_time timestamp , number_of_rows numeric);

create or replace procedure upd_in_log_table (in lid int , in ldesc varchar)
language plpgsql
as
-- $body$
$$
   declare 
     update_time  timestamp;
	 rows_updated numeric;
   begin 
     select Timeofday() as load_tms into update_time; -- getting the time of query execuion
      update logs set log_desc =ldesc where log_id=lid; -- updating the logs table
	 
	  get diagnostics rows_updated = row_count;  -- getting rows count from dignostics table
      insert into metrics values(update_time,rows_updated); -- adding data to metrics table
   end ;
$$

call upd_in_log_table (4,'404 error not found');

select * from metrics;
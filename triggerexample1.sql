create or replace function getMsg() returns Trigger as
$$
  begin
    raise info 'hello trigger is invoked';
	return null;
  end;
$$ language plpgsql

-- creating a trigger when a new data is added in logs table 
create or replace trigger tr_ins_log
-- event occurance 
after insert on logs 
--for each row
for each statement
execute function getMsg();

insert into logs(log_id,log_desc) values (91,'403 error..'),(93,'loading...');
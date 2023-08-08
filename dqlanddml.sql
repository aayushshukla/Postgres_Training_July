create table Logs (
	-- serial auto increamented 
   log_id serial primary key,
   log_desc text not null ,
	-- date data type
	-- default date format is YYYY-MM-DD
   log_date date not null default current_date
);

insert into logs(log_desc) values ('button is clicked'),
('request sent to db'),('request accepted and returned to server'),
('response sent to client');

select * from logs;
-- now()  take current date
insert into logs(log_desc,log_date) values ('process is killed',now());

alter table logs add column log_end_date date ;

-- where clause  we for writing condition 
-- select  */colname1,coln2,..coln from table where condition 
-- show data of log having id 2
select log_id,log_desc from logs where log_id=2 ;
-- show date of log where description is button is clicked
select log_date,log_desc from logs where log_desc='button is clicked';

select * from logs;

-- sql statements are auto commited in postgres 

begin;-- starting transction 
insert into logs(log_desc) values ('server1 is restarted');
select * from logs;

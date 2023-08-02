-- create a table 
-- create table tablename  ( column datatype , col2 datatype )

create table employee (eid int PRIMARY KEY , emp_name text , emp_lastname text, 
					  salary real NOT NULL  );

-- add data to employee table  
insert into employee values (101,'suraj','shukla',50000);

-- fetch all the data from a table 
--  select * from tablename

select * from employee;
-- add employee data without giving its lastname
insert into employee(eid,emp_name,salary) values (102,'aayush',50000);
--insert into employee(eid,emp_name,emp_lastname) values (103,'ganesh','gupta');
-- error because salary can not be null

-- add multiple rows 

insert into employee values (103,'ganesh','gupta',80000),(104,'john','martin',90000),
(105,'barbie','doe',85000);

select * from employee;

-- add column  
--  alter Table tablename  add column columnname datatype

alter table employee add column email text;

-- drop column  alter table tablename drop column columnname
alter table employee drop column email;
-- alter table tablenmae drop column columnname cascade it will remove
-- all its column and related objects (views, triggers etc)

select * from employee;

-- rename a table  alter table tablename rename to new_table_name;
alter table employee rename to empinfo;

select * from empinfo;

-- rename a column of a table
-- alter table tablename  rename column old_column_name to new_column_name;
alter table empinfo rename column salary to empsal;

select * from empinfo;

-- add constraint alter table tablename alter column column_name set default value 
alter table empinfo alter column empsal set default 10000;

insert into empinfo(eid,emp_name,emp_lastname) values (108,'goku','gupta');

select * from empinfo;
-- remove default value alter table tablename alter column column_name drop default value 

alter table empinfo alter column empsal drop default;

-- change type of column  alter table tablename alter column columname newdatatype size;
alter table empinfo alter column emp_lastname type varchar(80);

-- not null constraint 
alter table empinfo alter column emp_name set not null;

-- remove not null constraint
-- alter table tablename alter column columnname drop not null

alter table empinfo alter column emp_name drop not null;

-- alter table tablename add primary key (columnname);

-- drop table  tablename
drop table empinfo;

-- primary key
create table employee (eid int , emp_name text , emp_lastname text, 
					  salary real NOT NULL , primary key(eid) );
-- drop table
drop table employee;
create table employee (eid int , emp_name text , emp_lastname text, 
					  salary real NOT NULL  );
					  
					  
alter table employee add primary key(eid);

-- create database  databasename
create database test;
-- drop database databasename
drop database test;

-- create temporary table  tablename (colname datatype ,col2 datatype)
create temporary table emp_temp(eid int);
select  * from emp_temp;
-- hstore 
-- data will be stored in key-value pair for a unit value.
-- key and the values are text string 

drop extension hstore;
--creating hstore  
create extension hstore;

create table web (
   webid serial primary key,
	web_title varchar(40) not null,
   web_info hstore
);

-- inserting data in to hstore 
insert into web (web_title,web_info) values
(
   'Facebook',
	'"company" => "meta",
	"type" => "social media",
	"year" => "2007"'
);

select * from web;

insert into web (web_title,web_info) values
(
   'Youtube',
	'"company" => "google",
	"type" => "video ",
	"year" => "2009"'
),
(
   'Netflix',
	'"company" => "netflix",
	"type" => "stream "'
	
);

select web_info from web;
-- fetch value of specific key  use -> to select particular key

select web_info->'company' as company_name from web;
  
-- wrote a query to fetch  type and year of web 

select web_info ->'year' as starting_year,web_info ->'type'as web_type  from web;

-- all keys of hstore akeys(columnname) fetch all keys from hstore as array
select akeys(web_info) from web;

-- skeys(columname) fetch all the keys from hstore as set
select skeys(web_info) from web;

-- avals() retreive all the values in arrays
select avals(web_info) from web;

select avals(web_info) from web where webid=2;

--svals(column) fetch all values in set
select svals(web_info) from web;
select svals(web_info) from web where webid=1;

-- using hstrore with where clause
-- fetch company name for type social media

select web_title,web_info -> 'company' as company_name from web 
where web_info ->'type' ='social media';

-- show title of company that was started in year 2009
select web_title from web where web_info ->'year'='2009';

-- each() it converts hstore into sets
select (each(web_info)).* from web;

-- convert hstore in json  hstore_to_json()
select hstore_to_json(web_info)json from web;

-- update hstore  current key value
update web set web_info = web_info || '"year" => "2005"'::hstore where webid=2;

-- update hstore with new key value or add new key value
update web set web_info = web_info || '"year" => "2011"'::hstore where webid=3;

select * from web;

-- delete key value from hstore
update web set web_info = delete(web_info,'year') where webid=3;

insert into web (web_title,web_info) values
(
   'Amazon',
	'"company" => "amazon",
	"type" => "e commerce",
	"year" => "2000"'
) returning 'data is added';

insert into web (web_title,web_info) values
(
   'Flipkart',
	'"company" => "wallmart",
	"type" => "e commerce",
	"year" => "2010"'
) returning * ;

insert into web (web_title,web_info) values
(
   'Myntra',
	'"company" => "flipkart",
	"type" => "clothing and beuty commerce",
	"year" => "2015"'
) returning web_title ;
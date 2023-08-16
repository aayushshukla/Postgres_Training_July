-- json java script object notation 
--  json object  { 'key':'value'} , json array [ {},{}]
-- light weight , language independent 
-- json data type is to transfer the data 

create table cricket (
  matchid serial primary key,
  match_info json not null
);

-- add json data

insert into cricket(match_info) values
('{"matchno": "101","descp": {"nation1":"india","nation2":"aus","noofmatches":"12"}}');

select * from cricket;

insert into cricket(match_info) values
('{"matchno": "102","descp": {"nation1":"india","nation2":"nz","noofmatches":"10"}}'),
('{"matchno": "103","descp": {"nation1":"india","nation2":"sa","noofmatches":"18"}}'),
('{"matchno": "104","descp": {"nation1":"india","nation2":"pak","noofmatches":"20"}}');

select match_info from cricket;

-- two operators used with json daya
--   1) ->  fetch the json object by key
--   2) ->>  fetch the json object by text

select match_info ->'matchno' as match_number from cricket;
-- give data in text format
select match_info ->>'matchno' as match_number from cricket;

-- fetch details of opposition teams of india
select match_info ->'descp'->>'nation2' as opposition_team from cricket;

select match_info ->'descp'->'nation2' as opposition_team from cricket;

-- fetch noofmatches of nation1
select match_info->'descp'->>'nation1' as hostnation, 
match_info->'descp'->>'noofmatches' as matchesplayed from cricket;

-- show max, min no matches played by nation1 india
select max(cast(match_info->'descp'->>'noofmatches' as INTEGER)),
 min(cast(match_info->'descp'->>'noofmatches' as INTEGER))
from cricket;

select match_info->'descp'->>'noofmatches' as number_of_matches_pak,
match_info->'descp'->>'nation1' as nation_india
from cricket where
match_info->'descp'->>'nation2'='pak';

-- json_object_keys() fetch all keys from nested item set of records
select json_object_keys(match_info->'descp') from cricket;

select json_object_keys(match_info) from cricket;

-- json_each()
select json_each(match_info) from cricket;

select json_each_text(match_info) from cricket;

select json_typeof(match_info) from cricket;
-- json_typeof retreive data type of outer object
select json_typeof(match_info->'matchno') from cricket;
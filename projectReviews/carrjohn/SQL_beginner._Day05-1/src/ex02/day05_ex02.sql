create index idx_person_name on person(upper(name));

explain analyze select * from person where upper(name) = 'ANNA';
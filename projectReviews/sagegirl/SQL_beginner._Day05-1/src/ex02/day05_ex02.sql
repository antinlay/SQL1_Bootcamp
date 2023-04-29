create index idx_person_name on person (upper(name));

set enable_seqscan = false;

explain analyse
select upper(name) from person, person_visits where person.id=person_visits.person_id;
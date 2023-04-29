
begin;
update pizzeria p
set rating = 5
where p.name = 'Pizza Hut';
select *
from pizzeria
where pizzeria.name = 'Pizza Hut';
commit;
select *
from pizzeria
where pizzeria.name = 'Pizza Hut';
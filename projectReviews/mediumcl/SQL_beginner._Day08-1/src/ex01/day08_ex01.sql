begin;
SHOW TRANSACTION ISOLATION LEVEL;
update pizzeria p set rating = 4 where p.name = 'Pizza Hut';
update pizzeria p set rating = 3.6 where p.name = 'Pizza Hut';
commit;
select *
from pizzeria
where pizzeria.name = 'Pizza Hut';
select *
from pizzeria
where pizzeria.name = 'Pizza Hut';
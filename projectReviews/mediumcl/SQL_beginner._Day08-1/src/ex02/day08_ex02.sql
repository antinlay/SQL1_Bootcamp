begin;
SHOW TRANSACTION ISOLATION LEVEL;
set transaction isolation level repeatable read;
set transaction isolation level repeatable read;
update pizzeria p set rating = 4 where p.name = 'Pizza Hut';
update pizzeria p set rating = 3.6 where p.name = 'Pizza Hut';
commit;
select * from pizzeria;
select * from pizzeria;
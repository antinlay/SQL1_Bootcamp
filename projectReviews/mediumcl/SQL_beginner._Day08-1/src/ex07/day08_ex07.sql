begin;
update pizzeria p
set rating = 1
where p.id = 1;
update pizzeria p
set rating = 2
where p.id = 2;
update pizzeria p
set rating = 2
where p.id = 2;
update pizzeria p
set rating = 1
where p.id = 1;
commit;
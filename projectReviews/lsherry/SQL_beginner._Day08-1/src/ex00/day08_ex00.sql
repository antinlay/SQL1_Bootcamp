-- Session #1

begin;
-- BEGIN
update pizzeria set rating = 5 where name = 'Pizza Hut';
-- UPDATE 1
select * from pizzeria;
--  id |    name    | rating
-- ----+------------+--------
--   2 | Dominos    |    4.3
--   3 | DoDo Pizza |    3.2
--   4 | Papa Johns |    4.9
--   5 | Best Pizza |    2.3
--   6 | DinoPizza  |    4.2
--   1 | Pizza Hut  |      5
-- (6 rows)

commit;
-- COMMIT

-- All requests wrapped in a transaction will be executed only after the commit. This avoids some query sequence errors.


-- Session #2
select * from pizzeria;
--  id |    name    | rating
-- ----+------------+--------
--   1 | Pizza Hut  |    4.6
--   2 | Dominos    |    4.3
--   3 | DoDo Pizza |    3.2
--   4 | Papa Johns |    4.9
--   5 | Best Pizza |    2.3
--   6 | DinoPizza  |    4.2
-- (6 rows)

select * from pizzeria;
--  id |    name    | rating
-- ----+------------+--------
--   2 | Dominos    |    4.3
--   3 | DoDo Pizza |    3.2
--   4 | Papa Johns |    4.9
--   5 | Best Pizza |    2.3
--   6 | DinoPizza  |    4.2
--   1 | Pizza Hut  |      5
-- (6 rows)
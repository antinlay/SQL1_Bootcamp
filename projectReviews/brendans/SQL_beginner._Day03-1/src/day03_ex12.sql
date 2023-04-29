INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT (
    SELECT max(id) + person.id
    FROM person_order
  ),
  person.id,
  19,
  '2022-02-25'
FROM person;
select count(*) = 0 as check
from person_order
where order_date = '2022-02-25'
  and menu_id = (
    select id
    from menu
    where pizza_name = 'greek pizza'
  )
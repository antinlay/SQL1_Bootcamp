
CREATE VIEW v_price_with_discount  AS SELECT *
 FROM (select name, pizza_name, price, (price * 0.9)::integer as discount_price
from person_order
join person p on p.id = person_order.person_id
join menu m on person_order.menu_id = m.id
) as v_symmetric_union
order by name, pizza_name


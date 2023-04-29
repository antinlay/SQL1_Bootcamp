create view v_price_with_discount as (
	select p.name,
		m.pizza_name,
		m.price,
		m.price - m.price * 0.1 as discount_price
	from menu m
		inner join person_order po on m.id = po.menu_id
		inner join person p on p.id = po.person_id
	order by 1,
		2
);
select *
from v_price_with_discount
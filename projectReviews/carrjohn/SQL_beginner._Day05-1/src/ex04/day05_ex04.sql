create unique index idx_menu_unique on menu (pizzeria_id, pizza_name);
explain analyze
select *
from menu
where pizza_name = 'sicilian pizza';
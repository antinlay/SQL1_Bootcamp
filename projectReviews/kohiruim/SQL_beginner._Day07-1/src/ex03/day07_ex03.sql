with total_count AS (
	(select pizzeria.name, 'visit' AS action_type
	 from pizzeria
	 inner join person_visits on person_visits.pizzeria_id = pizzeria.id)
	 UNION ALL
	 (select pizzeria.name, 'order' AS action_type
	 from pizzeria
	 inner join menu on pizzeria.id = menu.pizzeria_id
	 inner join person_order on menu.id = person_order.menu_id))

select name, count(*) as total_count from total_count
group by name
order by 2 desc;
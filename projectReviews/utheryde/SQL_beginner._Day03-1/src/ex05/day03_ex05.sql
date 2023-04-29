select pizzeria.name from pizzeria
join menu m on pizzeria.id = m.pizzeria_id
join person_visits pv on pizzeria.id = pv.pizzeria_id
join person p on p.id = pv.person_id
where p.name = 'Andrey'
EXCEPT
select pizzeria.name from pizzeria
join menu m on pizzeria.id = m.pizzeria_id
join person_order po on m.id = po.menu_id
join person p on p.id = po.person_id
where p.name = 'Andrey'
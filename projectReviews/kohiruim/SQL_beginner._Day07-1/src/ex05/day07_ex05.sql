select DISTINCT name from person
inner join person_order on person.id = person_order.person_id
where person.id = person_order.person_id
order by 1;

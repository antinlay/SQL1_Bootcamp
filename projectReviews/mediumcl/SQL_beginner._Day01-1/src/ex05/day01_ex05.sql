SELECT person.id as "person.id", person.name as "person.name", age, 
gender, address, pizzeria.id as "pizzeria.id", pizzeria.name as "pizzeria.name", rating
FROM pizzeria CROSS JOIN person
order by 1, 6

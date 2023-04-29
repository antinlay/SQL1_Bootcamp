SELECT person_order.order_date, concat(person.name::text, ' (age:', person.age, ')') AS person_information
FROM person_order 
LEFT JOIN person ON person.id = person_order.person_id
ORDER BY 1, 2;

SELECT person_order.order_date, concat(person.name::text, ' (age:', person.age, ')') AS person_information
FROM (SELECT id AS person_id, "name", age
    FROM person) AS person
NATURAL JOIN person_order
ORDER BY 1, 2;

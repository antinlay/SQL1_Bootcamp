SELECT order_date, CONCAT(name, ' (age:', age, ')')  AS person_information
FROM (SELECT id AS person_id, name, age FROM person) p
NATURAL JOIN person_order
ORDER BY order_date ASC, person_information ASC;

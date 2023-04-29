SELECT order_date,
  CONCAT(name, '(age:', age, ')') AS person_information
FROM person_order
  JOIN person ON person.id = person_order.person_id
ORDER BY order_date,
  name
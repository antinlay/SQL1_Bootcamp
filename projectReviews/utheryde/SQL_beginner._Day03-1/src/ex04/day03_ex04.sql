WITH sample AS (
    SELECT pizzeria.name, gender FROM person_order
        JOIN person ON person_id = person.id
        JOIN menu ON menu_id = menu.id
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id),
     sample_female AS (SELECT name FROM sample WHERE gender = 'female'),
     sample_male AS (SELECT name FROM sample WHERE gender = 'male')

SELECT name AS pizzeria_name
FROM (
         (SELECT * FROM sample_male EXCEPT SELECT * FROM sample_female)
         UNION
         (SELECT * FROM sample_female EXCEPT SELECT * FROM sample_male)
     ) AS u
ORDER BY pizzeria_name;
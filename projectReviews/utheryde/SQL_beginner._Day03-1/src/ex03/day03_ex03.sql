with sample as (
    select pizzeria.name, gender from person_visits
        JOIN person on person_id = person.id
        JOIN pizzeria on pizzeria_id = pizzeria.id),
    sample_female as (select name from sample where gender = 'female'),
    sample_male as (select name from sample where gender = 'male')

select name as pizzeria_name
from (
    (select * from sample_male except all select * from sample_female)
    union all
    (select * from sample_female except all select * from sample_male)
     ) as uall
order by pizzeria_name;












select name as pizzeria_name
from (select pizzeria.name
    from pizzeria join person_visits pv on pizzeria.id = pv.pizzeria_id
    join person p2 on pv.person_id = p2.id
    where p2.gender = 'female'

    except all

    select pizzeria.name
    from pizzeria join person_visits pv on pizzeria.id = pv.pizzeria_id
    join person p2 on pv.person_id = p2.id
    where p2.gender = 'male') as a

union all

(select pizzeria.name
from pizzeria join person_visits pv on pizzeria.id = pv.pizzeria_id
join person p2 on pv.person_id = p2.id
where p2.gender = 'male'

except all

select pizzeria.name
from pizzeria join person_visits pv on pizzeria.id = pv.pizzeria_id
join person p2 on pv.person_id = p2.id
where p2.gender = 'female')
order by pizzeria_name;

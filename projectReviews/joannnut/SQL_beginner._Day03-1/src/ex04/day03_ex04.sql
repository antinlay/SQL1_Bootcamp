select name as pizzeria_name
from (select pizzeria.name
    from pizzeria join menu m on pizzeria.id = m.pizzeria_id
    join person_order po on po.menu_id = m.id
    join person p on po.person_id = p.id
    where p.gender = 'female'

    except

    select pizzeria.name
    from pizzeria join menu m on pizzeria.id = m.pizzeria_id
    join person_order po on po.menu_id = m.id
    join person p on po.person_id = p.id
    where p.gender = 'male') as a

union

(select pizzeria.name
    from pizzeria join menu m on pizzeria.id = m.pizzeria_id
    join person_order po on po.menu_id = m.id
    join person p on po.person_id = p.id
    where p.gender = 'male'

except

select pizzeria.name
    from pizzeria join menu m on pizzeria.id = m.pizzeria_id
    join person_order po on po.menu_id = m.id
    join person p on po.person_id = p.id
    where p.gender = 'female')
order by pizzeria_name;

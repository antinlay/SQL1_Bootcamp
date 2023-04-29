select coalesce (p.name, '-') as person_name,
       pv.visit_date,
       coalesce(pz.name, '-') as pizzeria_name
from person p
left join 
   (select * from person_visits
            where visit_date between '2022-01-01' and '2022-01-03') as pv
on pv.person_id = p.id
full join (select * from pizzeria) as pz
on pv.pizzeria_id = pz.id
order by 1, 2, 3
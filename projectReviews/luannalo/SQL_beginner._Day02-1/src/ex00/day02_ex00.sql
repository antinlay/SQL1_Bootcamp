select pz.name as pizzeria_name,
  pz.rating as rating
from pizzeria as pz
  left join person_visits pv on pv.pizzeria_id = pz.id
where pv.person_id is NULL;
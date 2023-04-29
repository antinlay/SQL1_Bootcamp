select name, count(*) as count_of_visits
from person
inner join person_visits on person_visits.person_id = person.id
group by name
having count(*) > 3;
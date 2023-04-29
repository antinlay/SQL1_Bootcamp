SELECT order_date as action_date, person_id as person_id
from person_order
intersect
SELECT visit_date as action_date, person_id as person_id
from person_visits
order by 1, 2 desc  

set enable_seqscan = false;

explain analyse
select pizza_name, piz.name
from menu m
         join pizzeria piz on m.pizzeria_id = piz.id;


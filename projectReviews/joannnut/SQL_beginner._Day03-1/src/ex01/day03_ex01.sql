select m.id as menu_id
from menu as m left join person_order po on m.id = po.menu_id
where po.order_date is null
order by 1;

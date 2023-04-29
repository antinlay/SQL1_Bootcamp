insert into menu (id, pizzeria_id, pizza_name, price)
VALUES (
        (
            select max(menu.id) + 1
            from menu
        ),
        (
            select id
            from pizzeria
            where name = 'Dominos'
        ),
        'sicilian pizza',
        900
    );
select count(*) = 1 as check
from menu
where id = 20
    and pizzeria_id = 2
    and pizza_name = 'sicilian pizza'
    and price = 900
insert into person_order (id, person_id, menu_id, order_date)
values (
        (
            select max(id) + 1
            from person_order
        ),
        (
            select id
            from person
            where name = 'Denis'
        ),
        (
            select id
            from menu
            where pizza_name = 'sicilian pizza'
        ),
        '2022-02-24'
    ),
    (
        (
            select max(id) + 2
            from person_order
        ),
        (
            select id
            from person
            where name = 'Irina'
        ),
        (
            select id
            from menu
            where pizza_name = 'sicilian pizza'
        ),
        '2022-02-24'
    );
select count(*) = 2 as check
from person_order
where order_date = '2022-02-24'
    and person_id in (6, 4)
    and menu_id =(
        select id
        from menu
        where pizza_name = 'sicilian pizza'
    )
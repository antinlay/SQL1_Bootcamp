create view v_symmetric_union as (
    with r_person_visits as (
        select person_id
        from person_visits
        where visit_date = '2022-01-02'
    ),
    s_person_visits as (
        select person_id
        from person_visits
        where visit_date = '2022-01-06'
    ) (
        select person_id
        from r_person_visits
        except
        select person_id
        from s_person_visits
    )
    union
    (
        select person_id
        from s_person_visits
        except
        select person_id
        from r_person_visits
    )
    order by 1
)
select *
from v_symmetric_union
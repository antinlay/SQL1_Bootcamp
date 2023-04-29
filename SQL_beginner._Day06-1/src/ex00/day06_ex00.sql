CREATE TABLE IF NOT EXISTS person_discounts (
    id bigint primary key,
    person_id bigint not null,
    pizzeria_id bigint not null,
    discount numeric,
    constraint uk_person_discounts unique (person_id, pizzeria_id, discount),
    constraint fk_person_discounts_person_id foreign key (person_id) references person(id),
    constraint fk_person_discounts_pizzeria_id foreign key (pizzeria_id) references pizzeria(id)
)
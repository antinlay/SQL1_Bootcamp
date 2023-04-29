COMMENT ON TABLE person_discounts
    IS 'This table stores the discounts that are applicable to persons.';

COMMENT ON COLUMN person_discounts.id
    IS 'ID primary key';

COMMENT ON COLUMN person_discounts.person_id
    IS 'ID of the person.';

COMMENT ON COLUMN person_discounts.pizzeria_id
    IS 'ID of the pizzeria.';

COMMENT ON COLUMN person_discounts.discount
    IS 'The percentage discount that is applicable to the person.';
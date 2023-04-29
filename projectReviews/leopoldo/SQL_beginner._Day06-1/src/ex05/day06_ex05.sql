COMMENT ON TABLE person_discounts IS 'Table with discounts for persons in pizzerias';
COMMENT ON COLUMN person_discounts.id IS 'Primary key';
COMMENT ON COLUMN person_discounts.person_id IS 'Value should not be NULL';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Value should not be NULL';
COMMENT ON COLUMN person_discounts.discount IS 'Vallue should not be NULL, Default value is 0, Values should be in range 0-100 persents'
ALTER TABLE person_discounts add CONSTRAINT ch_nn_person_id CHECK (person_id IS NOT NULL);
ALTER TABLE person_discounts add CONSTRAINT ch_nn_pizzeria_id CHECK (pizzeria_id IS NOT NULL);
ALTER TABLE person_discounts add CONSTRAINT ch_nn_pizzeria_id CHECK (discount IS NOT NULL);
ALTER TABLE person_discounts alter column discount SET  default 0;
ALTER TABLE person_discounts add CONSTRAINT ch_range_discount CHECK (discount >= 0 AND discount<= 100);

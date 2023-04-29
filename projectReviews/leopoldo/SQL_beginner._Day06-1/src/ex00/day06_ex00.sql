CREATE TABLE person_discounts (
	id BIGINT primary key,
	person_id BIGINT not null,
	pizzeria_id BIGINT not null,
	discount NUMERIC(5, 2),
	CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person(id),
	CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria(id)
);
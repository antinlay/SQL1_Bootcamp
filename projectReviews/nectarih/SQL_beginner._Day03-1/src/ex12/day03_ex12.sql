WITH po_id AS (SELECT MAX(id) AS id FROM person_order),
     p_id AS (SELECT MIN(id) AS id FROM person),
     c_id AS (SELECT COUNT(*) AS id FROM person),
     m_id AS (SELECT id FROM menu WHERE pizza_name = 'greek pizza')

INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT generate_series((SELECT id FROM po_id) + 1, (SELECT id FROM po_id) + (SELECT id FROM c_id)),
       generate_series((SELECT id FROM p_id), (SELECT id FROM c_id)),
       (SELECT id FROM m_id),
       TIMESTAMP '2022-02-25';

SELECT * FROM person_order;
COMMENT ON TABLE person_discounts IS 'This table describe discount all persons have visits to pizzeria';
COMMENT ON COLUMN person_discounts.id IS 'Identificator';
COMMENT ON COLUMN person_discounts.person_id IS 'id person visiting pizzeria';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'id pizzeria which visiting persons';
COMMENT ON COLUMN person_discounts.discount IS 'discount for each person visiting pizzeria';
SELECT relname,
  obj_description(c.oid)
FROM pg_class c
WHERE obj_description(c.oid) IS NOT NULL;
SELECT cols.table_name,
  cols.column_name,
  pgd.description
FROM information_schema.columns cols
  LEFT JOIN pg_catalog.pg_statio_all_tables st ON cols.table_schema = st.schemaname
  AND cols.table_name = st.relname
  LEFT JOIN pg_catalog.pg_description pgd ON st.relid = pgd.objoid
  AND pgd.objsubid = cols.ordinal_position
WHERE cols.table_name = 'person_discounts';
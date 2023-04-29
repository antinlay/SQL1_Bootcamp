WITH A AS (
  SELECT name AS person_name1,
    id AS id1,
    address
  FROM person
),
B AS (
  SELECT name AS person_name2,
    id AS id2,
    address AS common_address
  FROM person
)
SELECT person_name1,
  person_name2,
  common_address
FROM A
  JOIN B ON A.address = common_address
WHERE id1 > id2
ORDER BY 1,
  2;
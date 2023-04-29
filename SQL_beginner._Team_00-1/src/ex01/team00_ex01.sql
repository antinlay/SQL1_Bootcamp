WITH RECURSIVE a_traces(tour, point1, point2, price, sum) AS (
  SELECT t1,
    t1,
    t2,
    price,
    price
  FROM ALL_TOURS
  WHERE t1 = 'a'
  UNION ALL
  SELECT parent.tour || ',' || child.t1 AS trace,
    child.t1,
    child.t2,
    child.price,
    parent.sum + child.price AS sum
  FROM ALL_TOURS AS child
    JOIN a_traces AS parent ON child.t1 = parent.point2
  WHERE tour NOT LIKE '%' || child.t1 || '%'
),
ALL_TOURS AS (
  SELECT *
  FROM city_and_price
  UNION
  SELECT t2,
    t1,
    price
  FROM city_and_price
),
MIN_MAX_SUM (sum) AS (
  SELECT min(sum)
  FROM a_traces
  WHERE length(tour) = 7
    AND point2 = 'a'
  UNION
  SELECT max(sum)
  FROM a_traces
  WHERE length(tour) = 7
    AND point2 = 'a'
)
SELECT *
FROM a_traces;
SELECT sum AS total_cost,
  ('{' || tour || ',' || point2 || '}') AS tour
FROM a_traces
WHERE length(tour) = 7
  AND point2 = 'a'
  AND (
    sum = (
      SELECT min(sum)
      FROM MIN_MAX_SUM
    )
    OR sum = (
      SELECT max(sum)
      FROM MIN_MAX_SUM
    )
  )
ORDER BY total_cost,
  tour;
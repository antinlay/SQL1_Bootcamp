CREATE TABLE city_and_price (
  t1 varchar,
  t2 varchar,
  price integer not null default 0
);
INSERT INTO city_and_price
VALUES ('a', 'b', 10),
  ('a', 'd', 20),
  ('a', 'c', 15),
  ('b', 'c', 35),
  ('b', 'd', 25),
  ('c', 'd', 30);
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
SUMM (sum) AS (
  SELECT min(sum)
  FROM a_traces
  WHERE length(tour) = 7
    AND point2 = 'a'
)
SELECT sum AS total_cost,
  ('{' || tour || ',' || point2 || '}') AS tour
FROM a_traces
WHERE length(tour) = 7
  AND point2 = 'a'
  AND sum = (
    SELECT sum
    FROM SUMM
  )
ORDER BY total_cost,
  tour;
with t as (
  with recursive _n as (
    select point1,
      point2,
      cost,
      1 as level,
      array [point1] AS path,
      FALSE AS cycle,
      array [cost] AS costs
    from city_and_price
    where point1 = 'a'
    union all
    select city_and_price.point1,
      city_and_price.point2,
      city_and_price.cost + _n.cost as cost,
      _n.level + 1 as level,
      _n.path || city_and_price.point1 AS path,
      city_and_price.point1 = ANY (_n.path) AS cycle,
      _n.costs || city_and_price.cost AS costs
    from city_and_price
      inner join _n on _n.point2 = city_and_price.point1
      and not cycle
  )
  select cost - costs [5] as total_cost,
    path as tour
  from _n
  where level = 5
    and 'a' = ANY(path)
    and 'b' = ANY(path)
    and 'c' = ANY(path)
    and 'd' = ANY(path)
    and path [1] = path [5]
  order by cost,
    path
)
select distinct *
from t
where total_cost = (
    select min(total_cost)
    from t
  )
order by 1,
  2;
-- DROP TABLE city_and_price
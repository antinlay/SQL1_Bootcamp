CREATE VIEW v_generated_dates AS
SELECT generate_date::date
FROM generate_series('2022-01-01', '2022-01-31', interval '1 day') as generate_date
ORDER BY 1;
select count(*) = 31 as check,
  min(generate_date) as check1,
  max(generate_date) as check2
from v_generated_dates;
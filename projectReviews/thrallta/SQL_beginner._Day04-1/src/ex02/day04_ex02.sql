CREATE VIEW v_generated_dates AS
SELECT generated_date::DATE
FROM generate_series('2022-01-01'::DATE, '2022-01-31', '1 day') AS generated_date
ORDER BY 1;
select count(*) = 31 as check,
  min(generated_date) as check1,
  max(generated_date) as check2
from v_generated_dates;
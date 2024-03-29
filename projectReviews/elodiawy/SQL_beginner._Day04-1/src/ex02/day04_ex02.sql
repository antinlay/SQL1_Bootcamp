create view v_generated_dates as
select d.date as generated_date
from generate_series('2022-01-01', '2022-01-31', interval '1 day') as d;
select count(*) = 31 as check,
  min(generated_date) as check1,
  max(generated_date) as check2
from v_generated_dates;
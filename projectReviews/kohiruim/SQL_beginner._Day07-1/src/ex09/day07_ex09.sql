select person.address as address, 
	   round((max(age::numeric)-(min(age::numeric)/max(age::numeric))), 2) AS formula,
       round(avg(age), 2) AS average,
	   round((max(age::numeric)-(min(age::numeric)/max(age::numeric))), 2) > round(avg(age), 2) as comparison
from person
group by person.address
order by 1;

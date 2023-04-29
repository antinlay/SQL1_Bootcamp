SELECT address,
       ROUND(MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric)), 2) as formula,
       ROUND(AVG(age::numeric), 2) as average,
       (SELECT
            CASE
                WHEN (MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric))) > AVG(age::numeric)
                    THEN
                        true
                    ELSE
                        false
       END) as comparison
FROM person
GROUP BY address
ORDER BY address;
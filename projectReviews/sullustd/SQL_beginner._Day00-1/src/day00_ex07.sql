SELECT id, name,
CASE
    WHEN age >= 10 AND age <= 20
        THEN '10-20'
    WHEN age > 20 AND age < 30
        THEN '20-30'
    ELSE 'other'
END AS interval_info
FROM person
ORDER BY interval_info;
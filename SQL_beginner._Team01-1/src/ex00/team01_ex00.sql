WITH sum_money AS (
    SELECT user_id,
        SUM(money) AS sum,
        type,
        currency_id
    FROM balance
    GROUP BY user_id,
        type,
        currency_id
    ORDER BY 1
),
new_balance AS (
    SELECT COALESCE(public.user.name, 'not defined') AS name,
        COALESCE(public.user.lastname, 'not defined') AS lastname,
        type,
        sum_money.sum AS volume,
        sum_money.currency_id
    FROM sum_money
        FULL JOIN public.user ON id = sum_money.user_id
),
last_rate AS (
    SELECT DISTINCT *
    FROM currency
    WHERE updated = (
            SELECT MAX(updated)
            FROM currency
        )
)
SELECT new_balance.name,
    lastname,
    type,
    volume,
    COALESCE(last_rate.name, 'not defined') AS currency_name,
    COALESCE(rate_to_usd, 1.0) AS last_rate_to_usd,
    volume * COALESCE(rate_to_usd, 1.0) AS total_volume_in_usd
FROM new_balance
    FULL JOIN last_rate ON currency_id = last_rate.id
ORDER BY name DESC,
    lastname,
    type;
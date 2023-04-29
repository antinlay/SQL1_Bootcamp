-- Func before date
CREATE FUNCTION fnc_bef_date(
    cur_id bigint,
    balance_date timestamp without time zone
) RETURNS timestamp without time zone AS $$
SELECT updated
FROM currency
WHERE updated <= balance_date
    AND cur_id = id
ORDER BY updated DESC
LIMIT 1;
$$ LANGUAGE SQL;
-- Func after date
CREATE FUNCTION fnc_aft_date(
    cur_id bigint,
    balance_date timestamp without time zone
) RETURNS timestamp without time zone AS $$
SELECT updated
FROM currency
WHERE updated >= balance_date
    AND cur_id = id
ORDER BY updated ASC
LIMIT 1 $$ LANGUAGE SQL;
-- Func compare
CREATE FUNCTION fnc_nearest_rate(
    cur_id bigint,
    balance_date timestamp without time zone
) RETURNS timestamp without time zone LANGUAGE PLPGSQL AS $$
DECLARE t1 numeric;
t2 numeric;
BEGIN t1 = EXTRACT(
    EPOCH
    FROM (
            balance_date - fnc_bef_date(cur_id, balance_date)
        )
);
t2 = EXTRACT(
    EPOCH
    FROM (
            fnc_aft_date(cur_id, balance_date) - balance_date
        )
);
IF (
    t1 > t2
    OR t1 IS NULL
) THEN RETURN fnc_aft_date(cur_id, balance_date);
ELSE RETURN fnc_bef_date(cur_id, balance_date);
END IF;
END;
$$;
-- Target table
SELECT COALESCE(pu.name, 'not defined') AS name,
    COALESCE(pu.lastname, 'not defined') AS lastname,
    pc.name AS currency_name,
    pc.rate_to_usd * pb.money AS currency_in_usd
FROM public.balance pb
    LEFT JOIN public.user pu ON pu.id = pb.user_id
    LEFT JOIN public.currency pc ON pb.currency_id = pc.id
WHERE pc.updated = fnc_nearest_rate(pc.id, pb.updated)
ORDER BY 1 DESC,
    2,
    3;
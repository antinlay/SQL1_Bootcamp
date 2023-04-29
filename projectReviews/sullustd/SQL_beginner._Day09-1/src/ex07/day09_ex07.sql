CREATE OR REPLACE FUNCTION func_minimum
(VARIADIC arr NUMERIC[])
	RETURNS NUMERIC
	LANGUAGE plpgsql
	IMMUTABLE
AS $$
BEGIN
RETURN (SELECT min($1[i]) AS mim_val FROM generate_subscripts($1, 1) g(i));
end;
$$ ;


SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);


drop function func_minimum(numeric[]);


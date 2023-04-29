CREATE OR REPLACE FUNCTION fnc_fibonacci (pstop INTEGER DEFAULT 10) RETURNS SETOF NUMERIC LANGUAGE plpgsql AS $$
DECLARE f0 numeric DEFAULT 0;
DECLARE f1 numeric DEFAULT 1;
BEGIN IF (pstop <= 0) THEN RETURN;
END IF;
RETURN NEXT f0;
WHILE (pstop >= f1) LOOP IF (pstop < f1) THEN EXIT;
ELSE RETURN NEXT f1;
SELECT f1,
	f0 + f1 INTO f0,
	f1;
END IF;
END LOOP;
END;
$$;
select *
from fnc_fibonacci(100);
select *
from fnc_fibonacci(20);
-- Создание функции fnc_fibonacci с входным параметром pstop и возвращаемым набором INT
CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop INT DEFAULT 10) RETURNS SETOF INT AS $$ -- Объявление переменных i и j типа int и установка их начальных значений
DECLARE i int = 0;
j int = 1;
BEGIN -- Если pstop >= 0, то добавляем первый элемент в возвращаемый набор
IF pstop >= 0 THEN RETURN NEXT i;
END IF;
-- Бесконечный цикл, пока i <= pstop и j <= pstop
LOOP -- Выходим из цикла, если i > pstop или j > pstop
EXIT
WHEN i > pstop
OR j > pstop;
-- Добавляем j в возвращаемый набор и пересчитываем i и j
RETURN NEXT j;
SELECT j,
    i + j INTO i,
    j;
end loop;
END;
$$ LANGUAGE plpgsql;
select *
from fnc_fibonacci(100);
select *
from fnc_fibonacci(20);
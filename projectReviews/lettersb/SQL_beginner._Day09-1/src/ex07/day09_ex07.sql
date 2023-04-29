-- Создаем функцию func_minimum, которая принимает массив чисел типа NUMERIC в качестве параметра
CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[]) RETURNS NUMERIC AS
$$
DECLARE
    -- Объявляем переменную x типа NUMERIC и присваиваем ей значение первого элемента массива
    x NUMERIC := arr[1];
BEGIN
    -- Начинаем цикл, который будет проходить от второго элемента до последнего в массиве
    FOR counter IN 2..array_upper(arr, 1)
    LOOP
        -- Если текущий элемент меньше x, то присваиваем его значение x
        IF arr[counter] < x THEN x = arr[counter];
        END IF;
    end loop;
    -- Возвращаем наименьшее значение из массива
    return x;
END;
$$ LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
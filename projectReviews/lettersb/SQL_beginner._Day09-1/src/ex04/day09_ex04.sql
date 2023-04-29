-- Создание функции fnc_persons_male, возвращающей таблицу
CREATE OR REPLACE FUNCTION fnc_persons_male() RETURNS TABLE(id bigint, name varchar, age integer, gender varchar, address varchar) AS
$$
    -- Выбираем все столбцы из таблицы person, где значение столбца gender равно 'male'
    SELECT * FROM person WHERE gender = 'male';
$$ LANGUAGE sql;

-- Создание функции fnc_persons_female, возвращающей таблицу
CREATE OR REPLACE FUNCTION fnc_persons_female() RETURNS TABLE(id bigint, name varchar, age integer, gender varchar, address varchar) AS
$$
    -- Выбираем все столбцы из таблицы person, где значение столбца gender равно 'female'
    SELECT * FROM person WHERE gender = 'female';
$$ LANGUAGE SQL;

-- Выборка всех мужчин из таблицы person  
SELECT *
FROM fnc_persons_male();

-- Выборка всех женщин из таблицы person  
SELECT *
FROM fnc_persons_female();
UPDATE menu
    SET price = price - 0.1 * price
WHERE pizza_name = 'greek pizza';

SELECT * FROM menu;
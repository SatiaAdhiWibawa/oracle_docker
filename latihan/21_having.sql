-- HAVING
-- Digunakan untuk memfilter group baris yang di return oleh group by clause
-- HAVING harus diikuti oleh GROUP BY
-- Simpelnya HAVING digunakan untuk filter hasil group by

-- SELECT column_name, aggregate_function(column_name) FROM table_name WHERE condition GROUP BY column_name HAVING condition;

-- CONTOH HAVING
SELECT ORDER_ID, SUM(UNIT_PRICE * QUANTITY) ORDER_VALUE
FROM ORDER_ITEMS
GROUP BY ORDER_ID
HAVING SUM(UNIT_PRICE * QUANTITY) > 1000000 -- Filter hasil group by
ORDER BY ORDER_VALUE DESC;


-- GROUP BY LEBIH KOMPLEKS
SELECT 
    ORDER_ID,
    COUNT(ITEM_ID) TOTAL_ITEMS,
    SUM(UNIT_PRICE * QUANTITY) ORDER_VALUE
FROM ORDER_ITEMS
GROUP BY ORDER_ID
HAVING
    SUM(UNIT_PRICE * QUANTITY) > 500000 AND
    COUNT(ITEM_ID) BETWEEN 10 AND 12
ORDER BY ORDER_VALUE DESC;


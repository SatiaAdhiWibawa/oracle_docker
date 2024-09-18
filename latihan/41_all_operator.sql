-- OPERATOR ALL
-- Digunakan untuk membandingkan nilai dengan daftar nilai
-- atau set hasil yang dikembalikan oleh subquery

-- OPERATOR ALL ( V1, V2, V3, ... )
-- atau
-- OPERATOR ALL ( subquery )
-- SYARAT
-- Operator ALL harus didahului oleh operator perbandingan seperti =, >, <, >=, <=, <>, != dan diikuti oleh subquery atau daftar nilai.
-- daftar atau subquery harus diapit oleh ().

-- SELECT *
-- FROM TABLE_NAME
-- WHERE COLUMN_NAME > ALL (
--      V1,
--      V2,
--      V3
-- );

-- trasformasi ALL OPERATOR (adalah operasi AND kalo ALL)
-- beda dengan ANY (adalah operasi OR kalo ANY)
-- 

-- SELECT *
-- FROM TABLE_NAME
-- WHERE COLUMN_NAME > V1
-- AND COLUMN_NAME > V2
-- AND COLUMN


-- ALL MENGGUNAKAN SUBQUERY
SELECT PRODUCT_NAME, LIST_PRICE
FROM PRODUCTS
WHERE LIST_PRICE > ALL (
    SELECT LIST_PRICE
    FROM PRODUCTS
    WHERE CATEGORY_ID = 1
)
ORDER BY PRODUCT_NAME;


-- MENGGUNAKAN ANY AGAR HASIL SAMA
SELECT PRODUCT_NAME, LIST_PRICE
FROM PRODUCTS P1
WHERE NOT (
   P1.LIST_PRICE <= ANY (
       SELECT LIST_PRICE
       FROM PRODUCTS P2
       WHERE P2.CATEGORY_ID = 1
   )
)
ORDER BY PRODUCT_NAME;

-- kita gunakan NOT EXISTS untuk menghasilkan hasil yang sama
SELECT PRODUCT_NAME, LIST_PRICE
FROM PRODUCTS P1
WHERE NOT EXISTS(
    SELECT LIST_PRICE
    FROM PRODUCTS P2
    WHERE P2.CATEGORY_ID = 1
    AND P2.LIST_PRICE >= P1.LIST_PRICE
)
ORDER BY PRODUCT_NAME;


-- AVERAGE LIST PRICE
-- QUERY INI AKAN MENGHITUNG RATA-RATA LIST PRICE
SELECT
    ROUND(AVG(LIST_PRICE), 2) AS AVERAGE_LIST_PRICE
FROM PRODUCTS
ORDER BY AVERAGE_LIST_PRICE;

-- MEMBUAT SUBQUERY DENGAN ALL
-- bisa menggunakan semua operator perbandingan seperti =, >, <, >=, <=, <>, !=
SELECT PRODUCT_NAME, LIST_PRICE
FROM PRODUCTS
WHERE LIST_PRICE > ALL (
    SELECT
        ROUND(AVG(LIST_PRICE), 2)
    FROM PRODUCTS
    GROUP BY CATEGORY_ID
)
ORDER BY PRODUCT_NAME;
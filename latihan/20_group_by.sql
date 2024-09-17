-- KALUSA GROUP BY
-- Ini sering digunakan dengan fungsi aggregate seperti COUNT(), SUM(), AVG(), MAX(), MIN()
-- SELECT column_1, column_2, column_3 FROM TABLE_NAME GROUP BY column_1, column_2, column_3;

-- Jika ingin melakukan beberapa tingkatan pengelompokan yang harus dihitung sekaligus
-- gunakan fungsi ROLLUP
-- SELECT column_1, column_2, column_3 FROM TABLE_NAME GROUP BY ROLLUP(column_1, column_2, column_3);


-- CEK COLUMN STATUS YANG ADA DI TABLE ORDER
SELECT STATUS FROM orders;

-- GUNAKAN GROUP BY UNTUK MELIHAT STATUS YANG ADA DI TABLE ORDER
SELECT STATUS FROM orders GROUP BY STATUS;

-- SEBENARNYA QUERY DI ATAS SAMA DENGAN MENGGUNAKAN DISTINCT
SELECT DISTINCT STATUS FROM orders;


-- CONTOH GROUP BY DENGAN COUNT dan ORDER BY
SELECT CUSTOMER_ID, COUNT(ORDER_ID) total_order
FROM ORDERS
GROUP BY CUSTOMER_ID
ORDER BY TOTAL_ORDER DESC;

-- CONTOH GROUP BY DENGAN EXTRACT DAN ORDER BY
SELECT EXTRACT(YEAR FROM ORDER_DATE) YEAR, COUNT(ORDER_ID) total_order
FROM ORDERS
GROUP BY EXTRACT(YEAR FROM ORDER_DATE) -- GROUP BY YEAR harus menggunakan fungsi EXTRACT karena ORDER_DATE adalah tipe DATE
ORDER BY YEAR DESC;

-- CONTOH GROUP BY DENGAN JOIN, WHERE, dan ORDER BY
SELECT NAME, COUNT(ORDER_ID) total_order
FROM ORDERS
JOIN CUSTOMERS USING(CUSTOMER_ID)
WHERE STATUS = 'Shipped'
GROUP BY NAME
ORDER BY TOTAL_ORDER DESC;


-- CONTOH ROLLUP
SELECT
    CUSTOMER_ID,
    STATUS,
    SUM(QUANTITY * UNIT_PRICE) sales
FROM ORDERS
JOIN ORDER_ITEMS USING(ORDER_ID)
GROUP BY ROLLUP(
    CUSTOMER_ID,
    STATUS
    )

-- GROUP BY ROLLUP(CUSTOMER_ID, STATUS):

-- ROLLUP adalah fungsi dalam Oracle yang memungkinkan kita membuat agregasi data yang lebih detail.
-- Di sini, Oracle akan melakukan grup data berdasarkan:
--      Kombinasi CUSTOMER_ID dan STATUS (level 1).
--      Semua STATUS dalam satu CUSTOMER_ID (level 2).
--      Semua CUSTOMER_ID secara keseluruhan (level 3).
-- Dengan ROLLUP, hasilnya akan menampilkan subtotal (untuk setiap CUSTOMER_ID) dan total keseluruhan (untuk semua CUSTOMER_ID).



-- CONTOH ROLLUP DENGAN WHERE
-- hasilnya akan menampilkan subtotal (untuk setiap CUSTOMER_ID) dan total keseluruhan (untuk semua CUSTOMER_ID) dengan CUSTOMER_ID = 4
SELECT
    CUSTOMER_ID,
    STATUS,
    SUM(QUANTITY * UNIT_PRICE) sales
FROM ORDERS
JOIN ORDER_ITEMS USING(ORDER_ID)
WHERE CUSTOMER_ID = 4
GROUP BY 
    CUSTOMER_ID,
ROLLUP(
    STATUS
    )
-- PIVOT
-- PIVOT adalah salah satu fitur yang digunakan untuk melakukan transformasi data dari baris menjadi kolom
-- menggabungkan fungsi agregasi untuk menghasilkan laporan yang lebih informatif.

-- PERINTAH DASAR PIVOT

-- SELECT
--     select_list
-- FROM
--     table_name
-- PIVOT [XML]
-- (
--     pivot_clause
--     pivote_for_clause
--     pivot_in_clause
-- );

-- CREATE VIEW ORDER_STATS

CREATE OR REPLACE VIEW ORDER_STATS AS
SELECT
    CATEGORY_NAME,
    STATUS,
    ORDER_ID
FROM ORDER_ITEMS
JOIN ORDERS USING(ORDER_ID)
JOIN PRODUCTS USING(PRODUCT_ID)
JOIN PRODUCT_CATEGORIES USING(CATEGORY_ID);



-- CEK DATA VIEW ORDER_STATS
SELECT * FROM ORDER_STATS;


-- PIVOT DATA

-- mencari jumlah order berdasarkan status dan category_name
SELECT * FROM ORDER_STATS
PIVOT(
    COUNT(ORDER_ID)
    FOR CATEGORY_NAME
    IN (
        'CPU' cpu,
        'Video Card' VideoCard,
        'Mother Board' MotherBoard,
        'Storage' Storage
    )
)
ORDER BY STATUS DESC;


-- UPDATE VIEW ORDER_STATS
CREATE OR REPLACE VIEW ORDER_STATS AS
SELECT
    CATEGORY_NAME,
    STATUS,
    ORDER_ID,
    SUM(QUANTITY * UNIT_PRICE) AS ORDER_VALUE
FROM ORDER_ITEMS
JOIN ORDERS USING(ORDER_ID)
JOIN PRODUCTS USING(PRODUCT_ID)
JOIN PRODUCT_CATEGORIES USING(CATEGORY_ID)
GROUP BY CATEGORY_NAME, STATUS, ORDER_ID;


-- CEK DATA VIEW ORDER_STATS
SELECT * FROM ORDER_STATS;


-- Mengambil data order berdasarkan status dan category_name
-- Menggunakan fungsi agregasi SUM untuk menghitung total penjualan
-- Menggunakan fungsi agregasi COUNT untuk menghitung jumlah order
-- Menggunakan fungsi PIVOT untuk melakukan transformasi data
-- Menggunakan IN untuk menentukan kolom yang akan di pivot
SELECT * FROM ORDER_STATS
PIVOT
(
    COUNT(ORDER_ID) ORDERS,
    SUM(ORDER_VALUE) SALES
    FOR CATEGORY_NAME
    IN (
        'CPU' cpu,
        'Video Card' VideoCard,
        'Mother Board' MotherBoard,
        'Storage' Storage
    )
)
ORDER BY STATUS DESC;


-- PIVOT dengan status
SELECT * FROM ORDER_STATS
PIVOT
(
    COUNT(ORDER_ID) ORDERS,
    SUM(ORDER_VALUE) SALES
    FOR STATUS
    IN (
        'Shipped' Shipped,
        'Canceled' Canceled,
        'Pending' Pending
    )
)
ORDER BY CATEGORY_NAME DESC;
-- ROLLUP
-- ROLLUP adalah ekstensi dari GROUP BY yang memungkinkan kita untuk membuat subtotal dan total dari hasil agregasi.
-- sebuah perintah untuk menjumlahkan dari sebuah group by

-- Query diabawah ini akan mengembalikan pendapatan penjualan oleh pelanggan pada tahun 2017
SELECT CUSTOMER_ID, SUM(QUANTITY * UNIT_PRICE) AMOUNT
FROM ORDERS O
JOIN ORDER_ITEMS OI ON O.ORDER_ID = OI.ORDER_ID
WHERE 
    STATUS = 'Shipped'
    AND SALESMAN_ID IS NOT NULL
    AND EXTRACT(YEAR FROM ORDER_DATE) = 2017
GROUP BY CUSTOMER_ID
ORDER BY AMOUNT DESC;

-- Untuk mendapatkan total pendapatan, menggunakan subquery
SELECT SUM(AMOUNT) TOTAL_AMOUNT
FROM (
    SELECT CUSTOMER_ID, SUM(QUANTITY * UNIT_PRICE) AMOUNT
    FROM ORDERS O
    JOIN ORDER_ITEMS OI ON O.ORDER_ID = OI.ORDER_ID
    WHERE 
        STATUS = 'Shipped'
        AND SALESMAN_ID IS NOT NULL
        AND EXTRACT(YEAR FROM ORDER_DATE) = 2017
    GROUP BY CUSTOMER_ID
);


-- DUA QUERY DI ATAS ADALAH CARA CONVENTIONAL, MEMBUAT 2 QUERY UNTUK MENDAPATKAN TOTAL PENDAPATAN


-- ORACLE Menyediakan cara lebih baik, yaitu menggunakan ROLLUP
-- Kita bisa lakukan 2 query diatas dalam 1 query dengan menggunakan ROLLUP
SELECT
    CUSTOMER_ID,
    SUM(QUANTITY * UNIT_PRICE) AMOUNT
FROM
    ORDERS      O
    JOIN ORDER_ITEMS OI
    ON O.ORDER_ID = OI.ORDER_ID
WHERE
    STATUS = 'Shipped'
    AND SALESMAN_ID IS NOT NULL
    AND EXTRACT(YEAR FROM ORDER_DATE) = 2017
GROUP BY
    ROLLUP(CUSTOMER_ID);


-- perintah dasar ROLLUP
-- SELECT
--     column1,
--     column2,
--     column3,
--     aggregate_function(column4)
-- FROM 
--     table_name
-- GROUP BY
--     ROLLUP(column1, column2, column3);

-- untuk mengurangi jumlah subtotal, dapat melakukan ROLLUP sebagian
-- SELECT
--     column1,
--     column2,
--     aggregate_function(column3)
-- FROM
--     table_name
-- GROUP BY
--     column1
--     ROLLUP(column2);



-- SEMUA DI LAKUKAN ROLLUP
-- MENDAPATKAN PENDAPATAN PENJUALAN BERDASARKAN SALESMAN DAN CUSTOMER
-- MENGGUNAKAN ROLLUP
-- MENDAPATKAN SUB TOTAL DARI SALESMAN DAN CUSTOMER
SELECT
    O.SALESMAN_ID,
    O.CUSTOMER_ID,
    SUM(OI.QUANTITY * OI.UNIT_PRICE) AMOUNT
FROM
    ORDERS O
    JOIN ORDER_ITEMS OI ON OI.ORDER_ID = O.ORDER_ID
WHERE
    STATUS = 'Shipped'
    AND O.SALESMAN_ID IS NOT NULL
    AND EXTRACT(YEAR FROM O.ORDER_DATE) = 2017
GROUP BY
    ROLLUP(O.SALESMAN_ID, O.CUSTOMER_ID);



-- MELAKUKAN SEBAGIAN ROLLUP
SELECT
    O.SALESMAN_ID,
    O.CUSTOMER_ID,
    SUM(OI.QUANTITY * OI.UNIT_PRICE) AMOUNT
FROM
    ORDERS O
    JOIN ORDER_ITEMS OI ON OI.ORDER_ID = O.ORDER_ID
WHERE
    STATUS = 'Shipped'
    AND O.SALESMAN_ID IS NOT NULL
    AND EXTRACT(YEAR FROM O.ORDER_DATE) = 2017
GROUP BY
    O.SALESMAN_ID,
    ROLLUP(O.CUSTOMER_ID);
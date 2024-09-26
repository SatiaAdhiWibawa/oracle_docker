-- SUBQUERY
-- SUBQUERY adalah SELCET pernyataan bersarang didalam pernyataan lain
-- Seperti SELCET, INSERT, UPDATE, DELETE.
-- Biasanya, bisa menggunakan subquery di mana pun anda menggunakan ekspresi.

-- SUBQUERY bisa didalam WHERE, bisa didalam COLUMN

-- contoh memiliki 2 query

-- 1. query utama: Mengambil harga tertinggi dari tabel PRODUCTS
SELECT MAX(LIST_PRICE) AS MAX_LIST_PRICE FROM PRODUCTS;
-- HASILNYA: 8867.99

-- 2. lalu mencari detail product berdasarkan harga tertinggi
SELECT
    PRODUCT_ID,
    PRODUCT_NAME,
    LIST_PRICE 
FROM PRODUCTS 
WHERE LIST_PRICE = 8867.99;


-- kedua query di atas bisa dibuat dengan 1 kali query, menggunakan subquery

-- CONTOH: subquery di dalam WHERE
SELECT
    PRODUCT_ID,
    PRODUCT_NAME,
    LIST_PRICE 
FROM PRODUCTS 
WHERE LIST_PRICE = (SELECT MAX(LIST_PRICE) FROM PRODUCTS);


-- CONTOH: Membuat subquery di dalam COLUMN
SELECT
    PRODUCT_NAME,
    LIST_PRICE,
    ROUND( (
        SELECT
            AVG(LIST_PRICE)
        FROM
            PRODUCTS P1
        WHERE
            P1.CATEGORY_ID = P2.CATEGORY_ID
    ), 2 ) AS AVG_LIST_PRICE
FROM PRODUCTS P2
ORDER BY P2.PRODUCT_NAME;

-- Membuat query menjadi sumber data, yang bisanya menggunakan SELECT * FROM tabel,
-- bisa diganti dengan subquery SELCET * FROM (SELECT * FROM tabel) AS alias

-- CONTOH: Menggunakan subquery sebagai sumber data
SELECT
    ORDER_ID,
    ORDER_VALUE
FROM
    (
        SELECT
        ORDER_ID,
        SUM(QUANTITY * UNIT_PRICE) AS ORDER_VALUE
        FROM ORDER_ITEMS
        GROUP BY ORDER_ID
        ORDER BY ORDER_VALUE DESC
    )
FETCH FIRST 10 ROWS ONLY;


-- Bisa menggunakan subquery dengan operator pembanding
-- CONTOH: Menggunakan subquery dengan operator pembanding

SELECT
    PRODUCT_ID,
    PRODUCT_NAME,
    LIST_PRICE
FROM PRODUCTS
WHERE LIST_PRICE > (
    SELECT AVG(LIST_PRICE) FROM PRODUCTS
)
ORDER BY PRODUCT_NAME;


-- Bisa menggunakan subquery dengan operator IN dan NOT IN


-- DENGAN QUERY UNTUK MENCARI DATA SALESMAN_ID 
-- yang memiliki total penjualan >= 1.000.000 pada tahun 2017
SELECT
    SALESMAN_ID
FROM
    ORDERS
    JOIN ORDER_ITEMS
    USING(ORDER_ID)
WHERE
    STATUS = 'Shipped'
GROUP BY
    SALESMAN_ID,
    EXTRACT(YEAR FROM ORDER_DATE)
HAVING
    SUM(QUANTITY * UNIT_PRICE) >= 1000000
    AND EXTRACT(YEAR FROM ORDER_DATE) = 2017
    AND SALESMAN_ID IS NOT NULL;


-- Namun kita ingin mendapatkan data employee yang memiliki SALESMAN_ID tersebut
-- maka kita bisa menggunakan subquery
-- CONTOH: Menggunakan subquery dengan operator IN
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (
    SELECT SALESMAN_ID
    FROM ORDERS
    JOIN ORDER_ITEMS USING(ORDER_ID)
    WHERE STATUS = 'Shipped'
    GROUP BY
        SALESMAN_ID,
        EXTRACT(YEAR FROM ORDER_DATE)
    HAVING 
        SUM(QUANTITY * UNIT_PRICE) >= 1000000
        AND EXTRACT(YEAR FROM ORDER_DATE) = 2017
        AND SALESMAN_ID IS NOT NULL
)
ORDER BY FIRST_NAME, LAST_NAME;



-- Mencari data CUSTOMER_ID berdasarkan ORDER_DATE pada tahun 2017
SELECT CUSTOMER_ID
FROM ORDERS
WHERE EXTRACT(YEAR FROM ORDER_DATE) = 2017;


-- Namun kita ingin mendapatkan data CUSTOMER yang tidak melakukan ORDER pada tahun 2017
-- maka kita bisa menggunakan subquery

-- CONTOH: Menggunakan subquery dengan operator NOT IN
SELECT NAME
FROM CUSTOMERS
WHERE CUSTOMER_ID NOT IN (
    SELECT CUSTOMER_ID
    FROM ORDERS
    WHERE EXTRACT(YEAR FROM ORDER_DATE) = 2017
)
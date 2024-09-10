-- OPERATOR BETWEEN dan NOT BETWEEN
-- digunakan untuk menguji range nilai tertentu
-- Expression 
-- BETWEEN value1 AND value2
-- NOT BETWEEN value1 AND value2


-- BETWEEN
-- ambil data product_name dan standard_cost berdasrkan range standard_cost 500 sampai 600
SELECT PRODUCT_NAME, STANDARD_COST
FROM PRODUCTS
WHERE STANDARD_COST BETWEEN 500 AND 600
ORDER BY STANDARD_COST;

-- query di atas sama saja dengan kondisi seperti ini
SELECT PRODUCT_NAME, STANDARD_COST
FROM PRODUCTS
WHERE STANDARD_COST >= 500 AND STANDARD_COST <= 600
ORDER BY STANDARD_COST;


-- NOT BETWEEN
-- ambil data product_name dan standard_cost yang tidak berada di range standard_cost 500 sampai 600
SELECT PRODUCT_NAME, STANDARD_COST
FROM PRODUCTS
WHERE STANDARD_COST NOT BETWEEN 500 AND 600
ORDER BY STANDARD_COST;

-- query di atas sama saja dengan kondisi seperti ini
SELECT PRODUCT_NAME, STANDARD_COST
FROM PRODUCTS
WHERE STANDARD_COST < 500 OR STANDARD_COST > 600
ORDER BY STANDARD_COST;


-- BETWEEN menggunakan DATE
-- Ambil data order_id, customer_id, status, order_date 
-- berdasarkan range order_date 1 Desember 2016 sampai 31 Desember 2016
SELECT ORDER_ID, CUSTOMER_ID, STATUS, ORDER_DATE
FROM ORDERS
WHERE ORDER_DATE BETWEEN DATE '2016-12-01' AND DATE '2016-12-31'
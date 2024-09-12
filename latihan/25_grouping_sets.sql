-- GROUPING SETS
-- GROUPING SETS adalah fitur yang memungkinkan kita untuk melakukan pengelompokan berdasarkan beberapa kolom sekaligus

-- CREATE TABLE VIEWS UNTUK LATIHAN INI
CREATE VIEW customer_category_sales AS
SELECT 
    category_name category, 
    customers.name customer, 
    SUM(quantity*unit_price) sales_amount
FROM 
    orders
    INNER JOIN customers USING(customer_id)
    INNER JOIN order_items USING (order_id)
    INNER JOIN products USING (product_id)
    INNER JOIN product_categories USING (category_id)
WHERE 
    customer_id IN (1,2)
GROUP BY 
    category_name, 
    customers.name;

-- CEK DATA VIEWS
SELECT *
FROM CUSTOMER_CATEGORY_SALES
ORDER BY CUSTOMER, CATEGORY;

-- pengelompokan berdasarkan category
SELECT CATEGORY, SUM(SALES_AMOUNT) TOTAL_SALES FROM CUSTOMER_CATEGORY_SALES GROUP BY CATEGORY;

-- pengelompokan berdasarkan customer
SELECT CUSTOMER, SUM(SALES_AMOUNT) TOTAL_SALES FROM CUSTOMER_CATEGORY_SALES GROUP BY CUSTOMER;

-- pengelompokan berdasarkan category dan customer
SELECT CATEGORY, CUSTOMER, SUM(SALES_AMOUNT) TOTAL_SALES FROM CUSTOMER_CATEGORY_SALES GROUP BY CATEGORY, CUSTOMER;

-- total dari semua pengelompokan
SELECT SUM(SALES_AMOUNT) TOTAL_SALES FROM CUSTOMER_CATEGORY_SALES;

-- GABUNGKAN SEMUA FILTER DI ATAS DENGAN UNION ALL
SELECT CATEGORY, NULL, SUM(SALES_AMOUNT) TOTAL_SALES FROM CUSTOMER_CATEGORY_SALES GROUP BY CATEGORY
UNION ALL
SELECT NULL, CUSTOMER, SUM(SALES_AMOUNT) TOTAL_SALES FROM CUSTOMER_CATEGORY_SALES GROUP BY CUSTOMER
UNION ALL
SELECT CATEGORY, CUSTOMER, SUM(SALES_AMOUNT) TOTAL_SALES FROM CUSTOMER_CATEGORY_SALES GROUP BY CATEGORY, CUSTOMER
UNION ALL
SELECT NULL, NULL, SUM(SALES_AMOUNT) TOTAL_SALES FROM CUSTOMER_CATEGORY_SALES;

-- PENJELASAN :
-- Query diatas yang menggunakan UNION ALL, akan menjadi masalah karena Query cukup panjang, Performa akan semakin lambat
-- Untuk mengatasi masalah ini kita bisa menggunakan GROUPING SETS
-- GROUPING SET ini digunakan untuk melakukan pengelompokan yang mungkin bisa dari fild yang ditampilkan.

-- Perintah dasar GROUPING SETS
-- GROUP BY
--     GROUPING SETS (
--         (column1),
--         (column2),
--         (column1, column2)
--     );
-- Dengan kebutuhan diatas kita bisa gunakan GROUPING SETS

-- Ini adalah cara tebaik menggunakan GROUPING SETS
SELECT CUSTOMER, CATEGORY, SUM(SALES_AMOUNT) TOTAL_SALES 
FROM CUSTOMER_CATEGORY_SALES
GROUP BY
    GROUPING SETS (
        (CATEGORY, CUSTOMER),
        (CUSTOMER),
        (CATEGORY),
        ()
    )
ORDER BY CUSTOMER, CATEGORY;


-- Menambahkan fungsi untuk membedakan baris dengan agregasi super dari baris kelompoknya
SELECT 
    CUSTOMER,
    CATEGORY,
    GROUPING(CUSTOMER) IS_CUSTOMER_GROUP, -- 1 jika baris adalah agregasi dari kelompok customer
    GROUPING(CATEGORY) IS_CATEGORY_GROUP, -- 1 jika baris adalah agregasi dari kelompok category
    SUM(SALES_AMOUNT) TOTAL_SALES 
FROM CUSTOMER_CATEGORY_SALES
GROUP BY    
    GROUPING SETS (
        (CATEGORY, CUSTOMER),
        (CUSTOMER),
        (CATEGORY),
        ()
    )
ORDER BY CUSTOMER, CATEGORY;



-- output yang lebih mudah di mengerti
-- Menambahkan fungsi DECODE untuk mengubah nilai 1 menjadi 'All Customer' dan 'All Category'
-- Menambahkan fungsi DECODE untuk mengubah nilai 0 menjadi nama customer dan nama category

-- DECODE ADA 4 PARAMETER, ALIAS
-- DECODE(GROUPING(CUSTOMER), 1, 'All Customer', CUSTOMER) CUSTOMER,
-- mirip seperti IF ELSE atau ternary operator di bahasa pemrograman
-- Fungsi DECODE kemudian mengubah nilai 1 ini menjadi string 'All Customer'. 
-- Jika hasilnya bukan agregasi (GROUPING menghasilkan 0), maka akan menampilkan nama CUSTOMER yang sebenarnya.

SELECT 
    DECODE(GROUPING(CUSTOMER), 1, 'All Customer', CUSTOMER) CUSTOMER, -- jika baris adalah agregasi dari kelompok customer, maka tampilkan 'All Customer'
    DECODE(GROUPING(CATEGORY), 1, 'All Category', CATEGORY) CATEGORY, -- jika baris adalah agregasi dari kelompok category, maka tampilkan 'All Category'
    SUM(SALES_AMOUNT) TOTAL_SALES 
FROM CUSTOMER_CATEGORY_SALES
GROUP BY    
    GROUPING SETS (
        (CATEGORY, CUSTOMER),
        (CUSTOMER),
        (CATEGORY),
        ()
    )
ORDER BY CUSTOMER, CATEGORY;


-- bisa Menambahkan leveling untuk groupnya
-- Menambahkan informasi level dari group
SELECT 
    CUSTOMER,
    CATEGORY,
    GROUPING_ID(CUSTOMER, CATEGORY) GROUPING_LEVEL,
    SUM(SALES_AMOUNT) TOTAL_SALES 
FROM CUSTOMER_CATEGORY_SALES
GROUP BY    
    GROUPING SETS (
        (CATEGORY, CUSTOMER),
        (CUSTOMER),
        (CATEGORY),
        ()
    )
ORDER BY CUSTOMER, CATEGORY;

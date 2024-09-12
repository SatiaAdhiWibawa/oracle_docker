-- CUBE
-- CUBE adalah fungsi agregasi yang menghasilkan hasil agregasi
-- untuk semua kombinasi dari elemen yang ditentukan dalam daftar ekspresi.
-- CUBE menghasilkan hasil agregasi untuk semua kombinasi dari elemen yang ditentukan dalam daftar ekspresi.

-- SELECT column1, column2, column3, aggregate_function(column4)
-- FROM table_name
-- GROUP BY column1, CUBE(column2, column3);


-- Misalnya, query berikut menggunakan kubus persial 
-- yang menghasilkan subtotal hanya untuk dimensi kategori products

SELECT CATEGORY, CUSTOMER, SUM(SALES_AMOUNT) AS TOTAL_SALES
FROM CUSTOMER_CATEGORY_SALES
GROUP BY 
    CATEGORY,
    CUBE(CUSTOMER);
ORDER BY CATEGORY, CUSTOMER NULLS LAST;
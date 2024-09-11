-- CROSS JOIN
-- Setiap data pada table A dipasangkan tepat dengan semua data di table B

-- CROSS JOIN adalah salah satu JOIN yang sangat jangan sekali digunakan
-- CROSS JOIN adalah melakukan join dengan cara mengkalikan data di tabel pertama dengan dada di table kedua
-- Artinya jika ada 5 data di tabel pertama, dan 5 data di tabel kedua, akan menghasilkan 25 kombinasi data (5 x 5)
-- Sekali lagi perlu diingat, ini adalah JOIN yang sangat jarang sekali digunakan


-- CEK TOTAL DATA DI TABLE PRODUCTS
SELECT COUNT(*) FROM PRODUCTS;

-- CEK TOTAL DATA DI TABLE WAREHOUSES
SELECT COUNT(*) FROM WAREHOUSES;

-- UNTUK CEK TOTAL DATA YANG AKAN DILAKUKAN CROSS JOIN YA ITU TABLE 1 * TABLE 2
-- JADI KALAU TABLE PRODUCTS ADA 10 DATA DAN TABLE WAREHOUSES ADA 3 DATA
-- MAKA HASIL CROSS JOINNYA AKAN ADA 10 * 3 = 30 DATA

-- HITUNG TOTAL DATA CROSS JOIN
SELECT COUNT(*) FROM PRODUCTS CROSS JOIN WAREHOUSES;

-- CROSS JOIN
SELECT PRODUCT_ID, WAREHOUSE_ID, ROUND(DBMS_RANDOM.VALUE(10, 100)) AS QUANTITY
FROM PRODUCTS
CROSS JOIN WAREHOUSES;
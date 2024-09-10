-- ORDER BY adalah perintah di oracle untuk mengurutkan data berdasarkan kolom tertentu
-- bisa diurutkan secara ascending (ASC) atau descending (DESC)
-- secara default, oracle tidak mengurutkan data tanpa perintah ORDER BY, terlepas kapan data di input

-- SELECT * FROM employees ORDER BY first_name ASC;

-- SELECT
--     COLUMN1,
--     COLUMN2,
--     COLUMN3,
--     .....
-- FROM
--     TABLE_NAME
-- ORDER BY
--     COLUMN_NAME ASC|DESC, NULLS FIRST|NULLS LAST;

-- ASC = ascending mengurutkan data dari kecil ke besar
-- DESC = descending mengurutkan data dari besar ke kecil
-- NULLS FIRST = mengurutkan data null di awal
-- NULLS LAST = mengurutkan data null di akhir


SELECT name, address, credit_limit FROM customers;


SELECT name, address, credit_limit FROM customers ORDER BY name


SELECT first_name, last_name FROM contacts ORDER BY first_name DESC, last_name DESC;


-- bagaimana caranya mengurutkan baris berdasakan posisi column
SELECT name, credit_limit FROM customers ORDER BY 2 DESC, 1;

-- ORDER BY diatas sama saja dengan
SELECT name, credit_limit FROM customers ORDER BY credit_limit DESC, name;

-- bagaimana cara sortir baris dengan null di awal
SELECT country_id, city, state FROM locations ORDER BY state ASC NULLS FIRST;

-- bagaimana cara sortir baris dengan null di akhir
SELECT country_id, city, state FROM locations ORDER BY state ASC NULLS LAST;

-- bagaimana cara mengurutkan baris dari hasil fungsi/operasi (penjumlahan, perkalian, dll)
SELECT customer_id, name FROM customers ORDER BY upper(name);

-- UNION OPERATOR
-- Mengabungkan set hasil dari dua atau lebih SELECT pernyataan, menjadi satu set hasil.
-- UNION operator menghapus baris duplikat dari hasil.
-- Jika Anda ingin mempertahankan baris duplikat, gunakan UNION ALL operator.


-- Contoh untuk UNION

-- SELECT
--     COLUMN_LIST_1
-- FROM TABLE_1
-- UNION
-- SELECT
--     COLUMN_LIST_2
-- FROM TABLE_2;


-- CONTOH untuk UNION ALL

-- SELECT
--     COLUMN_LIST_1
-- FROM TABLE_1
-- UNION ALL
-- SELECT
--     COLUMN_LIST_2
-- FROM TABLE_2;


-- SYARAT UNION
-- 1. Jumlah kolom yang dipilih dalam setiap pernyataan SELECT harus sama.
-- 2. Kolom harus memiliki tipe data yang sama.
-- 3. Kolom dalam setiap pernyataan SELECT harus dalam urutan, dan harus memilik nama yang sama.

-- CONTOH UNION, menghasilkan data unique
SELECT FIRST_NAME, LAST_NAME, EMAIL, 'CONTACT'
FROM CONTACTS
UNION
SELECT FIRST_NAME, LAST_NAME, EMAIL, 'EMPLOYEE'
FROM EMPLOYEES;


-- UNION Dengan ORDER BY
SELECT 
    FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME,
    EMAIL,
    'CONTACT'
FROM CONTACTS
UNION
SELECT
    FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME,
    EMAIL,
    'EMPLOYEE'
FROM EMPLOYEES
ORDER BY FULL_NAME DESC;



-- PERBEDAAN UNION DAN UNION ALL
-- UNION operator menghapus baris duplikat dari hasil
-- UNION ALL operator mempertahankan baris duplikat.

-- UNION
SELECT LAST_NAME
FROM EMPLOYEES
UNION
SELECT LAST_NAME
FROM CONTACTS
ORDER BY LAST_NAME DESC;

-- UNION ALL
SELECT LAST_NAME
FROM EMPLOYEES
UNION ALL
SELECT LAST_NAME
FROM CONTACTS
ORDER BY LAST_NAME DESC;
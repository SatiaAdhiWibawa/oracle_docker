-- INTERSECT Operator
-- Membandingkan hasil dari dua query
-- dan Membandingkan baris berbeda yang dihasilkan oleh kedua query

-- INTERSECT adalah operasi menggabungkan dua query, namun yang diambil hanya data yang terdapat pada hasil query pertama dan query kedua
-- Data yang tidak hanya ada di salah satu query, akan dihapus di hasil operasi INTERSECT 
-- Data nya muncul tidak dalam keadaan duplikat


-- SELECT COLUMN_LIST_1
-- FROM TABLE_1
-- INTERSECT
-- SELECT COLUMN_LIST_2
-- FROM TABLE_2;


-- CEK DATA DI TABEL EMPLOYEES
SELECT LAST_NAME FROM EMPLOYEES;

-- CEK DATA DI TABEL CONTACTS
SELECT LAST_NAME FROM CONTACTS;


-- AKAN MENGHASILKAN BARIS YANG SAMA SAJA, DARI KEDUA QUERY
-- menghasilkan last_name yang sama dari kedua tabel
SELECT LAST_NAME
FROM EMPLOYEES
INTERSECT
SELECT LAST_NAME
FROM CONTACTS
ORDER BY LAST_NAME;
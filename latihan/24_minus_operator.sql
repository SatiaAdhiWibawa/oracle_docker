-- MINUS OPERATOR
-- Membandingkan dua query dan mengembalikan baris berbeda dari 
-- query pertama yang tidak dihasilkan oleh query kedua
-- Dengan kata lain MINUS Operator mengurangi satu set hasil dari yang lain.

-- MINUS adalah operasi dimana query pertama akan dihilangkan oleh query kedua
-- Artinya jika ada data di query pertama yang sama dengan data yang ada di query kedua,
-- maka data tersebut akan dihapus dari hasil query MINUS


-- SELECT column1, column2, ...
-- FROM table1
-- MINUS
-- SELECT column1, column2, ...
-- FROM table2;


-- Mirip dengan UNION, dan INTERSECT, query diatas harus sesuai dengan aturan berikut:
-- 1. Jumlah kolom dan urutan kolom harus sama di kedua query.
-- 2. Type data dari setiap kolom harus sama.

-- CEK DATA DI TABLE CONTACTS
SELECT LAST_NAME FROM CONTACTS;

-- CEK DATA DI TABLE EMPLOYEES
SELECT LAST_NAME FROM EMPLOYEES;


-- MENGGUNAKAN MINUS OPERATOR
SELECT LAST_NAME FROM CONTACTS
MINUS
SELECT LAST_NAME FROM EMPLOYEES
ORDER BY LAST_NAME;
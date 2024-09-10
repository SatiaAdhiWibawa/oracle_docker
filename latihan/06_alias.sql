-- TABLE DAN COLUMN ALIAS
-- ADALAH NAMA PENGGANTI UNTUK TABLE DAN COLUMN
-- ALIAS bisa menggunakan as atau tidak

-- COLUMN ALIAS
-- SELECT list_price AS harga FROM products;
-- SELECT list_price harga FROM products;

-- ketika column sudah menggunakan alias maka ketika kondisi selanjutnya bisa menggunakan alias tersebut atau nama column aslinya
SELECT first_name AS nama_depan, last_name AS nama_belakang FROM employees ORDER BY nama_depan;
SELECT first_name nama_depan, last_name nama_belakang FROM employees ORDER BY nama_depan;

-- Menggunakan alias column untuk membuat judul lebih bermakna
-- Secara defaul ORACLE akan mengkapiatalkan judul column
-- Jika menginginkannya maka bisa menggunakan tanda petik dua "nama_column"
SELECT first_name "Nama Depan", last_name "Nama Belakang" FROM employees ORDER BY "Nama Depan";

-- Menggunakan alias column untuk menggabungkan column dengan operator || (concatenation) dan Fungsi CONCAT
SELECT first_name || ' ' || last_name as full_name FROM employees ORDER BY full_name;
SELECT CONCAT(CONCAT(first_name, ' '), last_name) AS full_name 
FROM employees 
ORDER BY full_name;

-- Penjelasan
-- || (Concatenation Operator): Operator ini menggabungkan string dalam Oracle dan dapat digunakan dengan lebih dari dua argumen.
-- CONCAT: Fungsi CONCAT di Oracle hanya dapat menerima dua argumen, sehingga jika ingin menggabungkan lebih dari dua string, perlu dilakukan dengan cara bersarang.

-- Kesimpulan
-- Fungsi CONCAT di Oracle hanya menerima dua argumen saja, beda dengan MySQL atau yg lainnya. 
-- Gunakan operator || atau CONCAT bersarang untuk menggabungkan tiga elemen (first_name, ' ', dan last_name).

-- Menggunakan alias column untuk menghitung selisih antara dua column
SELECT product_name, list_price-standard_cost as gross_profit FROM products ORDER BY gross_profit DESC;

-- ALIAS TABLE
SELECT e.first_name, m.last_name FROM employees e
JOIN employees m on m.employee_id = e.employee_id;
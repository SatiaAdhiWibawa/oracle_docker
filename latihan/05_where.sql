-- KATA KUNCI WHERE
-- kalusa where menentukan kondisi pencarian untuk baris yang di kembalikan oleh pernyataan select
-- SELECT * FROM employees WHERE department_id = 90;

SELECT product_name, description, list_price, category_id from products where product_name = 'Kingston';

-- OPERATOR KOMPARASI
-- =                Equality
-- (!= atau <>)     Inequality
-- >                Greater than
-- <                Less than
-- >=               Greater than or equal
-- <=               Less than or equal
-- IN               Equal to any value in a list of values
-- NOT IN           Not equal to any value in a list of values
-- ANY/ SOME/ ALL   Compoare a value to a list or subquery, it must preceded by another operator such as >, <, =, etc
-- BETWEEN          Between an inclusive range of values
-- NOT BETWEEN      Not between an inclusive range of values
-- LIKE             Match a character pattern
-- NOT LIKE         Do not match a character pattern
-- EXISTS           Return true if a subquery contains any rows
-- NOT EXISTS       Return true if a subquery contains no rows
-- IS NULL          Check for a null value
-- IS NOT NULL      Check for a non-null value

-- = EQUALITY
SELECT * from products where product_id = 58;

-- (!= atau <>) INEQUALITY
SELECT * from products where product_id != 58;
SELECT * from products where product_id <> 58;

-- > GREATER THAN
SELECT * from products where list_price > 500;

-- < LESS THAN
SELECT * from products where list_price < 500;

-- >= GREATER THAN OR EQUAL
SELECT * from products where list_price >= 500;

-- <= LESS THAN OR EQUAL
SELECT * from products where list_price <= 500;

-- IN EQUAL TO ANY VALUE IN A LIST OF VALUES
SELECT * from products where category_id in (2, 3, 5);

-- NOT IN NOT EQUAL TO ANY VALUE IN A LIST OF VALUES
SELECT * from products where category_id not in (2, 3, 5);

-- ANY/ SOME/ ALL COMPARE A VALUE TO A LIST OR SUBQUERY, IT MUST PRECEDED BY ANOTHER OPERATOR SUCH AS >, <, =, ETC

-- Operator > ALL:
-- Konsep: ALL adalah operator yang digunakan untuk membandingkan nilai pada baris luar (outer query) dengan semua nilai dari sekumpulan hasil subquery.
-- Fungsi: Dalam konteks ini, list_price > ALL (...) berarti kita sedang mencari produk-produk yang list_price-nya lebih besar daripada semua nilai list_price yang ditemukan oleh subquery (kategori_id = 2).
SELECT * from products where list_price > all (select list_price from products where category_id = 2);


-- Operator > ANY:
-- Konsep: ANY adalah operator yang digunakan untuk membandingkan nilai pada baris luar (outer query) dengan salah satu nilai dari sekumpulan hasil subquery.
-- Fungsi: Dalam konteks ini, list_price > ANY (...) berarti kita sedang mencari produk-produk yang list_price-nya lebih besar daripada setidaknya salah satu dari nilai list_price yang ditemukan oleh subquery (kategori_id = 2).
SELECT * from products where list_price > any (select list_price from products where category_id = 2);


-- Operator > SOME:
-- Konsep: SOME adalah operator yang digunakan untuk membandingkan nilai pada baris luar (outer query) dengan salah satu nilai dari sekumpulan hasil subquery.
-- Fungsi: Dalam konteks ini, list_price > SOME (...) berarti kita sedang mencari produk-produk yang list_price-nya lebih besar daripada setidaknya salah satu dari nilai list_price yang ditemukan oleh subquery (kategori_id = 2).
SELECT * from products where list_price > some (select list_price from products where category_id = 2);

-- Tidak ada perbedaan fungsional antara SOME dan ANY. Keduanya dapat digunakan untuk tujuan yang sama,
-- yaitu membandingkan nilai dari query utama dengan setidaknya satu nilai dari subquery.
-- Pilihan untuk menggunakan SOME atau ANY adalah lebih kepada preferensi atau konsistensi dalam penulisan kode.



-- BETWEEN BETWEEN AN INCLUSIVE RANGE OF VALUES
SELECT * from products where list_price between 500 and 1000;

-- NOT BETWEEN NOT BETWEEN AN INCLUSIVE RANGE OF VALUES
SELECT * from products where list_price not between 500 and 1000;

-- LIKE MATCH A CHARACTER PATTERN
SELECT * from products where product_name like 'Kingston%';

-- NOT LIKE DO NOT MATCH A CHARACTER PATTERN
SELECT * from products where product_name not like 'Kingston%';

-- EXISTS RETURN TRUE IF A SUBQUERY CONTAINS ANY ROWS
SELECT * from products where exists (select * from products where category_id = 2);

-- NOT EXISTS RETURN TRUE IF A SUBQUERY CONTAINS NO ROWS
SELECT * from products where not exists (select * from products where category_id = 2);

-- IS NULL CHECK FOR A NULL VALUE
SELECT * from products where description is null;

-- IS NOT NULL CHECK FOR A NON-NULL VALUE
SELECT * from products where description is not null;

-- AND, OR, NOT
SELECT * from products where list_price > 500 and category_id = 2;
SELECT * from products where list_price > 500 or category_id = 2;
SELECT * from products where not list_price > 500;


-- LATIHAN
SELECT product_name, list_price FROM products
WHERE list_price BETWEEN 650 AND 688
ORDER BY list_price;


SELECT product_name, list_price, category_id FROM products
WHERE category_id in(1,4);


SELECT product_name, list_price, category_id FROM products
WHERE category_id = 1 or category_id = 4;


SELECT product_name, list_price FROM products
WHERE product_name like 'Asus%'
ORDER BY list_price;

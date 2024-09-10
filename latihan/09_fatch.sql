-- FETCH
-- Perintah ini mirip dengan LIMIT pada MySQL, PostgreSQL, dan SQLite.
-- Tujuannya membatasi pengambilan data dari tabel.
-- Oracle tidak memiliki LIMIT, sehingga kita menggunakan FETCH untuk tujuan yang sama.

-- Contoh penggunaan FETCH di MySQL
-- SELECT p.PRODUCT_NAME, i.QUANTITY FROM INVENTORIES i
-- JOIN PRODUCTS p ON p.PRODUCT_ID = i.PRODUCT_ID
-- ORDER BY i.QUANTITY DESC
-- LIMIT 5;

-- [ OFFSET offset ROWS ]
-- FETCH NEXT { row_count | row_count PERCENT } ROWS ONLY
-- ROWS [ ONLY | WITH TIES ]

-- Contoh penggunaan FETCH di Oracle SQL


-- Mengambil data 10 produk dengan kuantitas terbanyak,
-- jika ada produk dengan kuantitas yang sama, maka ambil 10 produk pertama
SELECT P.PRODUCT_NAME, I.QUANTITY FROM INVENTORIES i
JOIN PRODUCTS p ON p.PRODUCT_ID = i.PRODUCT_ID
ORDER BY i.QUANTITY DESC
FETCH NEXT 10 ROWS ONLY;


-- Mengambil data 10 produk dengan kuantitas terbanyak, 
-- jika ada produk dengan kuantitas yang sama, maka ambil semua produk tersebut
SELECT P.PRODUCT_NAME, I.QUANTITY FROM INVENTORIES i
JOIN PRODUCTS p ON p.PRODUCT_ID = i.PRODUCT_ID
ORDER BY i.QUANTITY DESC
FETCH FIRST 10 ROWS WITH TIES;


-- Membatasi dengan persentase
-- Mengambil 10% data produk dengan kuantitas terbanyak yang ada di tabel
SELECT P.PRODUCT_NAME, I.QUANTITY FROM INVENTORIES i
JOIN PRODUCTS p ON p.PRODUCT_ID = i.PRODUCT_ID
ORDER BY i.QUANTITY DESC
FETCH FIRST 10 PERCENT ROWS ONLY;


-- Mengambil semua data produk dengan kuantitas terbanyak paling atas
SELECT P.PRODUCT_NAME, I.QUANTITY FROM INVENTORIES i
JOIN PRODUCTS p ON p.PRODUCT_ID = i.PRODUCT_ID
ORDER BY i.QUANTITY DESC;

-- Dengan OFFSET dan FETCH
SELECT P.PRODUCT_NAME, I.QUANTITY FROM INVENTORIES i
JOIN PRODUCTS p ON p.PRODUCT_ID = i.PRODUCT_ID
ORDER BY i.QUANTITY DESC
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;
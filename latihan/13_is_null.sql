-- IS NULL dan IS NOT NULL
-- adalah operator yang digunakan untuk memeriksa apakah suatu kolom memiliki nilai NULL atau tidak.
-- null itu bukan 0 dan bukan whitespace, null itu tidak ada nilai
-- nilai null tidak bisa di bandingkan dengan nilai lainnya
-- Contoh penggunaan IS NULL dan IS NOT NULL


-- Tampilkan semua data dari tabel ORDERS dimana kolom SALESMAN_ID memiliki nilai NULL
SELECT * 
FROM ORDERS
WHERE SALESMAN_ID IS NULL
ORDER BY ORDER_DATE DESC;

-- Tampilkan semua data dari tabel ORDERS dimana kolom SALESMAN_ID tidak memiliki nilai NULL
SELECT * 
FROM ORDERS
WHERE SALESMAN_ID IS NOT NULL
ORDER BY ORDER_DATE DESC;
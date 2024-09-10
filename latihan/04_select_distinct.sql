-- SELECT DISTINCT
-- digunakan untuk memfilter data yang duplicate agar tidak ditampilkan
-- data yang ditampilkan adalah data yang unik saja

-- SELECT DISTINCT COLUMN1 FROM TABLE_NAME;

-- distinct bisa digunakan untuk satu kolom atau lebih

-- SELECT DISTINCT COLUMN1, COLUMN2 FROM TABLE_NAME;

SELECT DISTINCT first_name FROM contacts ORDER BY first_name;

SELECT DISTINCT product_id, quantity FROM order_items ORDER BY product_id;

SELECT DISTINCT state FROM locations ORDER BY state NULLS FIRST;
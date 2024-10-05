-- CURSOR for loop
-- adalah struktur pengulangan dalam bahasa pemograman PL/SQL yang digunakan untuk mengambil data 
-- baris per baris dari cursor tanpa perlu menentukan variabel yang ditampung.
-- Dalam Oracle for loop Cursor diinsialisaikan diawal dan dieksekusi secara otomatis setiap kali iterasi dilakukan
-- Setiap baris data dari cursor akan disimpan pada variabel terkait dengan kolom yang berbeda-beda.

-- Fitur bagus dari CURSOR FOR LOOP adalah memungkinkan anda untuk mengambil setiap baris dari cursor
-- tanpa mengelola siklus eksekusi secara manual yaitu open, fetch, dan close.

-- Perintah dasarnya
-- FOR record IN cursor_name 
-- LOOP
    -- proses record statment
-- END LOOP;


-- RECORD : adalah nama index for loop yang dinyatakan oleh pernyataan cursor secara Implisit sebagai %ROWTYPE.
-- cursor_name : adalah nama cursor explisit yang tidak dibuka saat loop dimulai.


-- CONTOH MENGGUNAKAN CURSOR FOR LOOP
DECLARE
    CURSOR c_product IS
        SELECT product_name, list_price 
        FROM products
        ORDER BY list_price DESC;
BEGIN
    FOR r_product IN c_product
    LOOP
        DBMS_OUTPUT.PUT_LINE('Product Name: ' || r_product.product_name || ' List Price: ' || r_product.list_price);
    END LOOP;
END;

-- Output
-- Product Name: Mountain-500 Silver, 44 List Price: 539.99

-- CONTOH TANPA MENGGUNAKAN CURSOR FOR LOOP
BEGIN
    FOR r_product IN (
        SELECT PRODUCT_NAME, LIST_PRICE
        FROM PRODUCTS
        ORDER BY LIST_PRICE DESC
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('Product Name: ' || r_product.product_name || ' List Price: ' || r_product.list_price);
    END LOOP;
END;
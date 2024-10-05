-- CURSOR PARAMETER
-- Cursor Parameter adalah parameter yang digunakan untuk mengirim nilai ke cursor saat cursor dijalankan.
-- Setiap anda kali membuka cursor, anda datapat meneruskan parameter yang berbeda ke cursor.
-- yang menghasilkan kumpulan hasil yang berbeda

-- CURSOR cursor_name (parameter1 data_type, parameter2 data_type, ...)
-- IS
-- CURSOR QUERY;


-- CONTOH CURSOR dengan PARAMETER DAN MENGGUNAKAN FOR LOOP
DECLARE
    CURSOR c_product (low_price NUMBER, hight_price NUMBER)
    IS
        SELECT *
        FROM PRODUCTS
        WHERE list_price BETWEEN low_price and hight_price;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Mass Product');
    FOR r_product IN c_product(50, 100)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Product Name: ' || r_product.product_name || ' List Price: ' || r_product.list_price);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Luxury Product');
    FOR r_product IN c_product(800, 1000)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Product Name: ' || r_product.product_name || ' List Price: ' || r_product.list_price);
    END LOOP;
END;


-- bisa juga di isi parameter dengan default value
DECLARE
    CURSOR c_product (low_price NUMBER DEFAULT 50, hight_price NUMBER DEFAULT 100)
    IS
        SELECT *
        FROM PRODUCTS
        WHERE list_price BETWEEN low_price and hight_price;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Mass Product');
    FOR r_product IN c_product
    LOOP
        DBMS_OUTPUT.PUT_LINE('Product Name: ' || r_product.product_name || ' List Price: ' || r_product.list_price);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Luxury Product');
    FOR r_product IN c_product(800, 1000)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Product Name: ' || r_product.product_name || ' List Price: ' || r_product.list_price);
    END LOOP;
END;
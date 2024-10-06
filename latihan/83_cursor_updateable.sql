-- CURSOR FOR UPDATE
-- Terkadang, kita ingin mengunci sekumpulan baris sebelum dapat diperbarui dalam program

CURSOR cursor_name IS
    SELECT select_clause
    FROM table_name
    WHERE condition
    FOR UPDATE [OF column_name] [NOWAIT];

-- Setelah anda membuak cursor, Oracel akan mengunci semua baris yang dipilih oleh SELECT .... FOR UPDATE 
-- pernyataan dalam table yang ditentukan dalam FORM clause. Dan baris ini akan tetap terkunci 
-- hingga cursore ditutup atau transaksi di selesaikan dengan pernyataan COMMIT atau ROLLBACK.


-- CONTOH
DECLARE
    CURSOR c_customers IS
        SELECT CUSTOMER_ID, NAME, CREDIT_LIMIT
        FROM customers
        WHERE CREDIT_LIMIT > 0
        FOR UPDATE OF CREDIT_LIMIT;

    l_order_count PLS_INTEGER := 0;  -- Deklarasi variabel harus di sini, di luar blok cursor
    l_increment PLS_INTEGER := 0;
BEGIN
    FOR r_customer IN c_customers LOOP
        SELECT COUNT(*)
        INTO l_order_count
        FROM orders
        WHERE CUSTOMER_ID = r_customer.CUSTOMER_ID;

        IF l_order_count >= 5 THEN
            l_increment := 5;
        ELSIF l_order_count < 5 AND l_order_count >= 2 THEN
            l_increment := 2;
        ELSIF l_order_count = 1 THEN
            l_increment := 1;
        ELSE
            l_increment := 0;
        END IF;

        IF l_increment > 0 THEN
            UPDATE customers
            SET CREDIT_LIMIT = CREDIT_LIMIT * (1 + l_increment / 100)
            WHERE CUSTOMER_ID = r_customer.CUSTOMER_ID;

            DBMS_OUTPUT.PUT_LINE('Customer ' || r_customer.NAME || ' credit limit increased by ' || l_increment || '%');
        END IF;
    END LOOP;

    -- Penanganan pengecualian
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('Error Message : ' || SQLERRM);
        RAISE;
END;

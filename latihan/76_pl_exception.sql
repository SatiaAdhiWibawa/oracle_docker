-- PL/SQL Exception adalah cara dimana PL/SQL menangani error yang terjadi pada saat eksekusi program.
-- atau kondisi yang tidak diinginkan saat menjalan program.
-- Ketika sebuah kesalahan terjadi, biasanya program akan berhenti dan memberikan pesan error.
-- Namun dengan menggunakan mekanismeu Exception tersebut,
-- kita bisa mengontrol bagaimana program akan berjalan ketika terjadi error.

-- PERINTAH DASAR
-- BEGIN
        -- kode program
        -- ...
-- EXCEPTION
        -- WHEN E1 THEN
            -- EXCEPTION HANDLING
        -- WHEN E2 THEN
            -- EXCEPTION HANDLING
-- END;

-- CONTOH
DECLARE
    l_name CUSTOMERS.name%TYPE;
    l_id CUSTOMERS.CUSTOMER_ID%TYPE := &CUSTOMER_ID;
BEGIN
    SELECT name
    INTO l_name
    FROM CUSTOMERS
    WHERE CUSTOMER_ID = l_id;
    DBMS_OUTPUT.PUT_LINE('Customer Name: ' || l_name);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for customer id ' || l_id);
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Too many rows found for customer id ' || l_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred - ' || SQLCODE || ' - ' || SQLERRM);
END;
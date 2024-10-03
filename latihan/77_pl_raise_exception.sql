-- Di Oracel, RAISE Exceptions digunakan untuk menghasilkan sebuah error
-- atau kesalahan dalam sebuah block program.
-- Exception adalah mekanisne yang memungkinkan program situasi ketika terjadi kesalahan/ error.

-- Ketiak Exception di lakukan Raise didalam block program,
-- Maka kontrol akan otomatis diarahkan ke bagian EXCEPTIONS block yang telah Di definisikan.

-- pada bagian ini user dapat menentukan aksi seperti melakukan log error, mengirim email notifikasi,
-- atau memberikan pesan error kepada user, agar user dapat mengetahui bahwa terjadi kesalahan.


-- Perintah DASAR
-- DECLARE
--     Exception_name EXCEPTION;
-- PRAGMA EXCEPTION_INIT(error_name, error_code);

-- CONTOH
DECLARE
    v_string VARCHAR2(200) := 'Hello World nih';
BEGIN
    if LENGTH(v_string) > 10 THEN
        RAISE_APPLICATION_ERROR(-20001, 'String is too long');
    END IF;
END;


-- CONTOH yang lebih complex
DECLARE
-- variable Error
    e_credit_too_hight EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_credit_too_hight, -20001);

-- variable
    l_max_credit CUSTOMERS.credit_limit%TYPE;
    l_customer_id CUSTOMERS.customer_id%TYPE := &CUSTOMER_ID;
    l_credit CUSTOMERS.credit_limit%TYPE := &CREDIT_LIMIT;
BEGIN
    SELECT MAX(credit_limit)
    INTO l_max_credit
    FROM CUSTOMERS;

    if l_credit > l_max_credit THEN
        --RAISE e_credit_too_hight;
        RAISE_APPLICATION_ERROR(-20001, 'Credit limit is too high');
    END IF;

    UPDATE CUSTOMERS
    SET credit_limit = l_credit
    WHERE customer_id = l_customer_id;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Credit limit updated successfully');
END;
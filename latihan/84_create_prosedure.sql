-- ORACLE PROSEDURE
-- Adalah blok kode PL/SQL yang menyimpan sekelompok intruksi SQL dan PL/SQL.
-- PROSEDURE ORACLE memungkinkan anda untuk mengeksekusi kode secara berulang2 tanpa perlu menulis kembali intruksi yang sama secara berulang2.
-- Juga dapat digunakan untuk mengumpulkan logika bisnis dan menjalankan beberapa tugas dalam saru operasi.

-- Berikut Adalah fitur-fitur dari PROSEDURE ORACLE:
-- 1. Menerima argumen input dan output
-- 2. Mengembalikan satu atau lebih nilai menggunakan parameter output
-- 3. Dapat dipanggil dari blok PL/SQL atau bahasa pemrograman lainnya
-- 4. Dapat memanggil fungsi oracle lain atau PROSEDURE
-- 5. Dapat memiliki penanganan kesalahan (exception handling)
-- 6. Dapat disimpan dalam database sebagai objek yang dapat digunakan kembali melalui antarmuka pengguna atau aplikasi lainnya

-- Berikut adalah contoh pembuatan sintaks PROSEDURE ORACLE:

-- CREATE [OR REPLACE] PROCEDURE procedure_name
-- (parameter_name IN/OUT datatype, parameter_name IN/OUT datatype, ...)
-- IS
-- Deklarasi variabel
-- BEGIN
--     -- Logika bisnis
-- END [procedure_name];


-- Jadi kita ingin membuat operasi atau tugas yang membutuhkan pengulangan atau sekumpulan intruksi SQL dan PL/SQL
-- Sebaiknya menggunakan PROSEDURE ORACLE.

CREATE OR REPLACE PROCEDURE PRINT_CONTACTS(
    in_customer_id NUMBER
)
IS
    r_contact CONTACTS%ROWTYPE;
BEGIN
    SELECT *
    INTO r_contact
    FROM CONTACTS
    WHERE CUSTOMER_ID = in_customer_id
    AND ROWNUM = 1;

    DBMS_OUTPUT.PUT_LINE('First Name: ' || r_contact.FIRST_NAME || ' Last Name: ' || r_contact.LAST_NAME || ' Email: ' || r_contact.EMAIL);

    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLCODE);
            DBMS_OUTPUT.PUT_LINE('Error Message: ' || SQLERRM);
            RAISE;
END PRINT_CONTACTS;

-- UNTUK MENGHAPUS PROSEDURE
DROP PROCEDURE PRINT_CONTACTS;


EXECUTE PRINT_CONTACTS(1);

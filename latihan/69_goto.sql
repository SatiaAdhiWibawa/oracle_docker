-- Pernyataan GOTO
-- GOTO digunakan untuk mentransfer eksekusi ke bagian tertentu dari blok atau pernyataan berlebel.

-- GOTO lable_name;
-- label name adalah nama label yang mengidentifikasi pernyataan target
-- <<label_name>>

BEGIN
    GOTO second_message;
    << first_message >>
    DBMS_OUTPUT.PUT_LINE('First Message');
    GOTO end_message;

    << second_message >>
    DBMS_OUTPUT.PUT_LINE('Second Message');
    GOTO first_message;

    << end_message >>
    DBMS_OUTPUT.PUT_LINE('End Message');
END;

-- Pembatasan penggunaan GOTO
-- TIDAK bisa menggunakan GOTO untuk mentransfer kontrol kedalam IF, LOOP, atau CASE

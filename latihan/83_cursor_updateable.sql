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
        SELECT customer_id, first_name, last_name
        FROM customers
        WHERE customer_id = 1
        FOR UPDATE;
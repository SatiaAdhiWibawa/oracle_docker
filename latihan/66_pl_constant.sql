-- CONSTANT
-- CONSTANT adalah sebuah variabel yang nilainya tidak dapat diubah.
-- Tidak seperti variabel biasanya, CONSTANT menyimpan nilai tidak berubah selama eksekusi program.

-- constant_name CONSTANT data_type := value;

DECLARE
    l_tax CONSTANT NUMBER := 0.1;
    l_product_name CONSTANT VARCHAR2(100) := 'Laptop';
BEGIN
    l_tax := 0.2; -- ini akan error, karena mencoba mengubah nilai constant
    DBMS_OUTPUT.PUT_LINE(l_tax);
    DBMS_OUTPUT.PUT_LINE(l_product_name);
END;
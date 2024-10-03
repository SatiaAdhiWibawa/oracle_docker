-- Variabel PL/SQL
-- variabel = lokasi penyimpanan yang dinamai yang digunakan untuk menyimpan data dengan jenis data tertentu.
-- Deklarasi Variabel
-- variabel dideklarasikan dalam bagian DECLARE dari blok PL/SQL.
-- variabel_name data_type [NOT NULL] [:= initial value];

-- ketentuan membuat variabel
-- 1. Nama variabel harus dibuat sejelas mungkin.
-- 2. Pilih type data yang sesuai untuk variabel.

-- nilai default adalah nilai awal yang diberikan kepada variabel saat variabel dideklarasikan.

-- ketentuan secara umum untuk nama variabel dalam PL/SQL
-- awali dengan l_ untuk variabel lokal
-- awali dengan g_ untuk variabel global

-- mencoba membuat variabel local
DECLARE
    l_product_name VARCHAR2(100) := 'Laptop';
BEGIN
    DBMS_OUTPUT.PUT_LINE(l_product_name);
END;

-- membuat not null variabel
DECLARE
    l_product_name VARCHAR2(30) NOT NULL := 'Laptop';
BEGIN
    l_product_name := '';
END;

-- merubah default value
DECLARE
    l_product_name VARCHAR2(30) := 'Laptop';
BEGIN
    l_product_name := 'Mouse';
    DBMS_OUTPUT.PUT_LINE(l_product_name);
END;

-- mengambil tipe data dari kolom dan table yang sudah ada
-- VARIABLE ANCOHR
DECLARE
    l_customer_name customers.name%TYPE;
    l_credit_limit customers.credit_limit%TYPE;
BEGIN
    SELECT name, credit_limit 
    INTO l_customer_name, l_credit_limit
    FROM customers
    WHERE customer_id = 1;
    DBMS_OUTPUT.PUT_LINE('Customer Name: ' || l_customer_name);
    DBMS_OUTPUT.PUT_LINE('Credit Limit: ' || l_credit_limit);
END;

--  contoh lainnya mengambil avg, min, max, count
DECLARE
    l_credit_limit customers.credit_limit%TYPE;
    l_avg_credit_limit l_credit_limit%TYPE;
    l_min_credit_limit l_credit_limit%TYPE;
    l_max_credit_limit l_credit_limit%TYPE;
    l_count_credit_limit l_credit_limit%TYPE;
BEGIN
    SELECT AVG(credit_limit), MIN(credit_limit), MAX(credit_limit), COUNT(credit_limit)
    INTO l_avg_credit_limit, l_min_credit_limit, l_max_credit_limit, l_count_credit_limit
    FROM customers;

    SELECT CREDIT_LIMIT
    INTO l_credit_limit
    FROM customers
    WHERE CUSTOMER_ID = 1;
    DBMS_OUTPUT.PUT_LINE('Credit Limit: ' || l_credit_limit);
    DBMS_OUTPUT.PUT_LINE('Average Credit Limit: ' || l_avg_credit_limit);
    DBMS_OUTPUT.PUT_LINE('Minimum Credit Limit: ' || l_min_credit_limit);
    DBMS_OUTPUT.PUT_LINE('Maximum Credit Limit: ' || l_max_credit_limit);
    DBMS_OUTPUT.PUT_LINE('Count Credit Limit: ' || l_count_credit_limit);
END;

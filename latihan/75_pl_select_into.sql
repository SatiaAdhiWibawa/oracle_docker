-- PL/SQL SELCET INTO
-- adalah cara termudah untuk mengambil suatu baris tabel kedalam variabel

-- SELCET
    -- SELECT_LIST
-- INTO
    -- variable_list
-- FROM
    -- table_name
-- WHERE
    -- condition;

-- CONTOH MEMILIH 1 COLUMN
DECLARE
    l_customer_name customers.name%TYPE;
BEGIN
    SELECT name
    INTO l_customer_name
    FROM customers
    WHERE CUSTOMER_ID = 1;
    DBMS_OUTPUT.PUT_LINE('Customer Name: ' || l_customer_name);
END;

-- mengambil 1 row lengkap
DECLARE
    l_customer customers%ROWTYPE;
BEGIN
    SELECT *
    INTO l_customer
    FROM customers
    WHERE CUSTOMER_ID = 1;
    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || l_customer.CUSTOMER_ID || ', Name: ' || l_customer.NAME);
END;


-- memilih data jadi beberapa variabel
DECLARE
    l_customer_name customers.name%TYPE;
    l_contact_name contacts.first_name%TYPE;
    l_contact_last_name contacts.last_name%TYPE;
BEGIN
    SELECT c.name, ct.first_name, ct.last_name
    INTO l_customer_name, l_contact_name, l_contact_last_name
    FROM customers c
    JOIN contacts ct ON c.customer_id = ct.customer_id
    WHERE c.customer_id = 1;
   
    DBMS_OUTPUT.PUT_LINE('Customer Name: ' || l_customer_name);
    DBMS_OUTPUT.PUT_LINE('Contact Name: ' || l_contact_name || ' - ' || l_contact_last_name);
END;
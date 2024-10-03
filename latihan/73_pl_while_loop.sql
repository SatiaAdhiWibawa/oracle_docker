-- WHILE LOOP
-- di oracle database adalah pernyataan yang digunakan untuk
-- mengeksekusi serangkaian perintah PL/SQL secara berulang selama kondisi yang ditentukan benar.
-- Selama kondisi while loop terpenuhi, block kode akan terus dieksekusi berulang kali
-- hingga kondisinya tidak lagi benar

-- WHILE condition LOOP
--     statement;
-- END LOOP;

-- CONTOH
DECLARE
    l_counter NUMBER := 1;
BEGIN
    WHILE l_counter <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE('Counter: ' || l_counter);
        l_counter := l_counter + 1;
    END LOOP;
END;

-- WHILE LOOP dengan EXIT WHEN
DECLARE
    l_counter NUMBER := 1;
BEGIN
    WHILE l_counter <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE('Counter: ' || l_counter);
        l_counter := l_counter + 1;
        EXIT WHEN l_counter = 3;
    END LOOP;
END;
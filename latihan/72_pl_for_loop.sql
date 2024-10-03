-- FOR LOOP
-- Digunakan untuk mengeksekusi urutan pernyataan beberapa kali

-- FOR index IN [REVERSE] lower_bound..upper_bound LOOP
--     statement;
-- END LOOP;


-- lower_bound adalah nilai awal dari index
-- upper_bound adalah nilai akhir dari index
-- index adalah variabel yang digunakan untuk menghitung iterasi (variabel implisit)
-- statement adalah pernyataan yang akan dieksekusi

-- CONTOH FOR LOOP
BEGIN
    FOR l_counter IN 1 .. 5 LOOP
        DBMS_OUTPUT.PUT_LINE('Counter: ' || l_counter);
    END LOOP;
END;

-- membuat perulangan dengan tambahan step
DECLARE
    l_step PLS_INTEGER := 2;
BEGIN
    FOR l_counter IN 1 .. 5 LOOP
        DBMS_OUTPUT.PUT_LINE(l_counter* l_step);
    END LOOP;
END;


-- REVERSE LOOP
-- REVERSE LOOP digunakan untuk menghitung mundur
BEGIN
    FOR l_counter IN REVERSE 1 .. 5 LOOP
        DBMS_OUTPUT.PUT_LINE('Counter: ' || l_counter);
    END LOOP;
END;
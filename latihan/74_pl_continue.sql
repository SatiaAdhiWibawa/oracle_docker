-- pernyataan CONTINUE memungkinkan anda untuk keluar dari iterasi loop saat ini
-- dan segera melanjutkan ke iterasi berikutnya.

-- CONTINUE

-- IF condition THEN
--     CONTINUE;
-- END IF;


-- CONTOH Menampilkan bilangan genap
BEGIN
    FOR n_index IN 1 .. 10 LOOP
        IF MOD(n_index, 2) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(n_index);
        ELSE
            CONTINUE;
        END IF;
    END LOOP;
END;

-- CONTINUE dengan WHEN condition melompati iterasi loop saat ini
BEGIN
    FOR n_index IN 1 .. 10 LOOP
        CONTINUE WHEN MOD(n_index, 2) != 0;
        DBMS_OUTPUT.PUT_LINE(n_index);
    END LOOP;
END;
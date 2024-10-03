-- LOOP
-- LOOP merupakan salah satu bentuk struktur kontrol yang digunakan untuk mengulang suatu
-- block kode secara berulang-ulang selama kondisi yang diberikan benar.

<<LABEL>> LOOP
    STATEMENT;
END LOOP LOOP_LABEL;


-- EXIT LOOP
LOOP
    EXIT;
END LOOP;
-- ATAU
LOOP
    IF condition THEN
        EXIT;
    END IF;
END LOOP;



-- CONTOH EXIT MENGGUNAKAN IF
DECLARE
    l_counter number := 0;
BEGIN
    LOOP
        l_counter := l_counter + 1;
        IF l_counter > 5 THEN
            EXIT;
        END IF;
        DBMS_OUTPUT.PUT_LINE('Counter: ' || l_counter);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('End Loop');
END;


-- CONTOH EXIT MENGGUNAKAN EXIT WHEN
DECLARE
    l_counter number := 0;
BEGIN
    LOOP
        l_counter := l_counter + 1;
        EXIT WHEN l_counter > 5;
        DBMS_OUTPUT.PUT_LINE('Counter: ' || l_counter);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('End Loop');
END;

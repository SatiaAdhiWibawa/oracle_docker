-- PERCABANGAN IF THEN

-- contoh
IF THAN
IF THAN ELSE
IF THAN ELSIF THAN

-- IF THEN Perintah dasar
IF CONDITION THEN
    -- statement
END IF;

-- contoh IF THEN
DECLARE
    l_sales number := 10000;
BEGIN
    IF l_sales > 1000 THEN
        DBMS_OUTPUT.PUT_LINE('Bonus 10%');
    END IF;
END;

-- contoh IF THEN ELSE
DECLARE
    l_sales number := 1000;
BEGIN
    IF l_sales > 1000 THEN
        DBMS_OUTPUT.PUT_LINE('Bonus 10%');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No Bonus');
    END IF;
END;

-- contoh IF THEN ELSIF BERSARANG
DECLARE
    l_sales number := 1000;
BEGIN
    IF l_sales > 1000 THEN
        DBMS_OUTPUT.PUT_LINE('Bonus 10%');
    ELSIF l_sales > 500 THEN
        DBMS_OUTPUT.PUT_LINE('Bonus 5%');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No Bonus');
    END IF;
END;

-- contoh IF THEN ELSEIF BERSARANG MENGGUNAKAN AND
DECLARE
    l_sales number := 1000;
    l_qty number := 10;
BEGIN
    IF l_sales > 1000 AND l_qty > 5 THEN
        DBMS_OUTPUT.PUT_LINE('Bonus 10%');
    ELSIF l_sales > 500 AND l_qty > 5 THEN
        DBMS_OUTPUT.PUT_LINE('Bonus 5%');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No Bonus');
    END IF;
END;
-- INSERT ALL
-- digunakan untuk melalukan insert beberapa baris kedalam tabel atau beberapa tabel

-- INSERT ALL
-- INTO table_name (column1, column2, column3) VALUES (value1, value2, value3)
-- INTO table_name (column1, column2, column3) VALUES (value1, value2, value3)
-- INTO table_name (column1, column2, column3) VALUES (value1, value2, value3)
-- SUBQUERY


SELECT * FROM DUAL;

CREATE TABLE FRUIT(
   FRUIT_NAME VARCHAR2(100) PRIMARY KEY,
   COLOR VARCHAR2(100) NOT NULL
);

INSERT ALL
    INTO FRUIT(FRUIT_NAME, COLOR)
    VALUES('APPLE', 'RED')

    INTO FRUIT(FRUIT_NAME, COLOR)
    VALUES('BANANA', 'YELLOW')

    INTO FRUIT(FRUIT_NAME, COLOR)
    VALUES('ORANGE', 'ORANGE')
SELECT * FROM DUAL;

SELECT * FROM FRUIT;


-- sisipkan beberapa bari ke dalam beberapa tabel
-- INSERT ALL
--     INTO TABLE_NAME1 (column1, column2, column3) VALUES (value1, value2, value3)
--     INTO TABLE_NAME2 (column1, column2, column3) VALUES (value1, value2, value3)
--     INTO TABLE_NAME3 (column1, column2, column3) VALUES (value1, value2, value3)
-- SUBQUERY;


-- INSERT ALL BERSYARAT
-- INSERT [ALL | FIRST]
--     WHEN CONDITION THAN
--         INTO TABLE_NAME1 (column1, column2, column3) VALUES (value1, value2, value3)
--     WHEN CONDITION THAN
--         INTO TABLE_NAME2 (column1, column2, column3) VALUES (value1, value2, value3)
--     ELSE
--         INTO TABLE_NAME3 (column1, column2, column3) VALUES (value1, value2, value3)
-- SUBQUERY

CREATE TABLE SMALL_ORDERS (
    ORDER_ID NUMBER(12) NOT NULL,
    CUSTOMER_ID NUMBER(12) NOT NULL,
    AMOUNT NUMBER(8, 2) NOT NULL
);

-- membuat tabel baru dengan data dari tabel lain
CREATE TABLE MENDIUM_ORDERS AS
SELECT *
FROM SMALL_ORDERS;

-- membuat tabel baru dengan data dari tabel lain
CREATE TABLE BIG_ORDERS AS
SELECT *
FROM SMALL_ORDERS;


-- MENGGUNAKAN INSERT ALL
-- insert all bersyarat
INSERT ALL
    WHEN AMOUNT < 10000 THEN
        INTO SMALL_ORDERS
    WHEN AMOUNT BETWEEN 10000 AND 30000 THEN
        INTO MENDIUM_ORDERS
    ELSE
        INTO BIG_ORDERS
SELECT ORDER_ID, CUSTOMER_ID, (QUANTITY * UNIT_PRICE) AS AMOUNT
FROM ORDERS
JOIN ORDER_ITEMS USING(ORDER_ID);


SELECT * FROM SMALL_ORDERS;
SELECT * FROM MENDIUM_ORDERS;
SELECT * FROM BIG_ORDERS;

DELETE FROM SMALL_ORDERS;
DELETE FROM MENDIUM_ORDERS;
DELETE FROM BIG_ORDERS;

-- MENGGUNAKAN INSERT FIRST
INSERT FIRST
    WHEN AMOUNT > 30000 THEN
        INTO BIG_ORDERS
    WHEN AMOUNT BETWEEN 10000 AND 30000 THEN
        INTO MENDIUM_ORDERS
    ELSE
        INTO SMALL_ORDERS
SELECT ORDER_ID, CUSTOMER_ID, (QUANTITY * UNIT_PRICE) AS AMOUNT
FROM ORDERS
JOIN ORDER_ITEMS USING(ORDER_ID);

-- CREATE TABLE
-- CREATE TABLE schema_name.table_name (
--     column_name1 data_type1 column constraint,
--     column_name2 data_type2 column constraint,
--     ...
--     table_constraints
-- );


CREATE TABLE DBUSER.PERSONS (
    PERSON_ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    FIRST_NAME VARCHAR2(50) NOT NULL,
    LAST_NAME VARCHAR2(50) NOT NULL,
    PRIMARY KEY (PERSON_ID)
);

SELECT * FROM PERSONS;

CREATE TABLE DISCOUNT2(
    DISCOUNT_ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    DISCOUNT_NAME VARCHAR2(50) NOT NULL,
    AMOUNT NUMBER(3,1) NOT NULL,
    START_DATE DATE NOT NULL,
    EXPIRY_DATE DATE NOT NULL
);

-- INSERT DATA DENGAN LIST COLUM
-- INSERT INTO TABLE_NAME (column1, column2, column3, ...)
-- VALUES (value1, value2, value3, ...);
-- INSERT INTO DENGAN ALL COLUM
-- INSERT INTO TABLE_NAME
-- VALUES (value1, value2, value3, ...);


INSERT INTO discount2(discount_name, amount, start_date, expiry_date)
VALUES ('New Year Sale', 9.5, DATE '2024-01-01', DATE'2026-01-31');

SELECT * FROM discount2;

INSERT INTO discount2(discount_name, amount, start_date, expiry_date)
VALUES ('Christmas Sale', 10.0, DATE '2024-12-01', DATE'2024-12-31');


CREATE TABLE CONTOH(
    ID NUMBER,
    NAME VARCHAR2(255)
);

-- INSERT INTO MENGGUNAKAN SEMUA COLUM YANG ADA, JIKA TIDAK ADA COLUM YANG DIISI MAKA AKAN ERROR
-- dan syaratnya adalah harus diisi semua colum yang ada
-- syarat table harus memiliki colum yang sama dengan data yang akan diinsert
INSERT INTO contoh
VALUES (1, 'John Doe');

SELECT * FROM contoh;
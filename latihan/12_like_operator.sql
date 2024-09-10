-- OPERATOR LIKE
-- OPERATOR LIKE digunakan untuk menguji pola tertentu dalam suatu kolom
-- Pola yang digunakan adalah wildcard: % (untuk nol atau lebih karakter) dan _ (untuk tepat satu karakter)
-- Contoh kita ingin mendapatkan data employess yang mengandung nama depan dengan awalan Robert
-- Untuk mendapatkannya kita bisa menggunakan like
-- Perintah dasarnya Expression LIKE pattern [ESCAPE 'escape_character']


-- Contoh cari LAST_NAME contact yang diawali dengan huruf St
SELECT FIRST_NAME, LAST_NAME, PHONE
FROM CONTACTS WHERE LAST_NAME LIKE 'St%';

-- Like St% akan cascsensitive (besar kecil huruf berpengaruh)
-- jika ingin caseinsensitive bisa menggunakan UPPER atau LOWER
SELECT FIRST_NAME, LAST_NAME, PHONE
FROM CONTACTS WHERE UPPER(LAST_NAME) LIKE 'ST%';


-- '' Hasilnya sama seperti sama dengan
-- '%xxx' yang mengandung akhiran xxx
-- 'xxx%' yang mengandung awalan xxx
-- '%xxx%' yang mengandung xxx diantara karakter
-- '_xxx' yang memiliki 4 karakter dan diawali dengan xxx
-- 'xxx_' yang memiliki 4 karakter dan diakhiri dengan xxx
-- '_xxx_' yang memiliki 5 karakter dan mengandung xxx diantara karakter
-- 'xx_%' yang memiliki 3 karakter dan diawali dengan xx

SELECT FIRST_NAME, LAST_NAME, PHONE
FROM CONTACTS
WHERE LAST_NAME LIKE '%er%';

SELECT FIRST_NAME, LAST_NAME, PHONE
FROM CONTACTS
WHERE PHONE NOT LIKE '+1%';

SELECT FIRST_NAME, LAST_NAME, PHONE
FROM CONTACTS
WHERE FIRST_NAME LIKE 'Je_i%' ORDER BY FIRST_NAME;


-- CONTOH untuk mengambil % sebagai karakter yang dicari
-- ingin mencari description yang isinya 25%, dan sejenisnya

CREATE TABLE DISCOUNTS
(
    PRODUCT_ID NUMBER,
    DISCOUNT_MESSAGE VARCHAR2(255) NOT NULL,
    PRIMARY KEY (PRODUCT_ID)
);

INSERT INTO DISCOUNTS (PRODUCT_ID, DISCOUNT_MESSAGE)
VALUES (1, 'Buy 1 and Get 25% off on all products');

INSERT INTO DISCOUNTS (PRODUCT_ID, DISCOUNT_MESSAGE)
VALUES (2, 'Buy 2 and Get 50% off on all products');

INSERT INTO DISCOUNTS (PRODUCT_ID, DISCOUNT_MESSAGE)
VALUES (3, 'Buy 3 and Get 1 free products');

SELECT * FROM DISCOUNTS;

SELECT * 
FROM DISCOUNTS
WHERE DISCOUNT_MESSAGE LIKE '%25!%%' ESCAPE '!'; 


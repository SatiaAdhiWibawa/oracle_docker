-- INNER JOIN
-- SELECT * FROM table1 INNER JOIN table2 ON table1.id = table2.id

-- INNER JOIN adalah mekanisme JOIN, dimana terdapat relasi antara tabel pertama dan tabel kedua
-- Jika ada data di tabel pertama yang tidak memiliki relasi di table kedua ataupun sebaliknya, maka hasil INNER JOIN tidak akan ditampilkan
-- Ini adalah default JOIN di MySQL
-- Jika kita menggunakan JOIN, sebenarnya itu akan melakukan INNER JOIN


-- INNER JOIN dengan 1 TABLE menggunakan ON
SELECT *
FROM ORDERS O
INNER JOIN ORDER_ITEMS OI on OI.ORDER_ID = O.ORDER_ID
ORDER BY O.ORDER_DATE DESC;


-- INNER JOIN menggunakan USING (hanya bisa digunakan jika nama kolom yang di join sama)
SELECT *
FROM ORDERS O
INNER JOIN ORDER_ITEMS USING(ORDER_ID)
ORDER BY O.ORDER_DATE DESC;



-- INNER JOIN DENGAN 2 atau LEBIH TABLE
SELECT
    C.NAME customer_name,
    O.ORDER_ID,
    O.ORDER_DATE,
    OI.ITEM_ID,
    OI.QUANTITY,
    OI.UNIT_PRICE
FROM ORDERS O
INNER JOIN ORDER_ITEMS OI on OI.ORDER_ID = O.ORDER_ID
INNER JOIN CUSTOMERS C on C.CUSTOMER_ID = O.CUSTOMER_ID
INNER JOIN PRODUCTS P on P.PRODUCT_ID = OI.PRODUCT_ID
ORDER BY O.ORDER_DATE DESC, O.ORDER_ID DESC, OI.ITEM_ID;
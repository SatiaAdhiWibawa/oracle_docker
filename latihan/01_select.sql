-- SELECT adalah perintah dasar untuk mendapatkan data dalam SQL

--SELECT
--    COLUMN1
--    COLUMN2
--    .....
--FROM
--    TABLE_NAME


SELECT * FROM CONTACTS;

SELECT FIRST_NAME, LAST_NAME, EMAIL FROM CONTACTS;


-- CTRL + F7 untuk formating query
SELECT
    customer_id,
    name,
    credit_limit
FROM
    customers;
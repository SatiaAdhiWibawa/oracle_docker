-- OPERATOR OR
-- OR adalah Operasi logika membandingakan 2 bolean atau lebih syaratnya jika salah satu syarat benar maka hasilnya benar
-- Contoh

SELECT ORDER_ID, CUSTOMER_ID, STATUS, ORDER_DATE
FROM ORDERS
WHERE STATUS = 'Pending' OR STATUS = 'Canceled'
ORDER BY ORDER_DATE DESC;

-- Menggunakan OR lebih dari 1
SELECT SALESMAN_ID, ORDER_ID, CUSTOMER_ID, STATUS, ORDER_DATE
FROM ORDERS
WHERE SALESMAN_ID = 60 OR SALESMAN_ID = 61 OR SALESMAN_ID = 62
ORDER BY SALESMAN_ID;

-- Sebenarnya bisa lebih simple menggunakan IN
-- SALESMAN_ID IN (60, 61, 62)


SELECT ORDER_ID, CUSTOMER_ID, STATUS, ORDER_DATE
FROM ORDERS
WHERE
(
    STATUS = 'Pending' OR
    STATUS = 'Canceled'
)
AND CUSTOMER_ID = 44
ORDER BY ORDER_DATE DESC;

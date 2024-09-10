-- ORACLE AND OPERATOR
-- Akan bernilai true jika kedua kondisi bernilai true

-- ambil data, berdasrkan status Pending dan customer_id 2
SELECT ORDER_ID, CUSTOMER_ID, STATUS, ORDER_DATE
FROM ORDERS
WHERE STATUS = 'Pending' AND CUSTOMER_ID = 2
ORDER BY ORDER_DATE;

-- ambil data, berdasrkan status Shipped, salesman_id 60 dan order_date = 2017
SELECT ORDER_ID, CUSTOMER_ID, STATUS, ORDER_DATE
FROM ORDERS
WHERE STATUS = 'Shipped' AND SALESMAN_ID = 60
AND EXTRACT(YEAR FROM ORDER_DATE) = 2017
ORDER BY ORDER_DATE;

-- Fungsi YEAR() di Oracle karena tidak didukung.
-- Gunakan EXTRACT(YEAR FROM ORDER_DATE) untuk mengambil tahun dari kolom tanggal dalam Oracle.
-- Beda dengan MySQL yang menggunakan Fungsi YEAR() untuk mengambil tahun dari kolom tanggal.


SELECT ORDER_ID, CUSTOMER_ID, STATUS, ORDER_DATE
FROM ORDERS
WHERE
    (
        STATUS = 'Canceled' OR STATUS = 'Pending'
    )
    AND CUSTOMER_ID = 44;
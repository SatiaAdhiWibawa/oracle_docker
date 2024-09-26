-- DELETE DATA

-- DELETE FROM TABEL_NAME
-- WHERE CONDITION;
--


-- buat tabel baru dengan data dari tabel lain
CREATE TABLE sales AS
SELECT
    order_id,
    item_id,
    product_id,
    quantity,
    unit_price,
    status,
    order_date,
    salesman_id
FROM
    orders
INNER JOIN order_items
        USING(order_id);


SELECT * FROM sales;

-- hapus data dengan kondisi tertentu
DELETE FROM SALES
WHERE ORDER_ID = 2 AND ITEM_ID =2;


DELETE FROM SALES
WHERE ORDER_ID = 2;


-- hapus semua data
DELETE FROM sales;


-- hapus semua data dengan kondisi tertentu
DELETE FROM ORDERS WHERE order_id = 2;
DELETE FROM ORDER_ITEMS WHERE order_id = 2;
COMMIT WORK; -- commit work untuk menyimpan perubahan

-- DELETE DATA

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
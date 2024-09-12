-- CORRELATED SUBQUERY
-- yaitu merupakan subquery yang beberapa kalusanya
-- mengacu pada ekspresi kolom dalam query luar

-- ini contoh subquery tanpa corelasi / yang tidak berkolerasi
-- SUBQUERY-NYA BERDIRI SENDIRI, TIDAK ADA KONDISI YANG BERPENGARUH KEPADA KONDISI QUERY YANG DI LUARNYA

SELECT
    PROJECT_ID,
    PROJECT_NAME,
    LIST_PRICE
FROM PRODUCTS
WHERE LIST_PRICE = (
    SELECT MAX(LIST_PRICE)
    FROM PROJECTS
);

-- Bagaimana jika kita ingin membuat subquery yang berkolerasi?
-- berkolerasi kepada kalusa WHERE / didalam WHERE

SELECT
    PRODUCT_ID,
    PRODUCT_NAME,
    LIST_PRICE
FROM PRODUCTS P
WHERE P.LIST_PRICE > (
    SELECT AVG(LIST_PRICE)
    FROM PRODUCTS
    WHERE CATEGORY_ID = P.CATEGORY_ID
    -- CATEGORY_ID adalah kolom yang ada didalam subquery
    -- P.CATEGORY_ID adalah kolom yang berkolerasi, yang berada di query luar
);


-- kita juga bisa membuat korelasi yang berada didalam SELCET
-- bawahwa subquery bisa ditempatkan didalam SELECT
SELECT
    PRODUCT_ID,
    PRODUCT_NAME,
    STANDARD_COST,
    ROUND(
        (
            SELECT AVG(STANDARD_COST)
            FROM PRODUCTS
            WHERE CATEGORY_ID = P.CATEGORY_ID
        ), 2
    ) AS AVG_CATEGORY_COST
FROM PRODUCTS P
ORDER BY P.PRODUCT_NAME;


-- Bagaimana mengkorelasikan subquery dengan EXISTS?
-- NOT EXISTS adalah kebalikan dari EXISTS, 
-- yaitu jika tidak ada data yang memenuhi kondisi
SELECT
    CUSTOMER_ID,
    NAME
FROM CUSTOMERS
WHERE
    NOT EXISTS (
        SELECT 1 -- SELECT 1, karena kita tidak membutuhkan data apapun
        FROM ORDERS
        WHERE ORDERS.CUSTOMER_ID=CUSTOMERS.CUSTOMER_ID
    )
ORDER BY NAME;
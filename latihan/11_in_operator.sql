-- OPERATOR IN dan NOT IN
-- OPERATOR ORCALE menentukan apakah nilai tertentu dalam daftar atau hasil subquery
-- subquery adalah perintah select yang menghasilkan satu kolom dan satu baris
-- Expression:
-- IN (Expression2, Expression3, ... Expression_n) atau (subquery)
-- NOT IN (Expression2, Expression3, ... Expression_n) atau (subquery)
-- Contoh

-- WHERE IN number
SELECT ORDER_ID, CUSTOMER_ID, STATUS, SALESMAN_ID
FROM ORDERS
WHERE SALESMAN_ID IN (54,55,56)
ORDER BY ORDER_ID;

-- WHERE IN string
SELECT ORDER_ID, CUSTOMER_ID, STATUS, SALESMAN_ID
FROM ORDERS
WHERE STATUS IN ('Pending','Canceled')
ORDER BY ORDER_ID;

-- WHERE NOT IN
SELECT ORDER_ID, CUSTOMER_ID, STATUS, SALESMAN_ID
FROM ORDERS
WHERE STATUS NOT IN ('Pending','Canceled')
ORDER BY ORDER_ID;

-- WHERE IN subquery
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN 
(
    SELECT DISTINCT SALESMAN_ID FROM ORDERS
    WHERE STATUS = 'Canceled'
)
ORDER BY FIRST_NAME;

-- WHERE NOT IN subquery
SELECT CUSTOMER_ID, NAME
FROM CUSTOMERS
WHERE CUSTOMER_ID NOT IN 
(
    SELECT DISTINCT CUSTOMER_ID FROM ORDERS
)
ORDER BY CUSTOMER_ID;
-- Variable Cursor PL/SQL dengan REF CURSOR

-- Pengertian variabel cursor
-- variabel yang menunjuk ke curosr. berbeda dari cursor Implisit dan explisit, 
-- variable cursor tidak terkait dengan query tertentu. Artinya variabel cursor dapat dibuka untuk query apapun.

-- DECLARE
--   c_customer SYS_REFCURSOR;


-- -- CONTOH PENGGUNAAN VARIABEL CURSOR
CREATE OR REPLACE FUNCTION get_direct_report(
    in_manager_id IN employees.manager_id%TYPE
)
return SYS_REFCURSOR
AS
    c_direct_report SYS_REFCURSOR;
BEGIN
    OPEN c_direct_report FOR
        SELECT employee_id, first_name, last_name, email
        FROM employees
        WHERE manager_id = in_manager_id
        ORDER BY first_name, last_name;
    RETURN c_direct_report;
END;


-- -- CONTOH PENGGUNAAN VARIABEL CURSOR
DECLARE
    c_direct_report SYS_REFCURSOR;
    v_employee_id employees.employee_id%TYPE;
    v_first_name employees.first_name%TYPE;
    v_last_name employees.last_name%TYPE;
    v_email employees.email%TYPE;
BEGIN
    c_direct_report := get_direct_report(46);
    LOOP
        FETCH c_direct_report INTO v_employee_id, v_first_name, v_last_name, v_email;
        EXIT WHEN c_direct_report%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_employee_id || ' - ' || v_first_name || ' - ' || v_last_name || ' - ' || v_email);
    END LOOP;
    CLOSE c_direct_report;
END;
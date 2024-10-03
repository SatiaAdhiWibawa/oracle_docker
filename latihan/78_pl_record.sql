-- PL/SQL RECORD
-- Oracel RECORD adalah tipe data abstrak yang mempresentasikan kumpulan data terstruktur yang dapat diberi nama.
-- RECORD ini terdiri dari beberapa field atau kolom yang memiliki tipe data tertentu

-- Sementara itu, TEMP TABLE (Temporary Table) adalah tabel yang sifatnya sementara dibuat didatabase
-- dan hanya ada selama sesi koneksi pengguna yang membuatnya koneksi tersebut berlangsung.
-- Tujuan utama dari TEMP TABLE adalah untuk menyimpan data sementara yang akan diperoses atau
-- dimapipulasi pada saat runtime.

-- Meskipun ada beberapa kesamaan antara keduanya,
-- keduanya bisa digunakan untuk menyimpan data sementara
-- namun Oracel Record dan temp Table dapat digunakan dalam konteks yang berbeda dan memiliki perbedaan cara penggunaannya

-- penggunaannya
TYPE record_type IS RECORD (
    field_name1 data_type1 [[NOT NULL] := | DEFAULT default_value],
    field_name2 data_type2 [[NOT NULL] := | DEFAULT default_value],
)


-- CONTOH RECORD SEDERHANA
DECLARE
    TYPE employeeRec IS RECORD (
        employee_id NUMBER,
        first_name VARCHAR2(50),
        last_name VARCHAR2(50),
        hire_date DATE,
        salary NUMBER
    );
    emp employeeRec;
BEGIN
    emp.employee_id := 100;
    emp.first_name := 'Steven';
    emp.last_name := 'King';
    emp.hire_date := TO_DATE('2003-06-17', 'YYYY-MM-DD');
    emp.salary := 24000;
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp.employee_id);
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || emp.first_name || ' ' || emp.last_name);
    DBMS_OUTPUT.PUT_LINE('Hire Date: ' || TO_CHAR(emp.hire_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Salary: ' || emp.salary);
END;

-- bisa juga melakukan insert, update
-- apa itu PL/SQL
-- PL/SQL adalah singkatan dari Procedural Language/Structured Query Language. 
-- PL/SQL adalah bahasa pemrograman prosedural yang dibuat oleh Oracle Corporation. 
-- PL/SQL dikembangkan oleh Oracle Corporation pada tahun 1990-an, untuk meningkatkan kemampuan SQL.
-- PL/SQL yaitu ekstensi dari SQL yang digunakan untuk mengembangkan aplikasi server yang kuat. 
-- PL/SQL berjalan di dalam database Oracle dan memungkinkan Anda untuk menggabungkan kueri SQL dengan blok pemrograman.

-- 1. Bagian Deklarasi
    -- ini merupakan bagian yang digunakan untuk mendeklarasikan variabel, konstanta, cursor, dan lain-lain.
-- 2. Bagian Eksekusi
    -- ini merupakan bagian yang digunakan untuk mengeksekusi kode program.
    -- bagian yang dapat di eksekusi dimulai dengan kata kunci BEGIN dan diakhiri dengan kata kunci END.
    -- bagian yang di eksekusi harus memiliki setidaknya satu pernyataan yang dapat di eksekusi, meskipun itu hanya NULL
-- 3. Bagian Penanganan Eksepsi
-- ini merupakan bagian yang digunakan untuk menangani eksepsi yang terjadi pada saat eksekusi kode program.


-- contoh satu block program
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World');
END;

-- Deklarasi variabel
DECLARE
    l_message VARCHAR2(100) := 'Hello World';
BEGIN
    DBMS_OUTPUT.PUT_LINE(l_message);
END;


-- Tambahkan exception handling
-- KONDISI BENAR
DECLARE
    l_message VARCHAR2(100) := 'Hello World';
BEGIN
    DBMS_OUTPUT.PUT_LINE(l_message);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END;

-- KONDISI SALAH
DECLARE
    v_result number;
BEGIN
    v_result := 1/0; -- ini adalah pembagian dengan nol
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END;
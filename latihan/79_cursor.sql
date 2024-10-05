-- PL/SQL CURSOR di Oracle adalah sebuah object atau pointer yang digunakan untuk
-- memanipulasi sebuah set dari baris-baris data yang sudah dihasilkan dari suatu SELECT statment.
-- Fungsi dari CURSOR ini adalah untuk membantu pengembangan aplikasi yang membutuhkan akases 
-- dan manipulasi tehadap data dalam database.

-- CURSOR dapat dianggap sebagai table virtual, karena tidak memiliki struktur fisik
-- namun bisa melakukan operasi seperti table pada umumnya.
-- Dalam PL/SQL terdapat 2 jenis CURSOR yaitu :

-- 1. Implisit Cursor: Cursor ini secara otomatis dibuat oleh PL/SQL ketika sebuah SQL statment dijalankan.
-- Implisit Cursor akan membuka, memproses, dan menutup sendiri.

-- 2. Explisit Cursor: Cursor ini didefinisikan oleh pengguna dengan menggunakan perintah DECLARE, OPEN, FETCH, dan CLOSE.
-- Cursor ini memberikan control yang lebih besar terhadap proses pemanggilan data karena pengguna dapat mengontrol
-- kapan Cursor harus dibuka, ditutup atau di-fetch.

-- Penggunaan PL/SQL Cursor sangat penting saat kita ingin memproses data secara tersetruktur dan sistematis dalam program yang kita buat
-- Kita dapat mengambil satu per satu tuple dari table dengan menggunakan cursor dan memproses sesuai kebutuhan aplikasi.

-- Berikut adalah sintaks dasar untuk membuat cursor di Oracle:

/*

DECLARE
    -- Deklarasi Variable yang akan digunakan oleh cursor sesuai dengan tipe kolom pada table
    varibale_name table_name.column_name%TYPE

    -- Deklarasi Cursor
    CURSOR cursor_name IS
        SELECT column1, column2, ... FROM table_name WHERE condition;

    BEGIN
        -- Buka cursor
        OPEN cursoe_name

        -- Looping untuk mengambil data dari cursore 
        LOOP
            -- Ambil data dari Cursor dan simpan kedalam Variable
            FETCH cursor_name INTO varible_name;

            -- Keluar dari Looping jika tidak ada lagi data
            EXIT WHEN cursor_name%NOTFOUND;

            -- Statment-statment PL/SQL yang mengakses variabel yang berisi nilai dari cursor
        END LOOP;

        -- Tutup Cursor
        CLOSE cursore_name;
    END;
*/


/*

Penjelasan dari masing-masing komponen sintaks diatas adalah sebagai berikut:

-- `DECLARE` : Kata kunci untuk memulai block program di PL/SQL.
-- `varibale_name table_name.column_name%TYPE` : Deklarasi variable yang akan digunakan dalam cursore sesuai dengan type column pada tablenya.
-- `CURSOR cursor_name IS` SELECT column1, column2, ... FROM table_name WHERE condition; : Mendefinisikan cursor yang akan dijalankan
-- `OPEN cursor_name` : Membuka cursor sehingga kita dapat mengambil baris data dari cursore tersebut.
-- `LOOP` : Statment Looping yang digunakan untuk membaca data yang ditemukan didalam curosr.
-- `FETCH cursor_name INTO varible_name;` : Mengambil satu baris data dari cursor menyimpan kedalam variable yang sudah dideklarasikan.
-- `EXIT WHEN cursor_name%NOTFOUND;` : Statment yang digunakan untuk keluar dari loop jika tidak ada baris data lagi (NOT FOUND).
-- `CLOSE cursore_name;` : Menutup cursor setelah selesai membaca semua baris dari data tertentu.

-- Selain perintah diatas masih banyak perintah lain yang dapat digunakan untuk memanipulasi cursor seperti BIND VARIABLE, WHERE CURREN OF, dsb.

*/


-- membuat tabel terlebih dahulu untuk latihan kali ini

CREATE TABLE pegawai (
  id_pegawai INT PRIMARY KEY,
  nama VARCHAR(50),
  gaji INT
);

INSERT INTO pegawai (id_pegawai, nama, gaji)
VALUES(1, 'John Doe', 15000000);
INSERT INTO pegawai (id_pegawai, nama, gaji)
VALUES(2, 'Jane Smith', 12000000);
INSERT INTO pegawai (id_pegawai, nama, gaji)
VALUES(3, 'David Johnson', 11000000);
INSERT INTO pegawai (id_pegawai, nama, gaji)
VALUES(4, 'Sarah Lee', 9000000);
INSERT INTO pegawai (id_pegawai, nama, gaji)
VALUES(5, 'Michael Brown', 8000000);


-- CONTOH PENGGUNAAN CURSOR
DECLARE
    CURSOR c_pegawai IS
        SELECT * FROM pegawai WHERE gaji >= 10000000;
    v_id_pegawai pegawai.id_pegawai%TYPE;
    v_nama pegawai.nama%TYPE;
    v_gaji pegawai.gaji%TYPE;
BEGIN
    OPEN c_pegawai;
    LOOP
        FETCH c_pegawai INTO v_id_pegawai, v_nama, v_gaji;
        EXIT WHEN c_pegawai%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID Pegawai: ' || v_id_pegawai || ', Nama: ' || v_nama || ', Gaji: ' || v_gaji);
    END LOOP;
    CLOSE c_pegawai;
END;
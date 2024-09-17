-- namasatwa ambil data sebelum /,
-- species
-- status = Dilindungi, 
-- created_at 2023-04-01 s/d 2023-06-30
-- group by famili
SELECT 
    COUNT(id) jumlah
FROM mastersatwa;

SELECT
     CONCAT(
        UPPER(LEFT(m.namasatwa, POSITION('/' IN m.namasatwa) - 1)),
        ", ",
        m.spesies
     ) nama_satwa,
     UPPER(m.famili) famili,
     s.jk
FROM mastersatwa m
INNER JOIN satwa s ON s.id_mastersatwa = m.id

WHERE m.id = '5bd54c45-c6a8-4724-b161-3a659b8ce54c';



-- mengambil data dari tabel satwa dan mastersatwa
-- sebagai master data
SELECT
     COUNT(s.id) jumlah,
     CONCAT(
        UPPER(LEFT(m.namasatwa, POSITION('/' IN m.namasatwa) - 1)),
        ", ",
        m.spesies
     ) nama_satwa,
     UPPER(m.famili) famili,
     CASE s.jk
          WHEN 'Jantan' THEN 'M'
          WHEN 'Betina' THEN 'F'
          ELSE 'U'
     END jk
FROM satwa s
INNER JOIN mastersatwa m ON s.id_mastersatwa = m.id
GROUP BY nama_satwa, m.famili, s.jk
ORDER BY jumlah DESC;


SELECT id_satwa, count(id_satwa) as jumlah_keluar, null , null
FROM satwa_out
group by id_satwa
UNION ALL
SELECT id_satwa, null, COUNT(id_satwa) as jumlah_masuk, null
FROM satwa_in
group by id_satwa
UNION ALL
SELECT id_satwa, null, null COUNT(id_satwa) as jumlah_mati
FROM satwa_die
group by id_satwa;

SELECT COUNT(so.id_satwa) FROM satwa_out so WHERE so.id_satwa =



SELECT
     COUNT(s.id) jumlah,
     CONCAT(
        UPPER(LEFT(m.namasatwa, POSITION('/' IN m.namasatwa) - 1)),
        ", ",
        m.spesies
     ) nama_satwa,
     UPPER(m.famili) famili,
     CASE s.jk
          WHEN 'Jantan' THEN 'M'
          WHEN 'Betina' THEN 'F'
          ELSE 'U'
     END jk,
     (SELECT COUNT(so.id_satwa) FROM satwa_out so WHERE so.id_satwa = s.id) as jumlah_keluar,
     (SELECT COUNT(si.id_satwa) FROM satwa_in si WHERE si.id_satwa = s.id) as jumlah_masuk,
     (SELECT COUNT(sd.id_satwa) FROM satwa_die sd WHERE sd.id_satwa = s.id) as jumlah_mati
FROM satwa s
JOIN mastersatwa m ON s.id_mastersatwa = m.id
GROUP BY nama_satwa, m.famili, s.jk, s.id, m.spesies
ORDER BY s.jk DESC;



-- FIX

SELECT 
    CONCAT(
        UPPER(LEFT(ms.namasatwa, POSITION('/' IN ms.namasatwa) - 1)),
        ", ",
        ms.spesies
    ) nama_satwa,
    UPPER(ms.famili) keluarga,
    CASE s.jk
          WHEN 'Jantan' THEN 'M'
          WHEN 'Betina' THEN 'F'
          ELSE 'U'
     END jk,
    ms.status,
    (SELECT COUNT(s.id_mastersatwa) FROM satwa s WHERE s.id_mastersatwa = ms.id) as jumlah,
    (SELECT COUNT(so.id_satwa) FROM satwa_out so WHERE so.id_satwa = s.id) as jumlah_keluar,
    (SELECT COUNT(si.id_satwa) FROM satwa_in si WHERE si.id_satwa = s.id) as jumlah_masuk,
    (SELECT COUNT(sd.id_satwa) FROM satwa_die sd WHERE sd.id_satwa = s.id) as jumlah_mati,
    -- (SELECT tgl_keluar FROM satwa_out so WHERE so.id_satwa = s.id) as tgl_keluar,
    (SELECT tgl_masuk FROM satwa_in si WHERE si.id_satwa = s.id) as tgl_masuk,
    (SELECT tgl_mati FROM satwa_die sd WHERE sd.id_satwa = s.id) as tgl_mati
FROM mastersatwa ms
JOIN satwa s ON s.id_mastersatwa = ms.id
GROUP BY 
    nama_satwa, keluarga, ms.status, jk,
    jumlah, jumlah_mati, jumlah_masuk, jumlah_keluar, tgl_masuk, tgl_mati
ORDER BY keluarga, nama_satwa, ms.status;




-- CREATE OR REPLACE VIEW populasi_satwa AS
SELECT
    -- ms.id,
    CONCAT(
        UPPER(LEFT(ms.namasatwa, POSITION('/' IN ms.namasatwa) - 1)),
        ", ",
        ms.spesies
    ) nama_satwa,
    UPPER(ms.famili) keluarga,
    CASE s.jk
          WHEN 'Jantan' THEN 'M'
          WHEN 'Betina' THEN 'F'
          ELSE 'U'
     END jk,
    ms.status,
    (SELECT COUNT(s.id_mastersatwa) FROM satwa s WHERE s.id_mastersatwa = ms.id) as jumlah,
    (SELECT COUNT(so.id_satwa) FROM satwa_out so WHERE so.id_satwa = s.id) as jumlah_keluar,
    (SELECT COUNT(si.id_satwa) FROM satwa_in si WHERE si.id_satwa = s.id) as jumlah_masuk,
    (SELECT COUNT(sd.id_satwa) FROM satwa_die sd WHERE sd.id_satwa = s.id) as jumlah_mati
FROM mastersatwa ms
JOIN satwa s ON s.id_mastersatwa = ms.id
GROUP BY 
    nama_satwa, keluarga, jk, ms.status, jumlah, jumlah_mati, jumlah_masuk, jumlah_keluar
ORDER BY keluarga, nama_satwa, ms.status;


SELECT
    ms.status
FROM
    MASTERSATWA MS
    JOIN SATWA S
    ON S.ID_MASTERSATWA = MS.ID;

SELECT * FROM populasi_satwa
WHERE nama_satwa LIKE 'Banteng%';
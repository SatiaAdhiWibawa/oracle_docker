
SELECT LENGTH(namasatwa) FROM mastersatwa;


-- TOTAL AWAL DI TABLE SATWA
SELECT 
    ms.id,
    CONCAT(
        UPPER(LEFT(ms.namasatwa, 
            CASE 
                WHEN POSITION('/' IN ms.namasatwa) > 0 
                THEN POSITION('/' IN ms.namasatwa) - 1 
                ELSE LENGTH(ms.namasatwa)
            END
        )),
        ", ",
        ms.spesies
    ) nama_satwa,
    ms.kelas,
    ms.status,
    COALESCE(SUM(CASE WHEN s.jk = 'Jantan' THEN 1 ELSE 0 END), 0) AS 'JANTAN',
    COALESCE(SUM(CASE WHEN s.jk = 'Betina' THEN 1 ELSE 0 END), 0) AS 'BETINA',
    COALESCE(SUM(CASE WHEN s.jk = 'Unknown' THEN 1 ELSE 0 END), 0) AS 'UNKNOWN'
FROM
    mastersatwa ms
JOIN
    satwa s ON ms.id = s.id_mastersatwa
JOIN
    satwa_in si ON s.id = si.id_satwa
GROUP BY 
    ms.id, ms.namasatwa, ms.spesies, ms.kelas, ms.status;






WITH
V_TOTAL_AWAL AS (
    SELECT 
        ms.id,
        CONCAT(REPLACE(ms.namasatwa, '/', ' '), ',', ms.spesies) AS 'Nama Satwa',
        ms.kelas,
        ms.status,
        COALESCE(SUM(CASE WHEN s.jk = 'Jantan' THEN 1 ELSE 0 END), 0) AS 'JANTAN',
        COALESCE(SUM(CASE WHEN s.jk = 'Betina' THEN 1 ELSE 0 END), 0) AS 'BETINA',
        COALESCE(SUM(CASE WHEN s.jk = 'Unknown' THEN 1 ELSE 0 END), 0) AS 'UNKNOWN'
    FROM 
        mastersatwa ms
    JOIN 
        satwa s ON ms.id = s.id_mastersatwa
    JOIN
        satwa_in si ON s.id = si.id_satwa AND si.tgl_masuk = '2005-05-13'
    GROUP BY 
        ms.id, ms.namasatwa, ms.spesies, ms.kelas, ms.status
),
V_SATWA_IN AS (
    SELECT 
        ms.id,
        CONCAT(REPLACE(ms.namasatwa, '/', ' '), ',', ms.spesies) AS 'Nama Satwa',
        ms.kelas,
        ms.status,
        COALESCE(SUM(CASE WHEN s.jk = 'Jantan' THEN 1 ELSE 0 END), 0) AS 'JANTAN',
        COALESCE(SUM(CASE WHEN s.jk = 'Betina' THEN 1 ELSE 0 END), 0) AS 'BETINA',
        COALESCE(SUM(CASE WHEN s.jk = 'Unknown' THEN 1 ELSE 0 END), 0) AS 'UNKNOWN'
    FROM 
        mastersatwa ms
    JOIN 
        satwa s ON ms.id = s.id_mastersatwa
    JOIN
        satwa_in si ON s.id = si.id_satwa AND si.tgl_masuk BETWEEN '2005-05-13' AND '2024-05-14'
        AND si.tgl_masuk NOT IN('2005-05-13', '2024-05-14')
    GROUP BY 
        ms.id, ms.namasatwa, ms.spesies, ms.kelas, ms.status
),
V_SATWA_OUT AS (
    SELECT 
        ms.id,
        CONCAT(REPLACE(ms.namasatwa, '/', ' '), ',', ms.spesies) AS 'Nama Satwa',
        ms.kelas,
        ms.status,
        COALESCE(SUM(CASE WHEN s.jk = 'Jantan' THEN 1 ELSE 0 END), 0) AS 'JANTAN',
        COALESCE(SUM(CASE WHEN s.jk = 'Betina' THEN 1 ELSE 0 END), 0) AS 'BETINA',
        COALESCE(SUM(CASE WHEN s.jk = 'Unknown' THEN 1 ELSE 0 END), 0) AS 'UNKNOWN'
    FROM 
        mastersatwa ms
    JOIN 
        satwa s ON ms.id = s.id_mastersatwa
    JOIN
        satwa_out so ON s.id = so.id_satwa AND so.tgl_keluar BETWEEN '2005-05-13' AND '2024-05-14'
        AND so.tgl_keluar NOT IN('2005-05-13', '2024-05-14')
    GROUP BY 
        ms.id, ms.namasatwa, ms.spesies, ms.kelas, ms.status
), 
V_SATWA_DIE AS (
    SELECT 
        ms.id,
        CONCAT(REPLACE(ms.namasatwa, '/', ' '), ',', ms.spesies) AS 'Nama Satwa',
        ms.kelas,
        ms.status,
        COALESCE(SUM(CASE WHEN s.jk = 'Jantan' THEN 1 ELSE 0 END), 0) AS 'JANTAN',
        COALESCE(SUM(CASE WHEN s.jk = 'Betina' THEN 1 ELSE 0 END), 0) AS 'BETINA',
        COALESCE(SUM(CASE WHEN s.jk = 'Unknown' THEN 1 ELSE 0 END), 0) AS 'UNKNOWN'
    FROM 
        mastersatwa ms
    JOIN 
        satwa s ON ms.id = s.id_mastersatwa
    JOIN
        satwa_die sd ON s.id = sd.id_satwa AND sd.tgl_mati BETWEEN '2005-05-13' AND '2024-05-14'
        AND sd.tgl_mati NOT IN('2005-05-13', '2024-05-14')
    GROUP BY 
        ms.id, ms.namasatwa, ms.spesies, ms.kelas, ms.status
),
V_TOTAL_AKHIR AS (
    SELECT 
        ms.id,
        CONCAT(REPLACE(ms.namasatwa, '/', ' '), ',', ms.spesies) AS 'Nama Satwa',
        ms.kelas,
        ms.status,
        COALESCE(SUM(CASE WHEN s.jk = 'Jantan' THEN 1 ELSE 0 END), 0) AS 'JANTAN',
        COALESCE(SUM(CASE WHEN s.jk = 'Betina' THEN 1 ELSE 0 END), 0) AS 'BETINA',
        COALESCE(SUM(CASE WHEN s.jk = 'Unknown' THEN 1 ELSE 0 END), 0) AS 'UNKNOWN'
    FROM 
        mastersatwa ms
    JOIN 
        satwa s ON ms.id = s.id_mastersatwa
    JOIN
        satwa_in si ON s.id = si.id_satwa AND si.tgl_masuk = '2024-05-14'
    GROUP BY
        ms.id, ms.namasatwa, ms.spesies, ms.kelas, ms.status
)
-- SELECT * FROM V_TOTAL_AWAL
SELECT
    ms.id,
    CONCAT(
        UPPER(LEFT(ms.namasatwa, 
            CASE 
                WHEN POSITION('/' IN ms.namasatwa) > 0 
                THEN POSITION('/' IN ms.namasatwa) - 1 
                ELSE LENGTH(ms.namasatwa)
            END
        )),
        ", ",
        ms.spesies
    ) AS nama_satwa,
    ms.status,
    ms.famili,
    COALESCE(ta.JANTAN, 0) AS "AWAL_JANTAN",
    COALESCE(ta.BETINA, 0) AS "AWAL_BETINA",
    COALESCE(ta.UNKNOWN, 0) AS "AWAL_UNKNOWN",
    COALESCE(si.JANTAN, 0) AS "DATANG_JANTAN",
    COALESCE(si.BETINA, 0) AS "DATANG_BETINA",
    COALESCE(si.UNKNOWN, 0) AS "DATANG_UNKNOWN",
    COALESCE(so.JANTAN, 0) AS "KELUAR_JANTAN",
    COALESCE(so.BETINA, 0) AS "KELUAR_BETINA",
    COALESCE(so.UNKNOWN, 0) AS "KELUAR_UNKNOWN",
    COALESCE(sd.JANTAN, 0) AS "MATI_JANTAN",
    COALESCE(sd.BETINA, 0) AS "MATI_BETINA",
    COALESCE(sd.UNKNOWN, 0) AS "MATI_UNKNOWN",
    COALESCE(ta2.JANTAN, 0) AS "AKHIR_JANTAN",
    COALESCE(ta2.BETINA, 0) AS "AKHIR_BETINA",
    COALESCE(ta2.UNKNOWN, 0) AS "AKHIR_UNKNOWN"
FROM mastersatwa ms
LEFT JOIN V_TOTAL_AWAL ta ON ms.id = ta.id
LEFT JOIN V_SATWA_IN si ON ms.id = si.id
LEFT JOIN V_SATWA_OUT so ON ms.id = so.id
LEFT JOIN V_SATWA_DIE sd ON ms.id = sd.id
LEFT JOIN V_TOTAL_AKHIR ta2 ON ms.id = ta2.id
ORDER BY famili, ms.namasatwa;
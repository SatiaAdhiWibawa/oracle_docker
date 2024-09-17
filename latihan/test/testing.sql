SELECT * FROM satwa;


SELECT * FROM mastersatwa LIMIT 10;
SELECT namasatwa, spesies FROM mastersatwa LIMIT 10;

SELECT id_satwa, url_kelamin FROM satwa_die WHERE id_satwa = "5bd54c45-c6a8-4724-b161-3a659b8ce54c";

SELECT 
    id,
   CONCAT(
        UPPER(LEFT(namasatwa, POSITION('/' IN namasatwa) - 1)),
        ", ",
        spesies
   ) nama_satwa
 FROM mastersatwa WHERE LOWER(namasatwa) LIKE 'banteng%';



-- SELECT 
--     id,
--     UPPER(LEFT(namasatwa, POSITION('/' IN namasatwa) - 1)) || ', ' || spesies AS nama_satwa
-- FROM mastersatwa 
-- WHERE LOWER(namasatwa) LIKE 'banteng%';




SELECT * FROM mastersatwa WHERE LOWER(namasatwa) LIKE 'monyet%';

SELECT namasatwa, famili
FROM mastersatwa;

-- namasatwa ambil data sebelum /,
-- species
-- status = Dilindungi, 
-- created_at 2023-04-01 s/d 2023-06-30
-- group by famili

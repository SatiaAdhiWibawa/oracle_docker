-- MERGE DATA
-- UNTUK MELAKUKAN PERUBAHAN ATAU MEMASUKAN DATA BERDASARKAN KONDISI tertentu

-- MERGE INTO target_table 
-- USING source_table
-- ON (condition)
-- WHEN MATCHED THEN
--     UPDATE SET column1 = value1, column2 = value2, ...
--     [DELETE WHERE delete_condition]
-- WHEN NOT MATCHED THEN
--     INSERT (column1, column2, ...)
--     VALUES (value1, value2, ...);
--     WHERE insert_condition;



CREATE TABLE members (
    member_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    rank VARCHAR2(20)
);

CREATE TABLE member_staging AS 
SELECT * FROM members;

INSERT INTO members(member_id, first_name, last_name, rank) VALUES(1,'Abel','Wolf','Gold');
INSERT INTO members(member_id, first_name, last_name, rank) VALUES(2,'Clarita','Franco','Platinum');
INSERT INTO members(member_id, first_name, last_name, rank) VALUES(3,'Darryl','Giles','Silver');
INSERT INTO members(member_id, first_name, last_name, rank) VALUES(4,'Dorthea','Suarez','Silver');
INSERT INTO members(member_id, first_name, last_name, rank) VALUES(5,'Katrina','Wheeler','Silver');
INSERT INTO members(member_id, first_name, last_name, rank) VALUES(6,'Lilian','Garza','Silver');
INSERT INTO members(member_id, first_name, last_name, rank) VALUES(7,'Ossie','Summers','Gold');
INSERT INTO members(member_id, first_name, last_name, rank) VALUES(8,'Paige','Mcfarland','Platinum');
INSERT INTO members(member_id, first_name, last_name, rank) VALUES(9,'Ronna','Britt','Platinum');
INSERT INTO members(member_id, first_name, last_name, rank) VALUES(10,'Tressie','Short','Bronze');

INSERT INTO member_staging(member_id, first_name, last_name, rank) VALUES(1,'Abel','Wolf','Silver');
INSERT INTO member_staging(member_id, first_name, last_name, rank) VALUES(2,'Clarita','Franco','Platinum');
INSERT INTO member_staging(member_id, first_name, last_name, rank) VALUES(3,'Darryl','Giles','Bronze');
INSERT INTO member_staging(member_id, first_name, last_name, rank) VALUES(4,'Dorthea','Gate','Gold');
INSERT INTO member_staging(member_id, first_name, last_name, rank) VALUES(5,'Katrina','Wheeler','Silver');
INSERT INTO member_staging(member_id, first_name, last_name, rank) VALUES(6,'Lilian','Stark','Silver');



SELECT * FROM members;
SELECT * FROM member_staging;

MERGE INTO member_staging X
USING (
    SELECT MEMBER_ID, FIRST_NAME, LAST_NAME, RANK FROM members
) Y
ON (X.MEMBER_ID = Y.MEMBER_ID)
WHEN MATCHED THEN
    UPDATE SET 
        X.FIRST_NAME = Y.FIRST_NAME,
        X.LAST_NAME = Y.LAST_NAME,
        X.RANK = Y.RANK
    WHERE X.RANK <> Y.RANK OR
    X.FIRST_NAME <> Y.FIRST_NAME OR
    X.LAST_NAME <> Y.LAST_NAME
WHEN NOT MATCHED THEN
    INSERT (X.MEMBER_ID, X.FIRST_NAME, X.LAST_NAME, X.RANK)
    VALUES (Y.MEMBER_ID, Y.FIRST_NAME, Y.LAST_NAME, Y.RANK);
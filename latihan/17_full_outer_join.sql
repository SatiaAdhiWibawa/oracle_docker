-- FULL OUTER JOIN in Oracle SQL
-- Full Outer join adalah gabungan dari left outer join dan right outer join
-- Mengambil semua data dari table pertama dan table kedua
-- SELECT * FROM table1 FULL OUTER JOIN table2 ON table1.column = table2.column


-- CREATE TABLE PROJECTS
CREATE TABLE projects(
    project_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    project_name VARCHAR2(100) NOT NULL
);

-- CREATE TABLE MEMBERS
CREATE TABLE members(
    member_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    member_name VARCHAR2(100) NOT NULL,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- INSERT DATA
INSERT INTO projects(project_name) 
VALUES('ERP');

INSERT INTO projects(project_name) 
VALUES('Sales CRM');

INSERT INTO members(member_name, project_id)
VALUES('John Doe',1);

INSERT INTO members(member_name, project_id)
VALUES ('Jane Doe',1);

INSERT INTO members(member_name, project_id)
VALUES ('Jack Daniel',null);




-- CEK DATA DI TABLE PROJECTS
SELECT * FROM PROJECTS;

-- CEK DATA DI TABLE MEMBERS
SELECT * FROM MEMBERS;


-- CONTOH FULL OUTER JOIN
SELECT M.MEMBER_NAME, P.PROJECT_NAME
FROM MEMBERS M
FULL OUTER JOIN PROJECTS P ON P.PROJECT_ID = M.PROJECT_ID
ORDER BY M.MEMBER_NAME;


-- FULL OUTER JOIN DENGAN WHERE

-- Mengambil data yang tidak memiliki relasi dari tabel members
SELECT M.MEMBER_NAME, P.PROJECT_NAME
FROM MEMBERS M
FULL OUTER JOIN PROJECTS P ON P.PROJECT_ID = M.PROJECT_ID
WHERE M.MEMBER_NAME IS NULL
ORDER BY M.MEMBER_NAME;

-- Mengambil data yang tidak memiliki relasi dari tabel projects
SELECT M.MEMBER_NAME, P.PROJECT_NAME
FROM MEMBERS M
FULL OUTER JOIN PROJECTS P ON P.PROJECT_ID = M.PROJECT_ID
WHERE P.PROJECT_NAME IS NULL
ORDER BY M.MEMBER_NAME;

-- Mengambil data yang tidak memiliki relasi dari kedua table
SELECT M.MEMBER_NAME, P.PROJECT_NAME
FROM MEMBERS M
FULL OUTER JOIN PROJECTS P ON P.PROJECT_ID = M.PROJECT_ID
WHERE P.PROJECT_NAME IS NULL OR M.MEMBER_NAME IS NULL
ORDER BY M.MEMBER_NAME;
-- CASE
-- CASE adalah fungsi yang digunakan untuk mengevaluasi kondisi dan menghasilkan nilai berdasarkan kondisi tersebut.
-- CASE digunakan untuk memilih suatu urutan pernyataan untuk dieksekusi
-- dari banyak kemungkinan urutan

-- CASE sederhana
CASE selector -- ini eksepsi yang dievaluasi
WHEN selector_value_1 THEN -- Evaluasi nilai secara berurutan
    statement_1;
WHEN selector_value_2 THEN
    statement_2;
    .....
END
    else_statement; -- jika tidak ada yang cocok
END CASE;



-- contoh CASE
DECLARE
    l_grade CHAR(1);
    l_rank VARCHAR2(20);
BEGIN
    l_grade := 'A';
    CASE l_grade
    WHEN 'A' THEN
        l_rank := 'Excellent';
    WHEN 'B' THEN
        l_rank := 'Good';
    WHEN 'C' THEN
        l_rank := 'Average';
    ELSE
        l_rank := 'Failed';
    END CASE;
    DBMS_OUTPUT.PUT_LINE('Rank: ' || l_rank);
END;


-- CASE pernyataan yang dicari (searched CASE)
-- pengecekannya di dalam when
DECLARE
    l_sales number;
    l_commission number;
BEGIN
    l_sales := 150000;
    CASE
    WHEN l_sales > 200000 THEN
        l_commission := 0.2;
    WHEN l_sales > 100000 AND l_sales <= 200000 THEN
        l_commission := 0.15;
    WHEN l_sales > 50000 AND l_sales <= 100000 THEN
        l_commission := 0.1;
    WHEN l_sales > 3000 THEN
        l_commission := 0.05;
    ELSE
        l_commission := 0.02;
    END CASE;

    DBMS_OUTPUT.PUT_LINE('Commission: ' || l_commission * 100 || '%');
END;

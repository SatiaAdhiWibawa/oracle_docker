-- [P_CRPT0018_Q_V1] - 'Q_UN4'  [20240924 12:53:05]
WITH 
OPA AS (
    SELECT
        TRIM( REGEXP_SUBSTR( '',
        '[^;]+',
        1,
        LEVEL ) ) OP --V_P_OPPRODUCT=''		--=
    FROM
        DUAL
    CONNECT BY
        LEVEL < = LENGTH( '' ) - LENGTH( REPLACE( '', ';', '' ) ) + 1 --V_P_OPPRODUCT=''		--=
), RES_OP AS (
    SELECT
        TRIM( REGEXP_SUBSTR( '',
        '[^;]+',
        1,
        LEVEL ) ) OP --V_P_RES_OP2=''		--=
    FROM
        DUAL
    CONNECT BY
        LEVEL < = LENGTH( '' ) - LENGTH( REPLACE( '', ';', '' ) ) + 1 --V_P_RES_OP2=''		--=
), V_OP AS (
    SELECT
        TRIM( REGEXP_SUBSTR( '',
        '[^;]+',
        1,
        LEVEL ) ) OP --V_P_OP=''		--=
    FROM
        DUAL
    CONNECT BY
        LEVEL < = LENGTH( '' ) - LENGTH( REPLACE( '', ';', '' ) ) + 1 --V_P_OP=''		--=
), DEF_DATA AS(
 --SELECT FCT_CODE,        PLANT_ID,           VSM,                REQ_TIME ,           OP,                 OP_DESC,        OP_PRODUCT,
    SELECT
        FCT_CODE,
        PLANT_ID,
        VSM,
        REQ_DATE,
        OP,
        OP_DESC,
        OP_PRODUCT, -- =  		--=
        CAUSE_FACTORY,
        CAUSE_FACTORY_DESC,
        CAUSE_OP,
        CAUSE_OP_DESC,
        DEF_GRADE,
        DEF_CODE,
        DEF_DESC, -- =  		--=
        CHG_GRADE,
        STYLE_NO,
        PART_CODE,
        SIZE_CODE,
        PO_ID,
        MODEL_NAME,
        PART_NAME,
        OP_PRODUCT_DESC,
        DEFECT_TYPE, -- =  		--=
        --SUM(DEF_QTY)     DEF_QTY,            SHIFT,              ITEM_COST           ITEM_COST,          SUM(MAT_COST)       MAT_COST,       SUM(MAT_OVH_COST)       MAT_OVH_COST,
        ROUND((SUM(DEF_L_QTY) + SUM(DEF_R_QTY))/2,
        2) DEF_QTY,
        SHIFT,
        ITEM_COST ITEM_COST,
        SUM(MAT_COST) MAT_COST,
        SUM(MAT_OVH_COST) MAT_OVH_COST, -- HAO 2020.10.01 (L_QTY + R_QTY)/2
        SUM(RES_COST) RES_COST,
        SUM(OVH_COST) OVH_COST,
        SUM(DEFECT_COST) DEFECT_COST,
        WORK_LINE,
        GB_TYPE || ' : ' || GB_TYPE_DESC AS GB_TYPE,
        DESTRUCTION_NO,
        REQ_USER_ID,
        REQ_USER_NAME,
        CREATE_USER_ID,
        CREATE_USER_NAME,
        CREATE_USER_DEPT,
        CREATE_TIME,
        UPDATE_USER_ID,
        UPDATE_TIME,
        DEFECT_TYPE_DESC,
        UPDATE_USER_NAME,
        UPDATE_USER_DEPT,
        GENDER,
        MOLD_ID,
        SEQ,
        REQ_COMMENT,
 
        --  GROUPING(FCT_CODE)     + GROUPING(PLANT_ID)        + GROUPING(VSM)                 + GROUPING(REQ_TIME)        + GROUPING(OP)             + GROUPING(OP_DESC)
        GROUPING( FCT_CODE ) + GROUPING( PLANT_ID ) + GROUPING( VSM ) + GROUPING( REQ_DATE ) + GROUPING( OP ) + GROUPING( OP_DESC ) -- =  		--=
        + GROUPING( OP_PRODUCT ) + GROUPING( CAUSE_FACTORY ) + GROUPING( CAUSE_FACTORY_DESC ) + GROUPING( CAUSE_OP ) + GROUPING( CAUSE_OP_DESC ) + GROUPING( DEF_GRADE ) -- =  		--=
        + GROUPING(DEF_CODE) + GROUPING(DEF_DESC) + GROUPING(CHG_GRADE) + GROUPING(STYLE_NO) + GROUPING(PART_CODE) + GROUPING(SIZE_CODE) + GROUPING(PO_ID) + GROUPING(MODEL_NAME) + GROUPING(PART_NAME) + GROUPING(WORK_LINE) + GROUPING(GB_TYPE) + GROUPING(DESTRUCTION_NO)
 --+ GROUPING(REQ_USER_ID)
        + GROUPING(CREATE_USER_ID) + GROUPING( CREATE_TIME ) + GROUPING( UPDATE_USER_ID ) + GROUPING( UPDATE_TIME ) + GROUPING( OP_PRODUCT_DESC ) + GROUPING( DEFECT_TYPE ) + GROUPING( DEFECT_TYPE_DESC ) -- =  		--=
        + GROUPING(CREATE_USER_NAME) + GROUPING(CREATE_USER_DEPT) + GROUPING(UPDATE_USER_NAME) + GROUPING(UPDATE_USER_DEPT) + GROUPING(GENDER) + GROUPING(MOLD_ID) + GROUPING(SEQ) + GROUPING(REQ_COMMENT) AS GRP
    FROM
        (
            SELECT
                E.GEN_CODE AS GENDER,
                NVL((
                    SELECT
                        XX.ORD_CMF_13
                    FROM
                        MWIPORDSTS XX
                    WHERE
                        XX.FACTORY(+) = A.FACTORY
                        AND XX.ORDER_ID = A.ORDER_ID
                ),
                ' ') AS PO_ID, --NRZ ADD PO_ID 2023-0203
                A.INSP_DOC_3 AS MOLD_ID, --=
                S.C_SEQ AS SEQ,
                A.PLANT_ID AS FCT_CODE,
                A.INSP_CMF_9 AS PLANT_ID,
                /???? ???/ --=
                A.INSP_CMF_19 AS VSM, --=
                --TO_CHAR(TO_DATE(A.REQ_TIME, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS') AS REQ_TIME,
                TO_CHAR(TO_DATE(A.REQ_DATE,
                'YYYY-MM-DD'),
                'YYYY-MM-DD') AS REQ_DATE,
                A.INSP_CMF_2 AS OP,
                /?? ?? ??/ --=
                C.FLOW_DESC AS OP_DESC, --=
                A.INSP_CMF_5 AS OP_PRODUCT, --=
                J.FLOW_DESC AS OP_PRODUCT_DESC, --=
                A.INSP_CMF_1 AS CAUSE_FACTORY, --=
                I.DATA_1 AS CAUSE_FACTORY_DESC,
                A.DEF_REASON AS CAUSE_OP,
                D.FLOW_DESC AS CAUSE_OP_DESC, --=
                --                   A.DEF_GRADE            AS DEF_GRADE      ,
                BH.DATA_1 AS DEF_GRADE,
                A.INSP_DOC_1 AS DEFECT_TYPE, --=
                K.DATA_1 AS DEFECT_TYPE_DESC,
                B.DEF_CODE AS DEF_CODE,
                H.DATA_1 AS DEF_DESC,
 
                --                   A.INSP_CMF_16          AS CHG_GRADE      ,
                AH.DATA_1 AS CHG_GRADE,
                SUBSTR(A.MAT_ID,
                1,
                10) AS STYLE_NO,
                SUBSTR(A.MAT_ID,
                -3) AS PART_CODE,
                SUBSTR(A.MAT_ID,
                12,
                3) AS SIZE_CODE,
 
                --                   E.STYLE_NO             AS STYLE_NO       ,
                --                   E.PART_CODE            AS PART_CODE      ,
                --                   E.SIZE_CODE            AS SIZE_CODE      ,
                F.DATA_1 AS MODEL_NAME,
                G.DATA_1 AS PART_NAME,
 
                --B.DEF_QTY              AS DEF_QTY        ,
                B.DEF_L_QTY AS DEF_L_QTY, -- HAO 2020.10.01 (L_QTY + R_QTY)/2
                B.DEF_R_QTY AS DEF_R_QTY, -- HAO 2020.10.01 (L_QTY + R_QTY)/2
                A.INSP_CMF_8 AS SHIFT,
                /???/ --=
                A.INSP_CMF_23 AS ITEM_COST,
                /????/ --=
                A.INSP_CMF_22 AS MAT_COST,
                /????/ --=
                A.INSP_CMF_25 AS MAT_OVH_COST,
                /???/ --=
                A.INSP_CMF_26 AS RES_COST, --=
                A.INSP_CMF_27 AS OVH_COST, --=
                --                   CASE WHEN A.DEF_GRADE = 'B' THEN ROUND((DECODE(A.INSP_CMF_23, ' ', 0, NULL, 0, A.INSP_CMF_23) * B.DEF_QTY) * 0.4, 3)
                --                        WHEN A.DEF_GRADE = 'A' AND A.INSP_CMF_16 = 'B' THEN ROUND((DECODE(A.INSP_CMF_23, ' ', 0, NULL, 0, A.INSP_CMF_23) * B.DEF_QTY) * 0.4, 3)
                --                        WHEN A.DEF_GRADE = 'B' AND A.INSP_CMF_16 = 'C' THEN ROUND((DECODE(A.INSP_CMF_23, ' ', 0, NULL, 0, A.INSP_CMF_23) * B.DEF_QTY) * 0.6, 3)
                --                        WHEN A.DEF_GRADE = 'C'  THEN ROUND((DECODE(A.INSP_CMF_23, ' ', 0, NULL, 0, A.INSP_CMF_23) * B.DEF_QTY) * 1, 3)
                --                   ELSE DECODE(B.DEF_CMF_2, ' ', 0, NULL, 0, B.DEF_CMF_2) * B.DEF_QTY END  AS DEFECT_COST,
                CASE
                    WHEN A.DEF_GRADE = 'B' THEN
                        ROUND( ( DECODE( A.INSP_CMF_23, ' ', 0, NULL, 0, A.INSP_CMF_23 ) * ( ( B.DEF_L_QTY+B.DEF_R_QTY )/2 ) ) * 0.4, 3 ) --=
                    WHEN A.DEF_GRADE = 'A' AND A.INSP_CMF_16 = 'B' THEN
                        ROUND( ( DECODE( A.INSP_CMF_23, ' ', 0, NULL, 0, A.INSP_CMF_23 ) * ( ( B.DEF_L_QTY+B.DEF_R_QTY )/2 ) ) * 0.4, 3 ) --=
                    WHEN A.DEF_GRADE = 'B' AND A.INSP_CMF_16 = 'C' THEN
                        ROUND( ( DECODE( A.INSP_CMF_23, ' ', 0, NULL, 0, A.INSP_CMF_23 ) * ( ( B.DEF_L_QTY+B.DEF_R_QTY )/2 ) ) * 0.6, 3 ) --=
                    WHEN A.DEF_GRADE = 'C' THEN
                        ROUND( ( DECODE( A.INSP_CMF_23, ' ', 0, NULL, 0, A.INSP_CMF_23 ) * ( ( B.DEF_L_QTY+B.DEF_R_QTY )/2 ) ) * 1, 3 ) --=
                    ELSE
                        DECODE(B.DEF_CMF_2, ' ', 0, NULL, 0, B.DEF_CMF_2) * ((B.DEF_L_QTY+B.DEF_R_QTY)/2)
                END AS DEFECT_COST,
 
                --B.DEF_CODE              AS DEF_CODE  ,
                A.DEF_LINE AS WORK_LINE,
                A.INSP_CMF_11 AS GB_TYPE, --=
                P.DATA_1 AS GB_TYPE_DESC,
                A.INSP_CMF_28 AS DESTRUCTION_NO, --=
                A.REQ_USER_ID,
                R.USER_DESC REQ_USER_NAME,
                A.CREATE_USER_ID,
                L.USER_DESC CREATE_USER_NAME,
 
                --                   NVL(M.DEPT_NAME_1, L.USER_CMF_4) CREATE_USER_DEPT,
                NVL(M.DISPLAY_DEPT_NM,
                L.USER_CMF_4) CREATE_USER_DEPT,
                TO_CHAR(TO_DATE(A.CREATE_TIME,
                'YYYY-MM-DD HH24:MI:SS'),
                'YYYY-MM-DD HH24:MI:SS') AS CREATE_TIME,
                A.UPDATE_USER_ID,
                N.USER_DESC UPDATE_USER_NAME,
 
                --                   NVL(O.DEPT_NAME_1, N.USER_CMF_4) UPDATE_USER_DEPT,
                NVL(O.DISPLAY_DEPT_NM,
                N.USER_CMF_4) UPDATE_USER_DEPT,
                TO_CHAR(TO_DATE(A.UPDATE_TIME,
                'YYYY-MM-DD HH24:MI:SS'),
                'YYYY-MM-DD HH24:MI:SS') AS UPDATE_TIME,
                A.REQ_COMMENT --JUDGE COMMENT ADD BY PRAYOGA 240722
            FROM
                CEDCREQDEF A,
                CEDCINSDFT B,
                MWIPFLWDEF C,
                MWIPFLWDEF D,
                VW_MWIPMATDEF_01 E,
                MGCMLAGDAT EE,
                MGCMLAGDAT F,
                MGCMLAGDAT G,
                MGCMLAGDAT H,
                MGCMLAGDAT I,
                MWIPFLWDEF J,
                MGCMTBLDAT K,
                MSECUSRDEF L
 --              ,TDSBIZ.SYSUSERMASTER M
,
                PW_HR_EMPLOYEES_V@DL_TTAMESTOTTHCM M,
                MSECUSRDEF N
 --              ,TDSBIZ.SYSUSERMASTER O
,
                PW_HR_EMPLOYEES_V@DL_TTAMESTOTTHCM O,
                MGCMTBLDAT BH,
                MGCMTBLDAT AH,
                MGCMTBLDAT P,
                MSECUSRDEF R,
                MMS.MMS_MOLD_MASTER S
            WHERE
                A.FACTORY = 'TT' -- COMPANY CODE  		--V_P_FACTORY='TT'		--=
                --               AND CASE WHEN V_P_INSP_TYPE IS NULL THEN 'DQC' ELSE INSTR(V_P_INSP_TYPE,A.INSP_TYPE) > 0 END
                AND INSTR( 'AQC, DQC, LQC', A.INSP_TYPE ) > 0 --V_P_INSP_TYPE='AQC, DQC, LQC'		--=
                --AND NVL(A.INSP_CMF_14   ,' ') = ' '
                --AND A.PLANT_ID = V_P_FCT
                AND ( '' IS NULL
                OR '' = ''
                OR A.PLANT_ID = '' ) -- FCT_CODE 		--V_P_FCT=''		--=
                --AND A.INSP_CMF_4 = V_P_PLANT           -- PLANT_ID
                AND ( '' IS NULL
                OR '' = ''
                OR A.INSP_CMF_4 = '' ) --V_P_PLANT=''		--=
                AND ( '' IS NULL
                OR '' = ''
                OR SUBSTR( A.MAT_ID, 1, 10 ) = '' ) --V_P_STYLE=''		--=
                AND A.REQ_DATE BETWEEN '20240924' AND '20240924' -- FROM/TO DATE. 8?? ?? ???..  		--V_P_DATE_FROM='20240924'		--V_P_DATE_TO='20240924'		--=
                --               AND A.INSP_CMF_2 LIKE REPLACE(V_P_OP, '-', '') || '%'     -- OP
                AND A.DEF_REASON LIKE REPLACE( '', '-', '' )
                                      || '%' -- RES OP 		--V_P_RES_OP=''		--=
                --AND (V_P_MODEL IS NULL OR V_P_MODEL=  '' OR F.DATA_2 LIKE  UPPER('%' || V_P_MODEL|| '%'))
                AND ( '' IS NULL
                OR '' = ''
                OR F.KEY_1 = '' ) --V_P_MODEL=''		--=
                AND ( '' IS NULL
                OR '' = ''
                OR B.DEF_CODE = '' ) --V_P_DEF_CODE=''		--=
                AND ( ( 'ALL' = 'B'
                AND A.DEF_GRADE = 'B' ) -- B 		--V_P_DEF_GRADE='ALL'		--=
                OR ( 'ALL' = 'C'
                AND A.DEF_GRADE = 'C' ) -- C 		--V_P_DEF_GRADE='ALL'		--=
                OR ( 'ALL' = 'BC'
                AND A.DEF_GRADE IN ( 'B', 'C' ) ) -- B ,  C 		--V_P_DEF_GRADE='ALL'		--=
                OR ( 'ALL' = 'NOTBC'
                AND A.DEF_GRADE NOT IN ( 'B', 'C' ) ) -- IGNORE B ,  C 		--V_P_DEF_GRADE='ALL'		--=
                OR ( 'ALL' = 'ALL'
                AND A.DEF_GRADE = A.DEF_GRADE ) -- ALL 		--V_P_DEF_GRADE='ALL'		--=
                )
                AND ( ( 'N' = 'N'
                AND 'N' = 'N'
                AND A.INSP_CMF_11 = A.INSP_CMF_11 ) --V_P_PART_TYPE1='N'		--V_P_PART_TYPE2='N'		--=
                OR ( 'N' = 'Y'
                AND 'N' = 'N'
                AND A.INSP_CMF_11 IN ( 'S', 'M', 'D' ) ) --V_P_PART_TYPE1='N'		--V_P_PART_TYPE2='N'		--=
                OR ( 'N' = 'N'
                AND 'N' = 'Y'
                AND A.INSP_CMF_11 IN ( 'F' ) ) --V_P_PART_TYPE1='N'		--V_P_PART_TYPE2='N'		--=
                OR ( 'N' = 'Y'
                AND 'N' = 'Y'
                AND A.INSP_CMF_11 IN ( 'S', 'M', 'D', 'F' ) ) --V_P_PART_TYPE1='N'		--V_P_PART_TYPE2='N'		--=
                ) -- 'S' : ??, 'M' : ??, 'D' : ??????,         'F' : ??
                AND A.FACTORY = B.FACTORY
                AND A.INS_NO = B.INS_NO
                AND A.FACTORY = C.FACTORY
                AND A.INSP_CMF_2 = C.FLOW --=
                AND A.FACTORY = D.FACTORY
                AND A.DEF_REASON = D.FLOW
                AND A.FACTORY = E.FACTORY(+)
                AND A.MAT_ID = E.MAT_ID(+)
                AND E.MAT_VER(+) = 1
                AND A.FACTORY = EE.FACTORY
                AND SUBSTR(A.MAT_ID, 1, 10) = EE.KEY_1
                AND EE.TABLE_NAME = 'CCOM_STYLE'
                AND EE.FACTORY = F.FACTORY
                AND F.TABLE_NAME = 'CCOM_MODEL'
                AND F.KEY_1 = EE.DATA_2
                AND E.FACTORY = F.FACTORY
                AND F.TABLE_NAME = 'CCOM_MODEL'
                AND E.MODEL_CODE = F.KEY_1
                AND E.FACTORY = G.FACTORY
                AND G.TABLE_NAME = 'CCOM_PART_CODE'
                AND E.PART_CODE = G.KEY_1
                AND B.FACTORY = H.FACTORY(+)
                AND H.TABLE_NAME(+) = 'CEDC_DEF_CODE'
                AND B.DEF_CODE = H.KEY_1(+)
                AND A.FACTORY = I.FACTORY( + )
                AND I.TABLE_NAME( + ) = 'CCOM_PLANT'
                AND A.INSP_CMF_1 = I.KEY_1( + ) --=
                AND A.FACTORY = J.FACTORY( + )
                AND A.INSP_CMF_5 = J.FLOW( + ) --=
                AND A.FACTORY = K.FACTORY(+)
                AND K.TABLE_NAME(+) = 'CEDC_DEF_TYPE_INPUT'
                AND A.INSP_DOC_1 = K.KEY_1( + ) --=
                AND A.FACTORY = L.FACTORY(+)
                AND A.CREATE_USER_ID = L.USER_ID(+)
 --                   AND A.CREATE_USER_ID = M.USER_ID(+)
                AND A.CREATE_USER_ID = M.EMPID(+)
                AND A.FACTORY = N.FACTORY(+)
                AND A.UPDATE_USER_ID = N.USER_ID(+)
                AND A.FACTORY = R.FACTORY(+)
                AND A.REQ_USER_ID = R.USER_ID(+)
 --                   AND A.UPDATE_USER_ID = O.USER_ID(+)
                AND A.UPDATE_USER_ID = O.EMPID(+)
                AND A.FACTORY = BH.FACTORY(+)
                AND BH.TABLE_NAME(+) = 'CEDC_DEF_GRADE'
                AND A.DEF_GRADE = BH.KEY_1(+)
                AND A.FACTORY = AH.FACTORY( + )
                AND AH.TABLE_NAME( + ) = 'CEDC_DEF_GRADE'
                AND A.INSP_CMF_16 = AH.KEY_1( + ) --=
                AND A.FACTORY = P.FACTORY( + )
                AND P.TABLE_NAME( + ) = 'CEDC_DEF_REG_TYPE'
                AND A.INSP_CMF_11 = P.KEY_1( + ) --=
                AND A.INSP_DOC_3 = S.FCTY_MOLD_ID_NUMBER_FCTY_CODE ( + ) --=
                AND ( ( 'N' = 'Y'
                AND K.DATA_1 NOT IN ( 'OTHER' )
                AND SUBSTR( H.DATA_1, 5, 16 ) ! = 'OP ITSELF DEFECT' ) --V_P_REPORT='N'		--=
                OR ( 'N' = 'N'
                AND 1 = 1 ) --V_P_REPORT='N'		--=
                ) -- ADD BY PRAYOGA 2024-02-19
                --                   AND CASE WHEN 'Y' = V_P_REPORT AND K.DATA_1 NOT IN ('OTHER') AND SUBSTR(H.DATA_1, 5, 16) != 'OP ITSELF DEFECT' THEN 1 -- ADD BY PRAYOGA 2023-03-15
                --                            WHEN 'N' = V_P_REPORT AND 1=1 THEN 1 END = 1 -- ADD BY PRAYOGA 2023-03-15
                --                            AND A.INSP_CMF_5 IN (SELECT OPA1."OP" FROM OPA OPA1)
                --                            AND A.DEF_REASON IN (SELECT RES_OP."OP" FROM RES_OP)
                --                            AND A.INSP_CMF_2 IN (SELECT V_OP."OP" FROM V_OP)
                --                            AND CASE WHEN V_P_OPPRODUCT <> '' OR V_P_OPPRODUCT IS NOT NULL AND A.INSP_CMF_5 IN (SELECT OPA1."OP" FROM OPA OPA1) THEN 1
                --                                 WHEN V_P_OPPRODUCT = '' AND 1 = 1 THEN 1
                --                            END = 1
                AND ( ( '' IS NULL
                OR '' = '' )
                AND 1 = 1 --V_P_OPPRODUCT=''		--=
                OR ( '' IS NOT NULL
                OR '' ! = '' )
                AND A.INSP_CMF_5 IN (
                    SELECT
                        OPA1."OP"
                    FROM
                        OPA OPA1
                ) --V_P_OPPRODUCT=''		--=
                ) -- ADD BY PRAYOGA 2024-02-19
                AND ( ( '' IS NULL
                OR '' = '' )
                AND 1 = 1 --V_P_RES_OP2=''		--=
                OR ( '' IS NOT NULL
                OR '' ! = '' )
                AND A.DEF_REASON IN (
                    SELECT
                        RES_OP."OP"
                    FROM
                        RES_OP
                ) --V_P_RES_OP2=''		--=
                ) -- ADD BY PRAYOGA 2024-02-19
                AND ( ( '' IS NULL
                OR '' = '' )
                AND 1 = 1 --V_P_OP=''		--=
                OR ( '' IS NOT NULL
                OR '' ! = '' )
                AND A.INSP_CMF_2 IN (
                    SELECT
                        V_OP."OP"
                    FROM
                        V_OP
                ) --V_P_OP=''		--=
                ) -- ADD BY PRAYOGA 2024-02-19
--ORDER BY A.INSP_CMF_17, A.REQ_TIME, A.INSP_CMF_7)
            ORDER BY
                A.INSP_CMF_17,
                A.REQ_DATE,
                A.INSP_CMF_7
        ) --=
        --GROUP BY ROLLUP(FCT_CODE,       PLANT_ID,           VSM,            REQ_TIME,   OP,             OP_DESC,            OP_PRODUCT,     CAUSE_FACTORY,  CAUSE_FACTORY_DESC,
    GROUP BY
        ROLLUP( FCT_CODE, PLANT_ID, VSM, REQ_DATE, OP, OP_DESC, OP_PRODUCT, CAUSE_FACTORY, CAUSE_FACTORY_DESC, -- =  		--=
        CAUSE_OP, CAUSE_OP_DESC, DEF_GRADE, DEF_CODE, DEF_DESC, CHG_GRADE, STYLE_NO, PART_CODE, SIZE_CODE, PO_ID, MODEL_NAME, SHIFT, ITEM_COST, -- =  		--=
        PART_NAME, OP_PRODUCT_DESC, DEFECT_TYPE, MAT_COST, MAT_OVH_COST, RES_COST, OVH_COST, WORK_LINE, GB_TYPE, GB_TYPE_DESC, DESTRUCTION_NO, -- =  		--=
        REQ_USER_ID, REQ_USER_NAME, CREATE_USER_ID, CREATE_TIME, UPDATE_USER_ID, CREATE_USER_NAME, CREATE_USER_DEPT, UPDATE_TIME, DEFECT_TYPE_DESC, UPDATE_USER_NAME, UPDATE_USER_DEPT, GENDER, MOLD_ID, SEQ, REQ_COMMENT)
)
 --    SELECT CASE WHEN GRP = 34 THEN 'TOTAL' ELSE FCT_CODE END FCT_CODE,  PLANT_ID,   VSM,
SELECT
    CASE
        WHEN GRP = 39 THEN
            'TOTAL'
        WHEN GRP = 37 THEN
            ''
        ELSE
            FCT_CODE
    END FCT_CODE,
    CASE
        WHEN GRP = 37 THEN
            'SUBTOTAL'
        ELSE
            PLANT_ID
    END PLANT_ID,
    VSM,
 
    --REQ_TIME,            OP,             OP_DESC,            OP_PRODUCT,         CAUSE_FACTORY,          CAUSE_FACTORY_DESC,     CAUSE_OP,   SHIFT,
    REQ_DATE REQ_TIME,
    OP,
    OP_DESC,
    OP_PRODUCT,
    CAUSE_FACTORY,
    CAUSE_FACTORY_DESC,
    CAUSE_OP,
    SHIFT, -- =  		--=
    CAUSE_OP_DESC,
    DEF_GRADE,
    DEF_CODE,
    DEF_DESC,
    CHG_GRADE,
    GENDER,
    STYLE_NO,
    PART_CODE,
    SIZE_CODE, -- =  		--=
    PO_ID,
    MODEL_NAME,
    PART_NAME,
    DEF_QTY,
    ROUND(ITEM_COST,
    4) ITEM_COST,
    ROUND(MAT_COST,
    4) MAT_COST,
    ROUND(MAT_OVH_COST,
    4) MAT_OVH_COST,
    ROUND(RES_COST,
    4) RES_COST,
    ROUND(OVH_COST,
    4) OVH_COST,
    ROUND(DEFECT_COST,
    3) DEFECT_COST,
    WORK_LINE,
    GB_TYPE,
    DESTRUCTION_NO,
    REQ_USER_ID,
    REQ_USER_NAME,
    CREATE_USER_ID,
    CREATE_USER_NAME,
    CREATE_USER_DEPT,
    CREATE_TIME,
    UPDATE_USER_ID,
    UPDATE_TIME,
    GRP,
    OP_PRODUCT_DESC,
    DEFECT_TYPE,
    DEFECT_TYPE_DESC,
    UPDATE_USER_NAME,
    UPDATE_USER_DEPT,
    MOLD_ID,
    SEQ,
    REQ_COMMENT, -- =  		--=
    CASE GRP
        WHEN 39 THEN
            ' '
    END || PLANT_ID || CASE
        WHEN GRP = 37 THEN
            '.'
    END GRP_2 -- =  		--=
    --    SELECT DISTINCT GRP
FROM
    DEF_DATA
 --    WHERE GRP IN (0,34)
    --    WHERE  GRP IN (0, 36,  38)
WHERE
    GRP IN (0, 37, 39)
ORDER BY
    GRP_2;

--=
--ORDER BY CASE WHEN GRP = 34 THEN 0 ELSE 1 END;
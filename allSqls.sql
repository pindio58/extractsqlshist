--====================================
-- Extracted at 05-Apr-2022-00:04:48 =
--====================================



--=================================  0  ================================================

select to_char(TO_DATE ('November 13, 1992', 'MONTH DD, YYYY'),'YYYY') from dual;

--=================================  1  ================================================

DECLARE
    v_age NUMBER := 16;
BEGIN
    IF v_age < 18 THEN
        raise_application_error(-20008, 'go home kid');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(sqlerrm);
END;/

--=================================  2  ================================================

DECLARE
-- var1 varchar2(100)
-- var2 number
-- var3 emp.enp_name%type

-- how to use 
--  var4.emp_name

    var4 hr.employees%rowtype;
BEGIN
    SELECT
        employee_id
    INTO var4.employee_id
    FROM
        hr.employees
    WHERE
        rownum=1;

    dbms_output.put_line(var4.employee_id);
END;/

--=================================  3  ================================================

select to_char(TO_DATE ('November 13, 1992', 'MONTH DD, YYYY'),'MM/DDYYYY') from dual;

--=================================  4  ================================================

with details as (
SELECT
    level lull,
    to_char(add_months(TO_DATE('01-JAN-2019', 'DD-MON-YYYY'), - trunc(dbms_random.value(1, 4) - 1) * 12), 'RRRR') mon
FROM
    dual
CONNECT BY
    level <= 100)
select mon, listagg(lull,',') within group(order by lull)
from details details group by mon;

--=================================  5  ================================================

BEGIN
    dbms_output.put_line(1 / 0);
EXCEPTION
    WHEN zero_divide THEN
        dbms_output.put_line('Company had zero earnings.');
END;

--=================================  6  ================================================

select listagg(chr(level+64) ,',')from dual connect by level<=26;

--=================================  7  ================================================

SELECT
    level,
    'Name for ' || level,
    add_months(TO_DATE('01-JAN-2019', 'DD-MON-YYYY'), - trunc(dbms_random.value(1, 4) - 1) * 12), - trunc(dbms_random.value(1, 4) - 1) * 12
FROM
    dual
CONNECT BY
    level <= 10000;

--=================================  8  ================================================

SELECT
--    level,
--    'Name for ' || level,
    to_char(add_months(TO_DATE('01-JAN-2019', 'DD-MON-YYYY'), - trunc(dbms_random.value(1, 4) - 1) * 12),'RRRR') mon
FROM
    dual
CONNECT BY
    level <= 100

--=================================  9  ================================================

SELECT
    level,
    'Name for ' || level,
    add_months(TO_DATE('01-JAN-2019', 'DD-MON-YYYY'), - trunc(dbms_random.value(1, 4) - 1) * 12),TO_DATE('01-JAN-2019', 'DD-MON-YYYY'), - trunc(dbms_random.value(1, 4) - 1) * 12
FROM
    dual
CONNECT BY
    level <= 10000;

--=================================  10  ================================================

DECLARE
    invalid_number EXCEPTION;
BEGIN
    INSERT INTO emps ( employee_id ) VALUES ( 'major' );

EXCEPTION
    WHEN standard.invalid_number THEN
        dbms_output.put_line('This was done manually');
    WHEN OTHERS THEN
        dbms_output.put_line('This was AUTOMATIC');
END;/

--=================================  11  ================================================

SELECT
    level,
    to_char(add_months(TO_DATE('01-JAN-2019', 'DD-MON-YYYY'), - trunc(dbms_random.value(1, 4) - 1) * 12), 'RRRR') mon
FROM
    dual
CONNECT BY
    level <= 100

--=================================  12  ================================================

with details as (
SELECT
    level lull,
    to_char(add_months(TO_DATE('01-JAN-2019', 'DD-MON-YYYY'), - trunc(dbms_random.value(1, 4) - 1) * 12), 'RRRR') mon
FROM
    dual
CONNECT BY
    level <= 100)
select mon, listagg(lull,',') within group(order by lull desc) numbers
from details details group by mon;

--=================================  13  ================================================

BEGIN dbms_mview.refresh('test_mv'); END;;

--=================================  14  ================================================

select level from dual connect by level<=26;

--=================================  15  ================================================

SELECT
    level,
--    'Name for ' || level,
    add_months(TO_DATE('01-JAN-2019', 'DD-MON-YYYY'), - trunc(dbms_random.value(1, 4) - 1) * 12)
FROM
    dual
CONNECT BY
    level <= 10000;

--=================================  16  ================================================

INSERT ALL 
--INTO MEMBERS ("MemNo", "Name", "Age", proffesion_cd)VALUES(MEM_SEQ.nextval,'SIngh',2, 'DT')
INTO MEMBERS ("MemNo", "Name", "Age", proffesion_cd)VALUES(MEM_SEQ.nextval,'Jeeta',22, 'IT')
--INTO MEMBERS ("MemNo", "Name", "Age", proffesion_cd)VALUES(MEM_SEQ.nextval,'veer',17, 'IT')
--INTO MEMBERS ("MemNo", "Name", "Age", proffesion_cd)VALUES(MEM_SEQ.nextval,'pratap',89, 'DT')
Select 100 from dual;

--=================================  17  ================================================

select to_char(TO_DATE ('November 13, 1992', 'MONTH DD, YYYY'),'MMDDYYYY') from dual;

--=================================  18  ================================================

select  newone.nextval  from dual;

--=================================  19  ================================================

create cluster emp_dept (deptno number(2));

--=================================  20  ================================================

SELECT
    level,
    'Name for ' || level,
    add_months(TO_DATE('01-JAN-2019', 'DD-MON-YYYY'), - trunc(dbms_random.value(1, 4) - 1) * 12), dbms_random.value(1, 4) 
FROM
    dual
CONNECT BY
    level <= 10000;

--=================================  21  ================================================

select to_char(TO_DATE ('November 13, 1992', 'MONTH DD, YYYY'),'YEAR') from dual;

--=================================  22  ================================================

CREATE OR REPLACE PACKAGE BODY fibonacci AS

    PROCEDURE init (
        num4 NUMBER
    ) AS
        num1 NUMBER := 0;
        num2 NUMBER := 1;
        num3 NUMBER;
    BEGIN
        dbms_output.put_line(num1);
        dbms_output.put_line(num2);
        FOR i IN 1..num4 LOOP
--            num3 := num1 + num2;
            num3 := addition(num1, num2);
            dbms_output.put_line(num3);
            num1 := num2;
            num2 := num3;
        END LOOP;

    END init;

    FUNCTION addition (
        num1 NUMBER,
        num2 NUMBER
    ) RETURN NUMBER AS
        num3 NUMBER;
    BEGIN
        num3 := num1 + num2;
        RETURN num3;
    END addition;

END fibonacci;/

--=================================  23  ================================================

select TO_DATE ('November 13, 1992', 'MONTH DD, YYYY') from dual;

--=================================  24  ================================================

INSERT ALL INTO profession VALUES (
    'DT',
    'Dehati'
) SELECT
      1
  FROM
      dual;

--=================================  25  ================================================

select to_char(TO_DATE ('November 13, 1992', 'MONTH DD, YYYY'),'MONTH') from dual;

--=================================  26  ================================================

delete from members;

--=================================  27  ================================================

select newone.currval, newone.nextval from dual;

--=================================  28  ================================================

DECLARE
    invalid_number EXCEPTION;
BEGIN
    INSERT INTO emps ( employee_id ) VALUES ( 'major' );

EXCEPTION
    WHEN invalid_number THEN
        dbms_output.put_line('This was done manually');
    WHEN OTHERS THEN
        dbms_output.put_line('This was AUTOMATIC');
END;/

--=================================  29  ================================================

ALTER TABLE profession ADD CONSTRAINT profpk PRIMARY KEY ("PROFFESION_CD");

--=================================  30  ================================================

COMMENT ON TABLE hr.admin_emp IS
    'Enhanced employee table';

--=================================  31  ================================================

update admin_emp set sal=70000;

--=================================  32  ================================================

drop table admin_emp;

--=================================  33  ================================================

CREATE OR REPLACE PACKAGE BODY fibonacci AS

    PROCEDURE init (
        num2 NUMBER
    ) AS
        num1 NUMBER := 0;
        num2 NUMBER := 1;
        num3 NUMBER;
    BEGIN
        dbms_output.put_line(num1);
        dbms_output.put_line(num2);
        FOR i IN 1..10 LOOP
--            num3 := num1 + num2;
            num3 := addition(num1, num2);
            dbms_output.put_line(num3);
            num1 := num2;
            num2 := num3;
        END LOOP;

    END;

    FUNCTION addition (
        num1 NUMBER,
        num2 NUMBER
    ) RETURN NUMBER AS
        num3 NUMBER;
    BEGIN
        num3 := num1 + num2;
        RETURN num3;
    END addition;

END fibonacci;/

--=================================  34  ================================================

alter sequence mem_seq INCREMENT by -12 minvalue 1;

--=================================  35  ================================================

select * from allemps;

--=================================  36  ================================================

select chr(level+64) from dual connect by level<=26;

--=================================  37  ================================================

update emps set last_name =last_name||'_up'
where job_id='IT_PROG';

--=================================  38  ================================================

CREATE OR REPLACE FUNCTION addition (
    num1 NUMBER,
    num2 NUMBER
) RETURN NUMBER AS
    num3 NUMBER;
BEGIN
    num3 := num1 + num2;
    RETURN num3;
END addition;


SELECT
    0 digit
FROM
    dual
UNION
SELECT
    1 digit
FROM
    dual;

--=================================  39  ================================================

select newone.currval  from dual;

--=================================  40  ================================================

INSERT ALL 
--INTO MEMBERS ("MemNo", "Name", "Age", proffesion_cd)VALUES(MEM_SEQ.nextval,'SIngh',2, 'DT')
--INTO MEMBERS ("MemNo", "Name", "Age", proffesion_cd)VALUES(MEM_SEQ.nextval,'Jeeta',22, 'IT')
INTO MEMBERS ("MemNo", "Name", "Age", proffesion_cd)VALUES(MEM_SEQ.nextval,'veer',17, 'IT')
--INTO MEMBERS ("MemNo", "Name", "Age", proffesion_cd)VALUES(MEM_SEQ.nextval,'pratap',89, 'DT')
Select 100 from dual;

--=================================  41  ================================================

INSERT ALL 
--INTO MEMBERS ("MemNo", "Name", "Age", proffesion_cd)VALUES(MEM_SEQ.nextval,'SIngh',2, 'DT')
--INTO MEMBERS ("MemNo", "Name", "Age", proffesion_cd)VALUES(MEM_SEQ.nextval,'Jeeta',22, 'IT')
--INTO MEMBERS ("MemNo", "Name", "Age", proffesion_cd)VALUES(MEM_SEQ.nextval,'veer',17, 'IT')
INTO MEMBERS ("MemNo", "Name", "Age", proffesion_cd)VALUES(MEM_SEQ.nextval,'pratap',89, 'DT')
Select 100 from dual;

--=================================  42  ================================================

alter sequence mem_seq INCREMENT by 1 minvalue 1;

--=================================  43  ================================================

alter sequence mem_seq INCREMENT by -6 minvalue 0;

--=================================  44  ================================================

create materialized view test_mv as
select * from allemps;

--=================================  45  ================================================

select TRANSLATE(Namess,' ','---') from (
select 'Bhupinderjit Singh' Namess from dual);

--=================================  46  ================================================

DECLARE
    num1 NUMBER := 0;
    num2 NUMBER := 1;
    num3 NUMBER;
BEGIN
    dbms_output.put_line(num1);
    dbms_output.put_line(num2);
    FOR i IN 1..10 LOOP
        num3 := addition(num1, num2);
        dbms_output.put_line(num3);
        num1 := num2;
        num2 := num3;
    END LOOP;

END;/

--=================================  47  ================================================

ALTER TABLE members ADD constraint agecheck CHECK ( "Age" > 0 );

--=================================  48  ================================================

truncate table admin_emp CASCADE;

--=================================  49  ================================================

delete from members;
commit;

--=================================  50  ================================================

select * from depts;

--=================================  51  ================================================

    INSERT INTO admin_emp (
        empno,
        ename,
        ssn,
        job,
        mgr,
        deptno
    ) VALUES (
        98764,
        'Tommy',
        878676432,
        'Developer',
        23672,
        10
    )

--=================================  52  ================================================

Alter Sequence newone MAXVALUE 200;

--=================================  53  ================================================

select to_char(TO_DATE ('November 13, 1992', 'MONTH DD, YYYY'),'MM/DD/YYYY') from dual;

--=================================  54  ================================================

with details as (
SELECT
    level lull,
    to_char(add_months(TO_DATE('01-JAN-2019', 'DD-MON-YYYY'), - trunc(dbms_random.value(1, 4) - 1) * 12), 'RRRR') mon
FROM
    dual
CONNECT BY
    level <= 100)
select mon, listagg(lull,',') within group(order by lull) numbers
from details details group by mon;

--=================================  55  ================================================

alter sequence mem_seq INCREMENT by -20 minvalue 1;

--=================================  56  ================================================

SELECT DBMS_METADATA.GET_DDL ('TABLE', 'DEPARTMENTS','HR') FROM DUAL;

--=================================  57  ================================================

CREATE OR REPLACE PROCEDURE reset_seq (
    p_seq_name IN VARCHAR2
) IS
    l_val NUMBER;
BEGIN
    EXECUTE IMMEDIATE 'select '
                      || p_seq_name
                      || '.nextval from dual'
    INTO l_val;
    EXECUTE IMMEDIATE 'alter sequence '
                      || p_seq_name
                      || ' increment by -'
                      || l_val
                      || ' minvalue 1';
    EXECUTE IMMEDIATE 'alter sequence '
                      || p_seq_name
                      || ' increment by 1 minvalue 1';
END;/

--=================================  58  ================================================

alter sequence mem_seq INCREMENT by -19 minvalue 1;

--=================================  59  ================================================

SELECT
    level,
    'Name for ' || level,
    add_months(TO_DATE('01-JAN-2019', 'DD-MON-YYYY'), - trunc(dbms_random.value(1, 4) - 1) * 12), dbms_random.value(1, 4) -1
FROM
    dual
CONNECT BY
    level <= 10000;

--=================================  60  ================================================

SELECT
    level,
    'Name for ' || level,
    add_months(TO_DATE('01-JAN-2019', 'DD-MON-YYYY'), - trunc(dbms_random.value(1, 4) - 1) * 12)
FROM
    dual
CONNECT BY
    level <= 10000;

--=================================  61  ================================================

CREATE OR REPLACE PROCEDURE reset_seq (
    p_seq_name IN VARCHAR2
) IS
    l_val NUMBER;
BEGIN
    EXECUTE IMMEDIATE 'select '
                      || p_seq_name
                      || '.nextval from dual'
    INTO l_val;
    EXECUTE IMMEDIATE 'alter sequence '
                      || p_seq_name
                      || ' increment by -'
                      || l_val
                      || ' minvalue 0';
    EXECUTE IMMEDIATE 'select '
                      || p_seq_name
                      || '.nextval from dual'
    INTO l_val;
    EXECUTE IMMEDIATE 'alter sequence '
                      || p_seq_name
                      || ' increment by 1 minvalue 0';
END;/

--=================================  62  ================================================

file:/D:/orclLearning/oracle_learning/munish_kumar/lecture_2_bind_variables.sql

--=================================  63  ================================================

select * from members;

--=================================  64  ================================================

select newone.currval, newone.nextval, newone.currval from dual;

--=================================  65  ================================================

select * from emp_details_jeet;

--=================================  66  ================================================

alter sequence mem_seq INCREMENT by -22 minvalue 1;

--=================================  67  ================================================

CREATE OR REPLACE FUNCTION addition (
    num1 NUMBER,
    num2 NUMBER
) RETURN NUMBER AS
    num3 NUMBER;
BEGIN
    num3 := num1 + num2;
    RETURN num3;
END addition;/

--=================================  68  ================================================

CREATE TABLE admin_emp (
    empno     NUMBER(5) PRIMARY KEY,
    ename     VARCHAR2(15) NOT NULL,
    ssn       NUMBER(9),
    job       VARCHAR2(10),
    mgr       NUMBER(5),
    hiredate  DATE DEFAULT ( sysdate ),
    photo     BLOB,
    sal       NUMBER(7, 2),
    hrly_rate NUMBER(7, 2) GENERATED ALWAYS AS ( sal / 2080 ),
    comm      NUMBER(7, 2),
    deptno    NUMBER(3) NOT NULL
--        CONSTRAINT admin_dept_fkey
--            REFERENCES hr.departments ( department_id )
);

--=================================  69  ================================================

INSERT ALL 
INTO MEMBERS ("MemNo", "Name", "Age", proffesion_cd)VALUES(MEM_SEQ.nextval,'SIngh',2, 'DT')
--INTO MEMBERS ("MemNo", "Name", "Age", proffesion_cd)VALUES(MEM_SEQ.nextval,'Jeeta',22, 'IT')
--INTO MEMBERS ("MemNo", "Name", "Age", proffesion_cd)VALUES(MEM_SEQ.nextval,'veer',17, 'IT')
--INTO MEMBERS ("MemNo", "Name", "Age", proffesion_cd)VALUES(MEM_SEQ.nextval,'pratap',89, 'DT')
--Select 100 from dual;

--====================================================
select * from profession;

--=================================  70  ================================================

select to_char(TO_DATE ('November 13, 1992', 'MONTH DD, YYYY'),'MMDDYY') from dual;

--=================================  71  ================================================

CREATE OR REPLACE VIEW emp_details_jeet AS
    SELECT
        e.employee_id,
        e.job_id,
        e.manager_id,
        e.department_id,
        d.location_id,
        l.country_id,
        e.first_name,
        e.last_name,
        e.salary,
        e.commission_pct,
        d.department_name,
        j.job_title,
        l.city,
        l.state_province,
        c.country_name,
        r.region_name
    FROM
        employees   e,
        departments d,
        jobs        j,
        locations   l,
        countries   c,
        regions     r
    WHERE
            e.department_id = d.department_id
        AND d.location_id = l.location_id
        AND l.country_id = c.country_id
        AND c.region_id = r.region_id
        AND j.job_id = e.job_id order by 1;

--=================================  72  ================================================

BEGIN
fibonacci.init(10);
END;/

--=================================  73  ================================================

SELECT
    level,
    'Name for ' || level,
    add_months(TO_DATE('01-JAN-2019', 'DD-MON-YYYY'), - trunc(dbms_random.value(1, 4) - 1) * 12), trunc(dbms_random.value(1, 4) -1)*12
FROM
    dual
CONNECT BY
    level <= 10000;

--=================================  74  ================================================

SELECT * FROM USER_UPDATABLE_COLUMNS WHERE TABLE_NAME LIKE2 'EMP_DETAILS%';

--=================================  75  ================================================

select * from user_indexes;

--=================================  76  ================================================

alter sequence mem_seq INCREMENT by -12;

--=================================  77  ================================================

    INSERT INTO admin_emp (
        empno,
        ename,
        ssn,
        job,
        mgr,
        deptno,
        sal
    ) VALUES (
        98764,
        'Tommy',
        878676432,
        'Developer',
        23672,
        10,
        50000
    );

--=================================  78  ================================================

INSERT ALL 
INTO MEMBERS ("MemNo", "Name", "Age", proffesion_cd)VALUES(MEM_SEQ.nextval,'SIngh',2, 'DT')
--INTO MEMBERS ("MemNo", "Name", "Age", proffesion_cd)VALUES(MEM_SEQ.nextval,'Jeeta',22, 'IT')
--INTO MEMBERS ("MemNo", "Name", "Age", proffesion_cd)VALUES(MEM_SEQ.nextval,'veer',17, 'IT')
--INTO MEMBERS ("MemNo", "Name", "Age", proffesion_cd)VALUES(MEM_SEQ.nextval,'pratap',89, 'DT')
Select 100 from dual;

--=================================  79  ================================================

CREATE OR REPLACE PROCEDURE reset_seq (
    p_seq_name IN VARCHAR2
) IS
    l_val NUMBER;
BEGIN
    EXECUTE IMMEDIATE 'select '
                      || p_seq_name
                      || '.nextval from dual'
    INTO l_val;
    EXECUTE IMMEDIATE 'alter sequence '
                      || p_seq_name
                      || ' increment by -'
                      || l_val
                      || ' minvalue 1';
    EXECUTE IMMEDIATE 'select '
                      || p_seq_name
                      || '.nextval from dual'
    INTO l_val;
    EXECUTE IMMEDIATE 'alter sequence '
                      || p_seq_name
                      || ' increment by 1 minvalue 1';
END;/

--=================================  80  ================================================

SELECT
    level,
--    'Name for ' || level,
    to_char(add_months(TO_DATE('01-JAN-2019', 'DD-MON-YYYY'), - trunc(dbms_random.value(1, 4) - 1) * 12),'RRRR') mon
FROM
    dual
CONNECT BY
    level <= 10000;

--=================================  81  ================================================

select listagg(chr(level+64) ,',') within group(order by null) from dual connect by level<=26;

--=================================  82  ================================================

CREATE TABLE members (
    "MemNo"         NUMBER,
    "Name"          VARCHAR2(5),
    "Age"           NUMBER NOT NULL,
    "PROFFESION_CD" VARCHAR2(50),
    "REC_DT_ADDED"  DATE DEFAULT ( sysdate ),
        "DAYS"          NUMBER GENERATED ALWAYS AS ( "Age" * 30 )
);

--=================================  83  ================================================

select * from admin_emp;

--=================================  84  ================================================

SELECT
    level,
    'Name for ' || level,
    add_months(TO_DATE('01-JAN-2019', 'DD-MON-YYYY'), - trunc(dbms_random.value(1, 4) - 1) * 12), trunc(dbms_random.value(1, 4) -1)
FROM
    dual
CONNECT BY
    level <= 10000;

--=================================  85  ================================================

update allemps set commission_pct=2;

--=================================  86  ================================================

SELECT
    level,
    to_char(sysdate,'RRRR')
    FROM
    dual
CONNECT BY
    level <= 10000;

--=================================  87  ================================================

select mon, count(1) from (SELECT
--    level,
--    'Name for ' || level,
    to_char(add_months(TO_DATE('01-JAN-2019', 'DD-MON-YYYY'), - trunc(dbms_random.value(1, 4) - 1) * 12),'RRRR') mon
FROM
    dual
CONNECT BY
    level <= 10000) group by mon;

--=================================  88  ================================================

select ora_sysevent from dual;

--=================================  89  ================================================

CREATE TABLE members (
    "MemNo"        NUMBER
--    "Name"         VARCHAR2,
--    "Age"          NUMBER NOT NULL,
--    "WORK"         VARCHAR2,
--    "REC_DT_ADDED" DATE DEFAULT ( sysdate ),
--        "DAYS"         NUMBER GENERATED ALWAYS AS ( "Age" * 30 )
);

--=================================  90  ================================================

select * from hr.departments;

--=================================  91  ================================================

CREATE OR REPLACE PACKAGE fibonacci AS
--=========
    PROCEDURE init (
        num1 NUMBER
    );
--========
    FUNCTION addition (
        num1 NUMBER,
        num2 NUMBER
    ) RETURN NUMBER;

END fibonacci;

--=================================  92  ================================================

ALTER TABLE members ADD CONSTRAINT mempk PRIMARY KEY ( "MemNo" );

--=================================  93  ================================================

select to_char(TO_DATE ('November 13, 1992', 'MONTH DD, YYYY'),'MON') from dual;

--=================================  94  ================================================

grant all PRIVILEGES to demo;
commit;

--=================================  95  ================================================

BEGIN
    reset_seq('MEM_SEQ');
    commit;
END;/

--=================================  96  ================================================

alter sequence mem_seq INCREMENT by -18 minvalue 1;

--=================================  97  ================================================

--========================================== Triggers start here ===============================================

/*
Syntax:
    
    create or replace trigger <trigger name> 
    {BEFORE | AFTER | INSTEAD OF}                   --> any one
    {INSERT or DELETE or UPDATE}                    --> any one
    {OF <column name>}                              --> Optional, it will have the trigger on particular column of that table
    {on <table name>}                               --> Table name
    {REFRENCE OLD AS o NEW AS n}                    --> Optional, will tell us whether the old value and new values are same
    [FOR EACH ROW]                                  --> Optional , to specify ROW LEVEL Trigger
    BEGIN           
        executables
    EXCEPTION
    END;
    /

*/



--==============================  First trigger (before update statement level)  ===============================

CREATE OR REPLACE TRIGGER my_trigger_b_u_s BEFORE
    UPDATE ON emps
BEGIN
    dbms_output.put_line('******************* BEFORE UPDATE STATEMENT LEVEL *******************');
END;
/




--================================  Second trigger (BEFORE UPDATE ROW LEVEL) ===================================

CREATE OR REPLACE TRIGGER my_trigger_b_u_r BEFORE
    UPDATE ON emps FOR EACH ROW
BEGIN
    dbms_output.put_line('******************* BEFORE UPDATE ROW LEVEL *******************');
END;
/



--==============================  Third trigger (AFTER UPDATE ROW LEVEL )========================================

CREATE OR REPLACE TRIGGER my_trigger_a_u_r AFTER
    UPDATE ON emps FOR EACH ROW
BEGIN
    dbms_output.put_line('******************* AFTER UPDATE ROW LEVEL *******************');
END;
/



--===============================  Fourth trigger (AFTER UPDATE STATENT LEVEL ) =================================

CREATE OR REPLACE TRIGGER my_trigger_a_u_s AFTER
    UPDATE ON emps
BEGIN
    dbms_output.put_line('******************* AFTER UPDATE STATENT LEVEL *******************');
END;
/
commit;

--=================================  98  ================================================

select * from profession;

--=================================  99  ================================================

SELECT * FROM USER_UPDATABLE_COLUMNS WHERE TABLE_NAME LIKE 'EMP_DETAILS%';
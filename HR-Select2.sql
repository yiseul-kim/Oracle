/* Select 2*/

/* �Լ� ��� �ϱ� */

/* 
    ����Ŭ���� ������ �ִ� �پ��� �⺻ ������ �Լ� 
    1. ���� ó�� �Լ� 
    2. ���� ó�� �Լ�
    3. ��¥ ó�� �Լ�
    4. ��ȯ �Լ� 
    5. �Ϲ� �Լ� 
*/


/*
    1. ���� �Լ� :
            UPPER : �빮�ڷ� ��ȯ ���ִ� �Լ�
            LOWER : �ҹ��ڷ� ��ȯ ���ִ� �Լ� 
            INITCAP : ù�ڸ� �빮�ڷ� ��ȯ ���ִ� �Լ�             
*/

/*
    dual : ������ ���̺� , ���� �Լ��� ó�� �ϱ� ���� �������� ���� ���̺�, 
*/

Select UPPER ('Oracle mania')
from dual; /* ���� ������ ��� ���� ������ ���̺� */

Select UPPER ('Oracle mania') as �빮��
from dual;

Select LOWER ('Oracle mania') as �ҹ��� 
from dual;

Select INITCAP ('oracle mania') as ù�ڸ��빮��
from dual;

select ename as "�̸�(����)", LOWER (ename) as �ҹ���, INITCAP(ENAME) AS ù�ڸ��빮��
from employee;

--
SELECT *
FROM EMPLOYEE;

SELECT *
FROM EMPLOYEE
WHERE ENAME = UPPER('ward');  -- WARD �� �ִµ� �ҹ��ڶ� �˻� �ȵ� �빮�ڷ� ��ȯ�� �˻�

/*
    ������ ���̸� ó���ϴ� �Լ� 
    LENGTH : ���ڼ��� ��ȯ (�ѱ��� 1byte)
    LENGTHB : ���ڼ��� ��ȯ (�ѱ��� 3byte)�� ó��     <== UTF-8
*/
-- ���ڼ��� ���� 
select Length ('Oracle mania') as ���ڼ�
from dual;

--�ѱ� 1�ڴ� 3byte�ε� Length�� 1�ڷ� ��� 
select length ('����Ŭ �ŴϾ�') as ���ڼ� 
from dual;

select Lengthb('Oracle mania') as ���ڼ� 
from dual;

-- LENGTHB: �ѱ� 1�ڸ� 3byte�� ó�� 
select lengthB ('����Ŭ �ŴϾ�') as ���ڼ� 
from dual;

/*
    char, varchar2 => 1byte / nchar, nvarchar2 => 3byte
    char(6) : ���� : 6��, �ѱ� : 2�� ����       <== ������ �ڸ����� ������ ���  : �ֹι�ȣ(13), �����й�ȣ
    varchar2(6) : ���� : 6��, �ѱ� : 2�� ���� <== ������ �ڸ����� �˼� ���� ��� : �ּ�, �����ּ� ��  
    nchar(6) : �����ڵ�(�ѱ�, �Ϻ���, �߱���) : 6�� ����     <==
    nvarchar2(6) : �����ڵ�(�ѱ�, �Ϻ���, �߱���) : 6�� ����  
*/

-- Test01 ���̺� ���� 
create table test01 (
    name1 char(6)not null , 
    name2 varchar2(6) null,
    name3 nchar(6) null,
    name4 nvarchar2(6) null
    );
    
drop table test01;

desc test01;


-- test01 ���̺� ���ֱ� 
-- name1, name2 : ���� 6��, �ѱ� 2�� 
-- name3, name4 : ���� 6��, �ѱ� 6��

insert into test01 ( name1, name2, name3, name4)
values ('abcdef', 'hijklm', '�����ٶ󸶹�', null);

insert into test01 ( name1, name2)
values ('����', '����');


select * from test01;

-- ���� ���̺��� ���ڼ��� �о���� 
select *from employee;
select ename, length(ename) as �̸��Ǳ��ڼ�
from employee;

/*
        CONCAT : ���ڿ��� ���� �����ִ� �Լ�
        SUBSTR : ���ڸ� �߶󳻴� �Լ�, �ѱ� 1�ڸ� 1byte�� ó����. 
        SUBSTRB : ���ڸ� �߶󳻴� �Լ�, �ѱ� 1�ڸ� 3byte�� ó����. 
        INSTR: Ư�� ������ ��ġ���� ��ȯ (�ѱ� 1byte) 
        INSTRB : Ư�� ������ ��ġ���� ��ȯ (�ѱ� 3byte)
        LPAD : ���� �ڸ����� �Է¹ް� �������� Ư����ȣ�� ä�� (����)
        RPAD : ���� �ڸ����� �Է¹ް� �������� Ư����ȣ�� ä�� (������)
        TRIM : ������ �����ϴ� �Լ� (��, ��)
        RTRIM : �������� ������ �����ϴ� �Լ�
        LTRIM : ������ ������ �����ϴ� �Լ�
        
*/`


SELECT 'Oracle', 'mania',
            concat ('Oracle', 'mania')
from dual ;            

select * from employee;

select * from employee;

select ename, job, concat (ename, job) as �÷����� from employee;

-- substr : ���ڿ��� �߶���� �Լ� : substr(�÷� , 4,3) -- �÷��� 4��° �ڸ����� 3�ڸ� �߶�ͼ� ���
select substr('Oracle mania', 4,3)
from dual;

select substr('����Ŭ �ŴϾ�', 4,3)
from dual;

select substr('Oracle mania', 5,3)
from dual;

select substrb('����Ŭ �ŴϾ�', 4,3)
from dual;

select substrb('Oracle mania', 4,3)
from dual;

-- ���� ���̺��� ���
select * from employee;

select hiredate, substr( hiredate, 1,2 ) as ���������
from employee;

select hiredate, substr( hiredate, 1,2 ) as ��������� , substr( hiredate, 4,2 ) as �������,
substr( hiredate, 7,2 ) as �ϸ����
from employee;

-- INSTR : Ư�� ������ ��ġ�� ��� 
-- Oracle mania ���� a��� �ܾ �� �ڸ��� : 3
SELECT INSTR ('Oracle mania', 'a')
from dual; 

-- 4��° �ڸ� ���ĺ��� �˻� : a�� �� �ڸ���
SELECT INSTR ('Oracle mania', 'a', 4 )
from dual; 

--��� �̸� �÷��� 'k' ���ڰ� �� �ڸ����� �˻� : �˻��� ���� �ʴ� ��� : 0
select ename, INSTR(ENAME, 'K')
FROM EMPLOYEE;

--LPAD : �÷� , �ڸ����� �ø� , '*' : Ư�����ڸ� ���ʿ� ���
-- RPAD : �÷�, �ڸ����� �ø�, '*' : Ư�����ڸ� �����ʿ� ��� 
SELECT SALARY, LPAD(SALARY, 10,'*'), RPAD(SALARY, 10, '*')
FROM EMPLOYEE;


-- �ֹι�ȣ(13�ڸ�) : 230627-1234567  : ��ü : 14�ڸ� , 230627-1******
    -- substr�� ����ؼ� �߶󳻰�, RPAD�� ����ؼ� �������� *�� ó�� ���
    -- LENGTH�Լ��� ���
    -- DUAL ���̺��� �����ؼ� ��� 
    select * from employee;
    
SELECT '230627-1234567' AS �ֹι�ȣ, 
                RPAD(SUBSTR('230627-1234567',1,8), 
                LENGTH('230627-1234567'), '*') AS �ֹι�ȣ2
FROM DUAL;

SELECT * FROM EMPLOYEE;

-- �̸�, �Ի��� �⵵��** 
SELECT ENAME AS �̸�, RPAD(SUBSTR(HIREDATE,1,6),
                LENGTH(HIREDATE),'*') AS �Ի���
FROM EMPLOYEE;

-- TRIM�� ����ؼ� ���� ����  : DATABASE�� �����ϱ� �� CLIENT���� ���ڿ��� �յ� ������ ������ DB�� ����
SELECT  '           Oracle Mania         ' as ����, 
        RTRIM('           Oracle Mania         ') AS �����ʰ�������,
        LTRIM('           Oracle Mania         ') AS ���ʰ�������,
        TRIM('           Oracle Mania         ') AS ���ʰ�������
FROM DUAL;

/* 2. �����Լ� 
        ROUND : Ư�� �ڸ������� �ݿø� ó�� �ϴ� �Լ� <== ����� �Ҽ��� �ڸ��� �ݿø��ؼ� ó��
                        5�̻��� �ݿø�, 5���ϴ� ����.
        ROUND (���) : �Ҽ��� ���ڸ����� �ݿø�.
        ROUND (���, �Ҽ����ڸ���) : 
                    - ����϶� : �Ҽ��� �������� ���������� �̵��ؼ� �ݿø�, ���ڸ��� �ڿ��� �ݿø� <== ����
                    - �����϶� : �Ҽ��� �������� �������� �̵��ؼ� �ݿø�, ���ڸ����� �ݿø�
                    
        TRUNC : Ư�� �ڸ������� �߶� ����
        MOD : ������ ���� ��ȯ    
*/

SELECT 98.7654 AS ����, 
        ROUND (98.7654),                 --99
        ROUND(98.7654, 2),                 -- 99.77 �Ҽ��� 2°�ڸ����� �ݿø�
        ROUND(98.7654, 3),                 -- 99.77 �Ҽ��� 3°�ڸ����� �ݿø�
        ROUND(98.7654, -2),              -- 99���� �ݿø� 100
        ROUND(98.7654, -1),              -- 99���� �ݿø� 100
        ROUND(98.7654,-3)              -- 0
FROM DUAL ;

SELECT ROUND(1234/34,2)
FROM DUAL;

-- �� �ٷμҵ漼�� ��� : ���� * 0.033
SELECT SALARY, ROUND(SALARY*0.033, 1) AS �ٷμҵ漼
FROM EMPLOYEE;

--TRUNC : Ư�� �ڸ����� ���� 
SELECT TRUNC(98.7654),
        TRUNC(98.7654, 2),
        TRUNC(98.7654, -1),
        TRUNC(98.7654, 1)
FROM DUAL;

-- MOD (���, ������ ��) : ���������� ���

-- 31�� ����� �� ��� , ������ ��� 
SELECT ROUND ( 31/2 ) AS ����� , MOD(31, 2) AS ����������� 
FROM DUAL;


1. ���� �����ڸ� ����Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ������� ����̸�, 
�޿�, �λ�� �޿��� ����ϼ���. 
SELECT ENAME ����̸�, SALARY �޿�, SALARY+300 AS �λ�ȱ޿�
FROM EMPLOYEE;

2. ����� �̸�, �޿�, ���� �� ������ ������ ���� ���������� ��� �Ͻÿ�. 
    ���� �� ������ ���޿� 12�� ������ $100�� �󿩱��� ���ؼ� ��� �Ͻÿ�.
SELECT ENAME �̸�, SALARY �޿�, 
            SALARY*12+100+NVL(COMMISSION,0) AS �����Ѽ���
FROM EMPLOYEE
ORDER BY �����Ѽ��� DESC;

3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� ������ ���� ���������� ����ϼ���. 
SELECT ENAME �̸�, SALARY �޿� 
FROM EMPLOYEE
WHERE SALARY >=2000
ORDER BY SALARY DESC;


4. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����ϼ���. 
SELECT ENAME �̸�, DNO �μ���ȣ
FROM EMPLOYEE
WHERE ENO=7788;

5. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ��� �ϼ���. 
SELECT ENAME �̸�, SALARY �޿�
FROM EMPLOYEE
WHERE SALARY<=1999 OR SALARY>=3001;

6. 1981�� 2�� 20�Ϻ��� 81�� 5�� 1�� ������ �Ի��� ����� �̸� ������, �Ի����� ����Ͻÿ�
SELECT ENAME �̸�, JOB ������, HIREDATE �Ի���
FROM EMPLOYEE
WHERE HIREDATE BETWEEN '81/02/20' AND '81/05/01';

7. �μ���ȣ�� 20�� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ� �̸��� ����(��������)���� ����Ͻÿ�. 
SELECT ENAME �̸�, DNO �μ���ȣ
FROM EMPLOYEE
WHERE DNO=20 OR DNO=30
ORDER BY ENAME DESC;

8. ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� ����ϵ� �̸��� ������������ ����ϼ���. 
SELECT ENAME �̸�, SALARY �޿�, DNO �μ���ȣ 
FROM EMPLOYEE
WHERE DNO=20 OR DNO=30 AND (SALARY BETWEEN 2000 AND 3000)
ORDER BY ENAME ASC;

9. 1981�⵵ �Ի��� ����� �̸��� �Ի����� ��� �Ͻÿ� ( like �����ڿ� ���ϵ� ī�� ��� : _ , % )
SELECT ENAME AS �̸�, RPAD( SUBSTR (HIREDATE,1,3), LENGTH(HIREDATE),'*' ) AS �Ի���
FROM EMPLOYEE
WHERE HIREDATE LIKE '81%';

10. �����ڰ� ���� ����� �̸��� �������� ����ϼ���.
SELECT ENAME �̸�, JOB ������
FROM EMPLOYEE
WHERE MANAGER IS NULL;

11. Ŀ�Լ��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� 
�޿��� Ŀ�Լ��� �������� �������� �����Ͽ� ǥ���Ͻÿ�.
SELECT ENAME �̸�, SALARY �޿�, COMMISSION Ŀ�̼�
FROM EMPLOYEE
WHERE COMMISSION IS NOT NULL
ORDER BY SALARY DESC, COMMISSION DESC;

12. �̸��� ����° ������ R�� ����� �̸��� ǥ���Ͻÿ�.
SELECT ENAME �̸�
FROM EMPLOYEE
WHERE ENAME LIKE '__R%';

13. �̸��� A �� E �� ��� �����ϰ� �ִ� ����� �̸��� ǥ���Ͻÿ�.
SELECT ENAME �̸�
FROM EMPLOYEE
WHERE ENAME LIKE '%A%' AND ENAME LIKE '%E%'

14. ��� ������ �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸缭 
    �޿��� $1600, $950, �Ǵ� $1300 �� �ƴ� ����� �̸�, ������, �޿��� ����Ͻÿ�.
SELECT ENAME �̸�, JOB ������, SALARY �޿� 
FROM EMPLOYEE
WHERE (JOB='CLERK' OR JOB='SALESMAN') AND SALARY NOT IN (1600,950,1300);

15. Ŀ�̼��� $500�̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����Ͻÿ�.  
SELECT ENAME �̸�, SALARY �޿�, COMMISSION Ŀ�̼�
FROM EMPLOYEE
WHERE COMMISSION >= 500;

SELECT* FROM EMPLOYEE;

-- JOB ASC, ENAME DESC
-- �ΰ� �̻��� �÷��� ���ĵɶ�, JOB �÷��� ������, JOB �÷��� �ߺ��� ������ ���ؼ� ENAME DESC���ĵ�
SELECT*
FROM EMPLOYEE
ORDER BY JOB ASC;

SELECT * 
FROM EMPLOYEE
ORDER BY JOB ASC, ENAME DESC;


/* ��¥ �Լ� 
    SYSDATE:���� �ý����� ��¥�� ��� �ϴ� �Լ�
    MONTHS_BETWEEN : �� ��¥ ������ ���� ���� ���
    ADD_MONTHS : 
    NEXT_DAY : Ư�� ��¥���� �ʷ��ϴ� ������ ���ڷ� �޾Ƽ� ������ �����ϴ� ��¥�� ���
    LAST_DAY ; ���� ������ ��¥�� ��ȯ
    ROUND ; ��¥�� �ݿø��ϴ� �Լ�, 15�� �̻� : �ݿø�, 15�̸� : ����
    TRUNC : ��¥�� �߶󳻴� �Լ�
*/

-- ���� �ý����� ��¥�� ���: ��/��/��
SELECT SYSDATE
FROM DUAL;

SELECT SYSDATE -1 AS ����, SYSDATE  AS ����, SYSDATE +1 AS ����
FROM DUAL;

SELECT * FROM EMPLOYEE;

-- �Ի��Ϸκ��� ���� ��¥���� �ٹ��� ��� 
SELECT ENAME AS �̸�, HIREDATE �Ի���, ROUND(SYSDATE-HIREDATE) AS �ѱٹ��ϼ�
FROM EMPLOYEE;

-- �Ի��Ϸκ��� 1000�� ���� ������ ��¥�� ���.
SELECT ENAME �̸�, HIREDATE �Ի���, HIREDATE+1000 �Ի�õ�ϳ�¥
FROM EMPLOYEE;

-- Ư�� ��¥���� ���� �������� ���
SELECT HIREDATE AS ����, TRUNC(HIREDATE, 'MONTH'), ROUND(HIREDATE, 'MONTH')
FROM EMPLOYEE;

-- MONTHS_BETWEEN : �� ��¥ ������ ���� ���� ���
-- �Ի��Ϸ� ���� ��������� �ٹ��� �������� ��� 
SELECT ENAME, HIREDATE, 
             TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS "�ٹ� ������"
FROM EMPLOYEE;

-- DATE( ��¥Ÿ��)
-- ADD_MONTHS (��¥, ������) : ��¥�� �������� ���ϴ� �Լ�
-- ���� ��¥�� 100������ ���� ��¥
SELECT ADD_MONTHS (SYSDATE, 100) AS "100������" , 
                SYSDATE+100 AS "100����"
FROM DUAL;

-- �Ի� ��6������ ���� ������ ���
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 6) AS "�Ի��� 6���� ��"
FROM EMPLOYEE;

-- NEXT_DAY: Ư����¥���� ������ ��ǲ���� �־ �����ϴ� ������ ��¥�� ���
SELECT NEXT_DAY( SYSDATE, '�ݿ���'),NEXT_DAY( SYSDATE, '������'),
                NEXT_DAY( SYSDATE, '������'), NEXT_DAY( SYSDATE, '�����')
FROM DUAL;

-- LAST_DAY (DATE) : DATE ���� ������ ��¥�� ��� (30�� OR 31��)
SELECT SYSDATE AS ���ó�¥, LAST_DAY(SYSDATE) AS ��������¥
FROM DUAL;

-- ������̺��� �Ի����� ������ ��¥�� ���
SELECT HIREDATE AS �Ի���, LAST_DAY(HIREDATE)
FROM EMPLOYEE;

/* ���� ��ȯ �Լ�
    TO_CHAR : ��¥, �������� ���������� ��ȯ
    TO_DATE : �������� ��¥������ ��ȯ
    TO_NUMBER : �������� ���ڷ� ��ȯ
*/

-- TO_CHAR (DATE, 'YYYYMMDD') : ��¥������ 'YYYYMMDD' �������� �̾ƿͼ� CHAR �������� ��ȯ
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD')
FROM DUAL;




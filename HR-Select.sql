/* Select �� */

/* ���̺��� ��� �÷��� ���*/

SELECT * FROM employee;     -- ��� ������ ����� ���̺� 

SELECT * FROM department;       -- ����� ���� �μ� ������ ����

SELECT * FROM salgrade;     -- ������ ���� ����� ����

/* Employee ���̺��� �÷�(�ʵ�) ����
    
    ENO : �����ȣ
    ENAME : ����� 
    JOB : ��å 
    MANAGER : ���� ��� (���)
    HIREDATE : �Ի�����
    SALARY : ����
    COMMISSION : ���ʽ� `
    DNO : �μ���ȣ 
*/

/* DEPARTMENT ���̺��� �÷�(�ʵ�) ����
    DNO : �μ���ȣ 
    DNAME : �μ��̸�
    LOC : �μ� ����
*/

/* SALGRADE ���̺��� �÷�(�ʵ�) ����
   GRADE : ���
   LOSAL : �ּ� ����
   HISAL : �ִ� ���� 
*/

/* SELECT ���� : ��� 

SELECT �÷��� 
FROM ���̺��[��]
WHERE ����
GROUP BY �׷������÷�
HAVING ����(GROUPING�� ����� ����) 
ORDER BY �÷��� (������ �÷���)

*/

-- �⺻ SELECT 
SELECT * FROM employee;

-- Ư�� �÷��� ��� �ϱ�

/*�̸��� JAMES�� ����� �̸��� ��å, �Ի��, �μ���ȣ ��� �ϱ�
SELECT, SELECT, FROM, FROM, WHERE, WHERE
�÷��� ����� ��(���ڵ�)�� �����ö� ��ҹ��ڸ� ������. */

SELECT ENAME �Ϲ�, JOB ��å, HIREDATE �Ի�����, DNO �μ���ȣ
FROM employee
WHERE ENAME = 'HAMES';

-- WHERE ������ ������ ���
SELECT *
FROM employee
WHERE ENAME = 'JAMES' OR ENAME = 'SMITH';

-- WHERE ������ IN ������ ��� (=OR)
SELECT *
FROM employee
WHERE ENAME IN ('JAMES', 'SMITH');

-- WHERE ������ �� ������ ����ϱ�: >, <, >=, <=
-- ������ 1500�̻��� ����ڸ� ���
SELECT *
FROM employee
WHERE salary>=1500 ;

-- ������ 1500 �̻� �̰� �μ��� 30�� ����ڸ� ���
SELECT *
FROM employee
WHERE salary>=1500 AND DNO=30;

-- ���̺��� �÷��� �ڷ��� �� ���̺� ���� Ȯ�� 
-- NUMBER : oracle���� ����, �Ǽ�
    /*
        NUMBER(4) : ���� : 4 : �ڸ������� ���� �� �ִ�. 
        NUMBER(7,2) : �Ǽ� ( ��ü 7�ڸ�, �Ҽ������� 2�ڸ� )
        
        CHAR(10) : ���� 10BYTE  <== �ڸ����� �˼� �ִ� ���
                VARCHAR2���� ������ ������, �ϵ� ���� ���� �ִ�. 
                �ֹι�ȣ(13), ��й�ȣ 4�ڸ��� ����. 
                
        VARCHAR2(10) : ���� 10BYTE        <== VARCHAR2�� ���, <== �ڸ����� �˼� ���� ���
                CHAR ���� ������ ���������� �ϵ� ������ �������� �ʴ´�.
                
        DATA : ��¥�� �����ϴ� ������ Ÿ��
                
    */

-- ���̺� ���� Ȯ��

DESC EMPLOYEE;

SELECT * FROM EMPLOYEE;

-- NUMBER : ����, �Ǽ�, ���� �����ö� ''�� ���̸� �ȵ�.
-- CHAR, VARCHAR2, DATE : �� �����ö� ''�� �ٿ�����.

-- ��å(JOB)�� �������(SALESMAN)�̰� ������ 1500�̻� 3000 �̸��� ����� �̸��� ����� ����
SELECT ename
FROM employee
WHERE job='SALESMAN' AND ( salary >=1500 AND salary<=3000 );

-- NULL�� �˻� : ���� : =�� ����ϸ� �ȵ�, IS NULL 
    -- NULL : 0�� �ƴϰ� ����ִ� ���� 
-- ���ʽ�(COMMISSION) �� ���� ��� ������ ���
SELECT *
FROM employee
WHERE commission IS NULL ;

-- ���ʽ�(COMMISSION)�� �ִ� ��� ������ ��� : NULL�� �ƴѰ͸� �˻�
SELECT *
FROM employee
WHERE COMMISSION IS NOT NULL ;

-- ���(���) MANAGER�� ���� ��� ���� ���
SELECT * FROM EMPLOYEE;

SELECT * 
FROM EMPLOYEE
WHERE MANAGER IS NULL ;

-- ��¥ �˻� �ϱ� 
--�Ի� ��¥�� 81/02/20�ϳ� �Ի��� ����� �̸��� ��å�� ����, �Ի����� ��� 
select ename as �̸�, job as ��å, salary ����, hiredate �Ի���
from employee
where hiredate = '81/02/20';

-- 81�⵵�� �Ի��� ����ڸ� ��� 
select *
from employee
where hiredate >='81/01/01' and  hiredate <= '81/12/31';        --��¥ �÷� : date


-- where ���� like������ ��� <== �÷��� Ư�� �ܾ �˻� �Ҷ� ��� : �Խ���, �̸�, �۳���, ��¥�� �˻�
        -- ���ڿ��� �ܾ �˻��Ҷ� ��� 
        -- ���ϵ� ī�� �ĺ��� ���- % : � ���ڰ� �͵� �������)
    
-- �̸��� A�� ���۵Ǵ� ����� �˻� 
select *
from employee
where ENAME LIKE 'A%';

select HIREDATE 
FROM EMPLOYEE
WHERE HIREDATE LIKE '81%';

-- ��å (JOB) �÷����� AG ��� �ܾ ���� ��� ������ ��� 

select *
from employee
WHERE JOB LIKE '%AG%';

/* �ߺ� �����ϱ� : DISTINCT */

 -- �츮 ȸ���� �����ϴ� ��å�� ��� 
 
select DISTINCT JOB
from employee ;



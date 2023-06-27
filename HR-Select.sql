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

/* �ߺ� �����ϱ� : DISTINCT, �ٸ� �÷��� �����Ǹ� ���� �߻�, ���� �÷����� ���  */

 -- �츮 ȸ���� �����ϴ� ��å�� ��� 
 
select DISTINCT JOB
from employee ;

-- �츮 ȸ�翡 �����ϴ� �μ��� ��� 

SELECT DISTINCT DNO
FROM EMPLOYEE;

/* �����ؼ� ��� : ORDER BY �÷��� ASC[DESC] */
-- ��� ���̺��� �̸� �÷��� �������� ���� ���� ����
SELECT * 
FROM EMPLOYEE
ORDER BY ENAME DESC;

-- ��� ��ȣ�� �������� �������� ����
SELECT * 
FROM EMPLOYEE
ORDER BY ENO ASC;

-- �ֱ� �Ի��� ������� ��� 
 SELECT * 
FROM EMPLOYEE
ORDER BY HIREDATE DESC;

-- �޿��� ���� ������� ����ϵ� �����, ��å, �޿� �μ���ȣ�� ��� �϶�. 
SELECT ENAME �����, JOB ��å, salary �޿�, DNO �μ���ȣ
FROM EMPLOYEE
ORDER BY salary DESC;

-- NVL,  �Լ� ����ϱ� : NULL�� 0���� ó���ϴ� �Լ�
    -- + /- /* / / + NULL�� = NULL 
    -- NULL�� ����ִ� ������. -�� �ƴ�. 
    -- NVL (COMMISSION, 0) : COMMISSION �÷��� NULL�� ������ ��� 0���� �ٲپ��
    
    
-- NVL �Լ��� ������� �ʰ� ��ü ������ ���ϴ� �÷��� ��� 
SELECT *
FROM employee

-- ��ü ������ ����ؼ� �̸�, ��å, ����, ���ʽ�, �ѿ���
-- �� ���� = (����*12)+���ʽ�(COMMISSION) 
SELECT ENAME �̸�, JOB ��å, SALARY ����, COMMISSION ���ʽ�, 
            (SALARY*12)+COMMISSION AS �ѿ���
FROM employee

-- NVL�Լ��� ����ؼ� COMMISSION �÷��� NULL�� 0���� ��ġ�� ���
-- ����� ���� ��������
SELECT ENAME �̸�, JOB ��å, SALARY ����, COMMISSION ���ʽ�, 
            (SALARY*12)+NVL(COMMISSION,0) AS �ѿ���
FROM employee
ORDER BY �ѿ��� DESC;

-- WHERE �÷��� BETWEEN A AND B : A �̻� B����
-- ������ 1500�̻� 3000 ������ �����, ��å, ����(�޿�), �Ի����� ����ϵ� �ֱ� �Ի��� ����ڷ� �����ؼ� ���
SELECT *
FROM employee
WHERE SALARY >= 1500 AND SALARY <=3000
ORDER BY HIREDATE DESC;
-- �� �Ʒ� ���� 
SELECT *
FROM employee
WHERE SALARY BETWEEN 1500 AND 3000
ORDER BY HIREDATE DESC;

/* ���ڵ� ���� ��� : COUNT <== �Խ��ǿ��� DB�� ��ü ���ڵ� ���� �����ͼ� ����¡ ó���� �ϱ� ���ؼ� ��� */
--  COUNT �Լ��� NULL�� ī��Ʈ ���� �ʴ´�. 
-- Ư�� �÷��� ����� ���� ��, NULL�� ī��Ʈ ���� ������ ���� 
SELECT COUNT(*) "��ü ���ڵ��"
FROM EMPLOYEE;

-- not null �÷��� conut �ؾ� ��ü���ڵ带 ����� ��� �� �� �ִ�. 
select count(eno)
from employee;

-- Ư�� �÷��� ī��Ʈ �Ҷ� null ���� �÷��� ��� null�� ī��Ʈ ���� ����.
SELECT COUNT(COMMISSION) AS "���ڵ��"
FROM EMPLOYEE;

-- employee���̺��� �÷��� null ��� ����, �ڷ��� (number(n), char(n), varchar2(n), date ) 
desc employee;

SELECT *
FROM EMPLOYEE

-- 5�� 45�б��� �Ϸ� 
<����1> �÷� �˸��(��Ī) , commission(���ʽ�) �÷��� null �� ���� ����ϵ� �����ȣ, ����̸�,�Ի糯¥�� ��� 
SELECT eno �����ȣ, ename ����̸�, hiredate �Ի糯¥
FROM EMPLOYEE
WHERE COMMISSION IS NULL;

<����2> dno(�μ���ȣ) �� 20�̰� �Ի糯¥�� 81�� 4�� ���� ����� �̸��� ��å�� �Ի糯¥�� ���
SELECT ENAME �̸�, JOB ��å, HIREDATE �Ի糯¥ 
FROM EMPLOYEE
WHERE DNO=20 AND HIREDATE>='81/04/01';

<����3> ������ ����ؼ� �����ȣ, ����̸�, ����, ���ʽ�, ��ü ������ ���
SELECT ENO �����ȣ, ENAME ����̸�, SALARY ����, COMMISSION ���ʽ�,
            (SALARY*12)+NVL(COMMISSION,0) AS "��ü ����"
FROM EMPLOYEE;

<����4> commission�� null �� �ƴ� ������� �̸��� ��� 
SELECT ENAME ������̸�
FROM EMPLOYEE
WHERE COMMISSION IS NOT NULL;

<����5> manager (���޻��) 7698 �� ����̸��� ��å�� ���.
SELECT ENAME ����̸�, JOB ��å
FROM EMPLOYEE
WHERE MANAGER=7698;

<����6> ������ 1500 �̻��̰� �μ��� 20�� ����� ����̸��� �Ի糯¥, �μ���ȣ, ������ ���
SELECT ENAME ����̸�, HIREDATE �Ի糯¥, DNO �μ���ȣ, SALARY ����
FROM EMPLOYEE
WHERE SALARY>=1500 AND DNO=20;

<����7> �Ի糯¥�� 81�� 4�� 1�� �̻��̰� 81�� 12�� ���ϱ����� ��� �̸��� �Ի糯¥�� ���
SELECT ENAME �̸�, HIREDATE �Ի糯¥
FROM EMPLOYEE
WHERE HIREDATE BETWEEN '81/4/1' AND '81/12/31';


<����8> ��å(job) salesman �̸鼭 ������ 1500 �̻��̸鼭 �μ���ȣ�� 30�� ������� ���
SELECT ENAME �����
FROM EMPLOYEE
WHERE JOB='SALESMAN' AND SALARY>=1500 AND DNO=30;

<����9> ������ 1500 �����̸鼭 �μ���ȣ�� 20�� �� �ƴ� ����̸���, ���ް�, �μ���ȣ�� ���
SELECT ENAME ����̸�,SALARY ����,DNO �μ���ȣ
FROM EMPLOYEE
WHERE SALARY<=1500 AND DNO <> 20;

<����10> �����ȣ(eno) �� 7788, 7782 �� �μ���ȣ�� �̸��� ��å�� ��� 
SELECT DNO �μ���ȣ, ENAME �̸�,  JOB ��å
FROM EMPLOYEE
WHERE ENO=7788 OR ENO=7782;













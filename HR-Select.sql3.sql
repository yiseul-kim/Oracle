/* SELECT 3 */

/* ���� ��ȯ �Լ�
    TO_CHAR : ��¥, �������� ���������� ��ȯ
    TO_DATE : �������� ��¥������ ��ȯ
    TO_NUMBER : �������� ���ڷ� ��ȯ
*/

-- TO_CHAR (DATE, 'YYYYMMDD') : ��¥������ 'YYYYMMDD' �������� �̾ƿͼ� CHAR �������� ��ȯ


/*

    YYYY : ��¥ ������ �⵵�� �̾Ƴ�
    YY : �⵵�� ������ 2�ڸ� ���
    MM : ���� ������ ���
    DD : ���� ������ ��� 
    
    DAY : ����(������, ȭ����, ������ ... )
    DY : ����(��, ȭ, �� ... )
    
    HH : �ð�
    MI : ��
    SS : ��
    
*/

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD'),
            TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY HH:MI:SS')
FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YY/MM/DD_HH:MI:SS_DY')
FROM DUAL;

SELECT * FROM EMPLOYEE;

DESC EMPLOYEE;

SELECT HIREDATE, TO_CHAR(HIREDATE, 'YYYY-MM-DD DAY HH:MI:SS')
FROM EMPLOYEE;

-- TO_CHAR : ��¥, ���� ==> STRING ���������� ��ȯ
/*
        0 : �ڸ����� ó����. �ڸ����� ���� ������ 0���� ó��
        9 : �ڸ����� ó����. �ڸ����� ���� ������ �������� ó��
        L : �� ������ ��ȭ�� ��ȣ�� ǥ��
        . : �Ҽ������� ó��
        , : õ������ ����
*/

DESC EMPLOYEE;

SELECT ENAME, SALARY, TO_CHAR(SALARY, 'L999,999'), TO_CHAR(SALARY, 'L000,000')
FROM EMPLOYEE;

-- TO_DATE : ������, ����  => ��¥ Ÿ������ ��ȯ 
    /*
        TO_DATE (��ȯ�� ����[����], YYYYMMDD) 
    */
    
SELECT TO_DATE (20230628, 'YYYYMMDD'), TO_DATE(28062023,'DDMMYYYY')
FROM DUAL;

SELECT TO_DATE('2001-10-30', 'YYYY-MM-DD')
FROM DUAL;

-- ���Ͽ��� ���ó�¥���� ���� ��Ҵ��� ��� : 1981-04-15
SELECT SYSDATE - TO_DATE ('1981-04-15', 'YYYY-MM-DD') -- �ش糯¥���� ��������� �ϼ�
FROM DUAL;

SELECT TO_DATE ('12/06/22', 'MM/DD/YY') - TO_DATE( '1900-10-17', 'YYYY-MM-DD') AS �γ�¥����
FROM DUAL;


-- �ڽ��� ���Ͽ��� ������� ��ĥ ��Ҵ���, ��� ��Ҵ��� 
SELECT TRUNC(SYSDATE - TO_DATE('1994/04/02','YYYY/MM/DD')) AS ��ƿ��ϼ�,
        TRUNC(MONTHS_BETWEEN (SYSDATE, TO_DATE('1994/04/02','YYYY/MM/DD'))) AS ��ƿ°�����
FROM DUAL;

-- EMPLOYEE ���̺��� ������� �Ի��Ͽ��� 2030/01/01 ������ �ٹ� �������� ���϶�
SELECT  ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(TO_DATE('2030/01/01','YYYY/MM/DD'),HIREDATE)) AS �ٹ�������
FROM EMPLOYEE;

-- NULL ó�� �Լ� : NVL, NVL2, NULLIF
/*
    NVL(�÷�, ��) : �÷��� NULL�� ������ ��� ������ ��ġ
    NVL2 (�÷���, NULL�� �ƴҰ�� ó��)
*/
SELECT * FROM EMPLOYEE;

--NVL �Լ��� ����ؼ� ó�� - ������ ����. ����(SALARY) *12 + ���ʽ� (COMMISSION)
SELECT ENAME, SALARY, COMMISSION,
            SALARY * 12 + COMMISSION AS �ѿ���
FROM EMPLOYEE;

--NVL2 �Լ��� ����ؼ� ó�� -
SELECT ENAME, SALARY, COMMISSION, 
            NVL2(COMMISSION,  SALARY* 12 +COMMISSION, SALARY*12) AS �ѿ���
FROM EMPLOYEE;

/* �׷��Լ� : GROUP BY, Ư�� �÷��� �׷����ؼ� ó����. */

SELECT �÷���
FROM ���̺��̸�[��]
WHERE ���� 
GROUP BY �׷����� �÷���
HAVING �׷����Ѱ��������
ORDER BY �������÷���

-- ���� �Լ� : SUM, AVG, MAX, MIN, COUNT  <== NULL�� �ڵ�����ó���ؼ� �۵���
        -- SUM : �÷��� ��� ���� ���ϴ� �Լ�
        -- AVG : �÷��� ��� ���� ����� ���ϴ� �Լ�
        -- MAX : �÷��� ��� ���� �ִ밪�� �������� �Լ� 
        -- MIN : �÷��� ��� ���� �ּҰ��� �������� �Լ�
        -- COUNT : ���ڵ��, �׷��ε� ���� ���
        
        -- ���� : ���� ROW�� ��µ�, �ٸ� �÷��� ���� ���� ��� ������ �߻�
        
SELECT COMMISSION FROM EMPLOYEE;

SELECT SUM(COMMISSION) AS �հ�,
    AVG(COMMISSION) AS ���,
    MAX(COMMISSION) AS �ִ밪, 
    MIN(COMMISSION) AS �ּҰ�,
    COUNT(COMMISSION) AS ���ڵ��
FROM EMPLOYEE;

SELECT * FROM EMPLOYEE;

-- �μ���  ������ �հ�, ��, �ִ밪, �ּҰ�, �׷��ε� ����
-- DNO : �μ���ȣ�� ������ ���� �׷��ؼ� ó���� 
SELECT SUM (SALARY) AS �μ������
FROM EMPLOYEE
GROUP BY DNO 

SELECT ENAME, SALARY, DNO, COUNT(DNO) AS �׷��εȰ���
FROM EMPLOYEE
ORDER BY DNO ASC;

SELECT ENAME, SALARY, DNO 
FROM EMPLOYEE
ORDER BY DNO ASC;

-- �μ����� ������ �հ�, ���, �ִ����, �ּҿ���, �׷��ε� ���� ���
SELECT SUM(SALARY), ROUND(AVG(SALARY)), MAX(SALARY), MIN(SALARY), DNO �μ���ȣ, COUNT(DNO) �׷��μ�
FROM EMPLOYEE
GROUP BY DNO
ORDER BY DNO ASC;

SELECT SALARY 
FROM EMPLOYEE 
WHERE DNO=10;

SELECT ENAME, JOB, SALARY
FROM EMPLOYEE;

-- ���� �� �e���� �հ�, ���, �ִ밪, �ּҰ�, �׷��εȼ�
select SUM(SALARY), ROUND(AVG(SALARY)), MAX(SALARY), MIN(SALARY), JOB , COUNT(JOB) ���޼�
FROM EMPLOYEE
GROUP BY JOB
ORDER BY ��� DESC;

-- GROUP BY ���� 
    /*
        WHERE �� : <����> : GROUP BY ���� ������ ó���ؼ� ���� ����� GROUP BY
                - ROUND ����� ���� ������ ó���Ҷ��� HAVING�� ����� ��
        HAVING �� : <����> : GROUP BY  �� ����� ���� ����ó��, ��Ī�̸��� ����ϸ� �ȵ�.
                - ORDER BY�� ��Ī�̸� ��� ���� 
    */
    
-- ���޺��� ������ �հ�, ���, �ִ밪, �ּҰ���  ����� 2000�̻��� �͸�  ���
-- ����� ������������ �����϶�. 
SELECT SUM(SALARY), ROUND(AVG(SALARY)) AS ���, MAX(SALARY), MIN(SALARY), JOB, COUNT(JOB)
FROM EMPLOYEE
GROUP BY JOB
HAVING ROUND(AVG(SALARY))>=2000 -- ���(����)�̸� ���� 
ORDER BY ��� DESC;

-- ���޺��� ������ �հ�, ���, �ִ밪, �ּҰ��� ����ϵ� 20�� �μ��� ����, ����� 2000�̻��� �͸�  ���
-- ����� ������������ �����϶�.
SELECT SUM(SALARY), ROUND(AVG(SALARY)) AS ���, MAX(SALARY), MIN(SALARY), JOB, COUNT(*)
FROM EMPLOYEE
WHERE DNO NOT IN (20)
GROUP BY JOB
HAVING ROUND(AVG(SALARY))>=2000 -- ���(����)�̸� ���� 
ORDER BY ��� DESC;

-- �� �÷� �̻� �׷����� �� �� �ִ�. �� �÷� ��ΰ� ������ �� �׷����� ��. 

SELECT DNO, JOB
FROM EMPLOYEE
ORDER BY DNO , JOB;

-- �μ���ȣ�� ��å�÷� ��θ� �׷����ؼ� ������ �հ�, ���, �ִ밪, �ּҰ�, �׷��εȼ� 
SELECT SUM(SALARY), ROUND(AVG(SALARY)), MAX(SALARY), MIN(SALARY), JOB, DNO, COUNT(*) �׷��εȼ�
FROM EMPLOYEE
GROUP BY DNO, JOB
ORDER BY DNO DESC;

-- �� ��å�� ���ؼ� ������ �հ�, ���, �ִ밪, �ּҰ��� ����ϴµ� 
-- �Ի����� 81�⵵�� �Ի��� ����鸸 ����ϵ� ������ ����� 1500�̻��ΰ͸� ��� 
-- ������ ������������ ����
SELECT SUM(SALARY), ROUND(AVG(SALARY)) AS ����, MAX(SALARY), MIN(SALARY), COUNT(*)
FROM EMPLOYEE
WHERE HIREDATE LIKE '81%'
GROUP BY JOB
HAVING ROUND(AVG(SALARY))>=1500
ORDER BY ���� DESC;

-- ROLLUP :  �׷��� ��� ������ ���ο� ��ü ����� ���
-- CUBE : �� �׷����� ������ ���ο� ������, ���� ������ ���ο� ��ü ����� �Բ� ��� 

-- ROLLUP, CUBE�� ������� �ʴ� �׷��� ���� 
SELECT SUM(SALARY), ROUND(AVG(SALARY)) AS ���, MAX(SALARY), MIN(SALARY), DNO, COUNT(*)
FROM EMPLOYEE
GROUP DNO
ORDER BY DNO ASC;

-- ROLLUP �� ���
SELECT SUM(SALARY), ROUND(AVG(SALARY)) AS ���, MAX(SALARY), MIN(SALARY), DNO, COUNT(*)
FROM EMPLOYEE
GROUP BY ROLLUP (DNO)
ORDER BY DNO ASC;

-- CUBE�� ���
SELECT SUM(SALARY), ROUND(AVG(SALARY)) AS ���, MAX(SALARY), MIN(SALARY), DNO, COUNT(*)
FROM EMPLOYEE
GROUP BY CUBE (DNO)
ORDER BY DNO ASC;

/* SUBQUERY (���� ����) : select ������ select ����, ������ �۾��� �ϳ��� �������� ����
        where ������ ���� �����.
*/

-- ename�� SCOTT �� ����� ������ ��å�� ������� ����϶�. 
/*
    1. ename�� SCOTT�� ����� ��å�� �������� ����
    2. ��å�� �������� �ؼ� ����� �˾ƿ;��ϴ� ����
*/

SELECT * FROM EMPLOYEE;

SELECT JOB FROM EMPLOYEE WHERE ENAME ='SCOTT';

SELECT ENAME FROM EMPLOYEE WHERE JOB ='ANALYST';

-- SUBQUERY�� ����ؼ� ename�� SCOTT �� ����� ������ ��å�� ������� ����϶�. 
SELECT ENAME , SALARY, JOB 
FROM EMPLOYEE
WHERE JOB = ( SELECT JOB FROM EMPLOYEE WHERE ENAME='SCOTT');

-- SMITH�� ������ �μ��� ���� ������� ��� �ϱ�(SUBQUERY)
SELECT ENAME, JOB
FROM EMPLOYEE
WHERE DNO=(SELECT DNO FROM EMPLOYEE WHERE ENAME='SMITH');

-- SCOTT�� ���޺��� ���� ��� ���� ��� 
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY >= (SELECT SALARY FROM EMPLOYEE WHERE ENAME='SCOTT') 
            AND ENAME!='SCOTT';

-- �ּ� �޿��� �޴� ����� �̸��� ������, �޿� ����ϱ� 
SELECT ENAME, SALARY, JOB
FROM EMPLOYEE
WHERE SALARY=(SELECT MIN(SALARY) FROM EMPLOYEE); 

-- ���� ���� �ƴ϶� �������� ���� ��µ� ��� IN  Ű���带 ��� 


-- SUBQUERY�� ��� 
-- �μ����� �ּ� �޿��� �޴� ��� ������ �̸�, ��å, ������ ���, 
-- GRUOP BY, MIN, IN Ű���带 ����ؼ� ��� 
SELECT ENAME �̸�, JOB ��å, SALARY ����, DNO �μ���ȣ 
FROM EMPLOYEE
WHERE SALARY IN (
    SELECT MIN(SALARY)
    FROM EMPLOYEE
    GROUP BY DNO
);


-- �� �μ��� �ּ� �޿��� 30�� �μ��� �μ��� �ּ� �޿����� ū �μ��� ��� 
-- 1. 30�� �μ��� �ּ� �޿� 
-- 2. �� �μ��� �ּ� �޿� HAVING

SELECT MIN(SALARY), DNO, COUNT(*)
FROM EMPLOYEE
GROUP BY DNO 
HAVING MIN(SALARY) > (
    -- 30�� �μ��� �ʼұ޿��� ��� 
    SELECT MIN(SALARY) FROM EMPLOYEE
    WHERE DNO = 30
);

/*
`   ANY ������ : ���������� ��ȯ�ϴ� ������ ���� ����. 
        -- < any : �� �ִ밪���� ������ ����
        -- > any : �� �ּҰ����� ŭ�� ����
        -- = any : �� IN�� ������ Ű����
        
    ALL ������ : ������������ ��ȯ�Ǵ� ��� ���� ����. 
        -- < all �� �ּҰ� ���� ����      
        -- > all �� �ִ밪 ���� ŭ
*/

-- ������ salesman�� �ƴϸ鼭 ������ salesman�� ������� �޿��� ���� ����� ��� 
select *from employee order by job asc;

select ename, job, salary 
from employee
where salary < all ( select salary from employee 
                    where job='SALESMAN')
        and job !='SALESMAN';
        
-- min�� ����ؼ� ���
select ename, job, salary 
from employee
where salary <  (select min(salary) from employee 
                    where job='SALESMAN')
        and job !='SALESMAN';
        
-- ��� ������ �м���(ANALYST) �� ������� �޿��� �����鼭 ������ �м����� �ƴ� ������� ���
SELECT ENAME, JOB, SALARY
FROM EMPLOYEE
WHERE SALARY < ALL( SELECT SALARY FROM EMPLOYEE
                                    WHERE JOB='ANALYST')
            AND JOB <> 'ANALYST'
ORDER BY JOB ASC;

  =====================================================================  
1. SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ��� �Ͻÿ�. 
select ename, RPAD(SUBSTR(hiredate,1,6), LENGTH(HIREDATE),'*') AS �Ի���
from EMPLOYEE;

2. SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ��� �Ͻÿ�.
select ENAME, RPAD(SUBSTR(HIREDATE, 4,3), LENGTH(HIREDATE),'*') AS �Ի��� 
from employee
WHERE HIREDATE LIKE '___04%';

3. MOD �Լ��� ����Ͽ� ���ӻ���� Ȧ���� ����� ����Ͻÿ�. 
select ENAME, MANAGER
from employee
WHERE MOD(MANAGER,2)=1;

4. MOD �Լ��� ����Ͽ� ������ 3�� ����� ����鸸 ����ϼ���.
select ENAME, SALARY
from employee
WHERE MOD(SALARY,3)=0;

5. �Ի��� �⵵�� 2�ڸ� (YY), ���� (MON)�� ǥ���ϰ� ������ ��� (DY)�� �����Ͽ� ��� �Ͻÿ�. 
select ENAME, TO_CHAR(HIREDATE, 'YY/MON/DD DY') AS �Ի���
from employee;

6. ���� �� ���� �������� ��� �Ͻÿ�. ���� ��¥���� ���� 1�� 1���� �� ����� ����ϰ� TO_DATE �Լ��� ����Ͽ�
   ������ ������ ��ġ ��Ű�ÿ�.
select '2023/06/28' AS ����, TRUNC(SYSDATE - TO_DATE('2023/01/01', 'YYYY/MM/DD')) AS "2023�� ���� �ϼ�"
from DUAL;

7. �ڽ��� �¾ ��¥���� ������� �� ���� �������� ��� �ϼ���. 
select SYSDATE, TRUNC(SYSDATE - TO_DATE('1994/04/02', 'YYYY/MM/DD')) AS �����ϼ�
from DUAL;

8. �ڽ��� �¾ ��¥���� ������� �� ������ �������� ��� �ϼ���.
select TRUNC(MONTHS_BETWEEN(SYSDATE,TO_DATE( '1994/04/02', 'YYYY/MM/DD'))) 
                    AS ����������
from DUAL;

9. ������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� null ����� 0���� ��� �Ͻÿ�.
select COALESCE(MANAGER, 0) AS ��� 
from employee;

10.   �����ȣ,
      [�����ȣ 2�ڸ������ �������� *���� ] as "������ȣ", 
      �̸�, 
       [�̸��� ù�ڸ� ��� �� ���ڸ�, ���ڸ��� * ����] as "�����̸�"       
select ENO �����ȣ,  RPAD(SUBSTR(ENO,1,2), LENGTH(ENO),'*') AS ���������ȣ,
        ENAME �̸�, RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*') AS �����̸�
from employee;

11.  �ֹι�ȣ:   �� ����ϵ� 801210-1*******   ��� �ϵ��� , ��ȭ ��ȣ : 010-12*******
	dual ���̺� ���
select  RPAD(SUBSTR('940402-2654787',1,8),
            LENGTH('940402-2654787'),'*')AS �ֹι�ȣ,
          RPAD(SUBSTR('010-1234-5678', 1,6),
            LENGTH('010-1234-5678'),'*') AS ��ȭ��ȣ         
from DUAL;

=============================================================================
��� ����� �Ҽ��� 2�ڸ����� ����ϵ� �ݿø� �ؼ� ��� �Ͻÿ�.  
1.  10 �� �μ��� �����ϰ� �� �μ��� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�. 
select DNO, SUM(SALARY), ROUND(AVG(SALARY),2), MAX(SALARY), MIN(SALARY)
from employee
WHERE DNO!=10
GROUP BY DNO;

2.  ��å�� SALESMAN, PRESIDENT, CLERK �� ������ �� �μ��� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�.   	
select JOB, SUM(SALARY), ROUND(AVG(SALARY),2), MAX(SALARY), MIN(SALARY)
from employee
WHERE JOB NOT IN ('SALESMAN','PRESIDENT', 'CLERK')
GROUP BY JOB;

3. SMITH �� ������ �μ��� �ٹ��ϴ� ����� �� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�. 
select SUM(SALARY), ROUND(AVG(SALARY),2), MAX(SALARY), MIN(SALARY)
from employee
WHERE DNO=(SELECT DNO FROM EMPLOYEE WHERE ENAME='SMITH');

4. �μ��� �ּҿ����� �������� �ּҿ����� 1000 �̻��� �͸� ����ϼ���. 
select DNO, MIN(SALARY) AS �ּҿ���
from employee
GROUP BY DNO
HAVING MIN(SALARY)>=1000;

5.  �μ��� ������ �հ谡 9000 �̻�͸� ���
select DNO, SUM(SALARY) AS �����հ� 
from employee
GROUP BY DNO
HAVING SUM(SALARY)>=9000;

6.  �μ��� ������ ����� 2000 �̻� ���
select DNO, ROUND(AVG(SALARY),2) AS ������� 
from employee
GROUP BY DNO
HAVING ROUND(AVG(SALARY),2)>=2000 ;

7. ������ 1500 ���ϴ� �����ϰ� �� �μ����� ������ ����� ���ϵ� ������ ����� 2500�̻��� �͸� ��� �϶�. 
select DNO, ROUND(AVG(SALARY),2) AS �������
from employee
WHERE SALARY >=1500
GROUP BY DNO
HAVING ROUND(AVG(SALARY),2)>=2500;

8. sub query - �μ����� �ּ� �޿��� �޴� ������� �̸��� �޿��� ��å�� �μ���ȣ�� ����ϼ���. 


SELECT ENAME �̸�, JOB ��å, SALARY ����, DNO �μ���ȣ 
FROM EMPLOYEE
WHERE SALARY IN (
    SELECT MIN(SALARY)
    FROM EMPLOYEE
    GROUP BY DNO
);


9. sub query - ��ü ��� �޿����� ���� �޴� �������  �̸��� �޿��� ��å�� �μ���ȣ�� ����ϼ���. 
select ENAME �̸�, JOB ��å, SALARY ����, DNO �μ���ȣ  
from employee
WHERE SALARY >ALL(SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEE );

10. sub query - �޿��� ��� �޿����� ���� ������� 
--�����ȣ�� �̸��� ǥ���ϵ� ����� �޿��� ���� �������� �����Ͻÿ�. 
SELECT ENO �����ȣ, ENAME �̸�, SALARY �޿� 
FROM EMPLOYEE
WHERE SALARY >ALL (SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEE)
ORDER BY SALARY ASC;





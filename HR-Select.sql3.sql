/* SELECT 3 */

/* 형식 변환 함수
    TO_CHAR : 날짜, 숫자형을 문자형으로 변환
    TO_DATE : 문자형을 날짜형으로 변환
    TO_NUMBER : 문자형을 숫자로 변환
*/

-- TO_CHAR (DATE, 'YYYYMMDD') : 날짜형식을 'YYYYMMDD' 형식으로 뽑아와서 CHAR 형식으로 변환


/*

    YYYY : 날짜 정보의 년도를 뽑아냄
    YY : 년도의 마지막 2자리 출력
    MM : 월의 정보를 출력
    DD : 일의 정보를 출력 
    
    DAY : 요일(월요일, 화요일, 수요일 ... )
    DY : 요일(월, 화, 수 ... )
    
    HH : 시간
    MI : 분
    SS : 초
    
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

-- TO_CHAR : 날짜, 숫자 ==> STRING 문자형으로 변환
/*
        0 : 자릿수를 처리함. 자릿수가 맞지 않으면 0으로 처리
        9 : 자릿수를 처리함. 자릿수가 맞지 않으면 공백으로 처리
        L : 각 지역의 통화를 기호로 표시
        . : 소숫점으로 처리
        , : 천단위를 구분
*/

DESC EMPLOYEE;

SELECT ENAME, SALARY, TO_CHAR(SALARY, 'L999,999'), TO_CHAR(SALARY, 'L000,000')
FROM EMPLOYEE;

-- TO_DATE : 문자형, 숫자  => 날짜 타입으로 변환 
    /*
        TO_DATE (변환할 문자[숫자], YYYYMMDD) 
    */
    
SELECT TO_DATE (20230628, 'YYYYMMDD'), TO_DATE(28062023,'DDMMYYYY')
FROM DUAL;

SELECT TO_DATE('2001-10-30', 'YYYY-MM-DD')
FROM DUAL;

-- 생일에서 오늘날짜까지 몇일 살았는지 출력 : 1981-04-15
SELECT SYSDATE - TO_DATE ('1981-04-15', 'YYYY-MM-DD') -- 해당날짜에서 현재까지의 일수
FROM DUAL;

SELECT TO_DATE ('12/06/22', 'MM/DD/YY') - TO_DATE( '1900-10-17', 'YYYY-MM-DD') AS 두날짜의차
FROM DUAL;


-- 자신의 생일에서 현재까지 며칠 살았는지, 몇개월 살았는지 
SELECT TRUNC(SYSDATE - TO_DATE('1994/04/02','YYYY/MM/DD')) AS 살아온일수,
        TRUNC(MONTHS_BETWEEN (SYSDATE, TO_DATE('1994/04/02','YYYY/MM/DD'))) AS 살아온개월수
FROM DUAL;

-- EMPLOYEE 테이블에서 각사원의 입사일에서 2030/01/01 까지의 근무 개월수를 구하라
SELECT  ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(TO_DATE('2030/01/01','YYYY/MM/DD'),HIREDATE)) AS 근무개월수
FROM EMPLOYEE;

-- NULL 처리 함수 : NVL, NVL2, NULLIF
/*
    NVL(컬럼, 값) : 컬럼에 NULL이 존재할 경우 값으로 대치
    NVL2 (컬럼명, NULL이 아닐경우 처리)
*/
SELECT * FROM EMPLOYEE;

--NVL 함수를 사용해서 처리 - 연봉을 구함. 월급(SALARY) *12 + 보너스 (COMMISSION)
SELECT ENAME, SALARY, COMMISSION,
            SALARY * 12 + COMMISSION AS 총연봉
FROM EMPLOYEE;

--NVL2 함수를 사용해서 처리 -
SELECT ENAME, SALARY, COMMISSION, 
            NVL2(COMMISSION,  SALARY* 12 +COMMISSION, SALARY*12) AS 총연봉
FROM EMPLOYEE;

/* 그룹함수 : GROUP BY, 특정 컬럼을 그룹핑해서 처리함. */

SELECT 컬럼명
FROM 테이블이름[뷰]
WHERE 조건 
GROUP BY 그룹핑할 컬럼명
HAVING 그룹핑한결과의조건
ORDER BY 정렬할컬럼명

-- 집계 함수 : SUM, AVG, MAX, MIN, COUNT  <== NULL을 자동으로처리해서 작동됨
        -- SUM : 컬럼의 모든 값을 더하는 함수
        -- AVG : 컬럼의 모든 값의 평균을 구하는 함수
        -- MAX : 컬럼의 모든 값의 최대값을 가져오는 함수 
        -- MIN : 컬럼의 모든 값의 최소값을 가져오는 함수
        -- COUNT : 레코드수, 그룹핑된 갯수 출력
        
        -- 주의 : 단일 ROW로 출력됨, 다른 컬럼을 같이 사용될 경우 오류가 발생
        
SELECT COMMISSION FROM EMPLOYEE;

SELECT SUM(COMMISSION) AS 합계,
    AVG(COMMISSION) AS 평균,
    MAX(COMMISSION) AS 최대값, 
    MIN(COMMISSION) AS 최소값,
    COUNT(COMMISSION) AS 레코드수
FROM EMPLOYEE;

SELECT * FROM EMPLOYEE;

-- 부서별  월급의 합계, 평군, 최대값, 최소값, 그룹핑된 갯수
-- DNO : 부서번호가 동일한 값을 그룹해서 처리함 
SELECT SUM (SALARY) AS 부서별평균
FROM EMPLOYEE
GROUP BY DNO 

SELECT ENAME, SALARY, DNO, COUNT(DNO) AS 그룹핑된갯수
FROM EMPLOYEE
ORDER BY DNO ASC;

SELECT ENAME, SALARY, DNO 
FROM EMPLOYEE
ORDER BY DNO ASC;

-- 부서별로 월급의 합계, 평균, 최대월급, 최소월급, 그룹핑된 수를 출력
SELECT SUM(SALARY), ROUND(AVG(SALARY)), MAX(SALARY), MIN(SALARY), DNO 부서번호, COUNT(DNO) 그룹핑수
FROM EMPLOYEE
GROUP BY DNO
ORDER BY DNO ASC;

SELECT SALARY 
FROM EMPLOYEE 
WHERE DNO=10;

SELECT ENAME, JOB, SALARY
FROM EMPLOYEE;

-- 직급 별 웕브의 합계, 평균, 최대값, 최소값, 그룹핑된수
select SUM(SALARY), ROUND(AVG(SALARY)), MAX(SALARY), MIN(SALARY), JOB , COUNT(JOB) 직급수
FROM EMPLOYEE
GROUP BY JOB
ORDER BY 평균 DESC;

-- GROUP BY 에서 
    /*
        WHERE 절 : <조건> : GROUP BY 전에 조건을 처리해서 나온 결과만 GROUP BY
                - ROUND 결과에 대한 조건을 처리할때는 HAVING을 사용할 것
        HAVING 절 : <조건> : GROUP BY  한 결과에 대한 조건처리, 별칭이름을 사용하면 안됨.
                - ORDER BY는 별칭이름 사용 가능 
    */
    
-- 직급별로 월급의 합계, 평균, 최대값, 최소값을  평균이 2000이상인 것만  출력
-- 평균을 내림차순으로 정렬하라. 
SELECT SUM(SALARY), ROUND(AVG(SALARY)) AS 평균, MAX(SALARY), MIN(SALARY), JOB, COUNT(JOB)
FROM EMPLOYEE
GROUP BY JOB
HAVING ROUND(AVG(SALARY))>=2000 -- 평균(별명)이름 못씀 
ORDER BY 평균 DESC;

-- 직급별로 월급의 합계, 평균, 최대값, 최소값을 출력하되 20번 부서는 뺴고, 평균이 2000이상인 것만  출력
-- 평균을 내림차순으로 정렬하라.
SELECT SUM(SALARY), ROUND(AVG(SALARY)) AS 평균, MAX(SALARY), MIN(SALARY), JOB, COUNT(*)
FROM EMPLOYEE
WHERE DNO NOT IN (20)
GROUP BY JOB
HAVING ROUND(AVG(SALARY))>=2000 -- 평균(별명)이름 못씀 
ORDER BY 평균 DESC;

-- 두 컬럼 이상 그룹핑을 할 수 있다. 두 컬럼 모두가 동일할 때 그룹핑이 됨. 

SELECT DNO, JOB
FROM EMPLOYEE
ORDER BY DNO , JOB;

-- 부서번호와 직책컬럼 모두를 그룹핑해서 월급의 합계, 평균, 최대값, 최소값, 그룹핑된수 
SELECT SUM(SALARY), ROUND(AVG(SALARY)), MAX(SALARY), MIN(SALARY), JOB, DNO, COUNT(*) 그룹핑된수
FROM EMPLOYEE
GROUP BY DNO, JOB
ORDER BY DNO DESC;

-- 각 직책에 대해서 월급의 합계, 평균, 최대값, 최소값을 출력하는데 
-- 입사일이 81년도에 입사한 사원들만 출력하되 월급의 평균이 1500이상인것만 출력 
-- 월급을 내림차순으로 정렬
SELECT SUM(SALARY), ROUND(AVG(SALARY)) AS 월급, MAX(SALARY), MIN(SALARY), COUNT(*)
FROM EMPLOYEE
WHERE HIREDATE LIKE '81%'
GROUP BY JOB
HAVING ROUND(AVG(SALARY))>=1500
ORDER BY 월급 DESC;

-- ROLLUP :  그룹한 결과 마지막 라인에 전체 결과를 출력
-- CUBE : 각 그룹핑의 마지막 라인에 결과출력, 제일 마지막 라인에 전체 결과도 함께 출력 

-- ROLLUP, CUBE를 사용하지 않는 그룹핑 쿼리 
SELECT SUM(SALARY), ROUND(AVG(SALARY)) AS 평균, MAX(SALARY), MIN(SALARY), DNO, COUNT(*)
FROM EMPLOYEE
GROUP DNO
ORDER BY DNO ASC;

-- ROLLUP 을 사용
SELECT SUM(SALARY), ROUND(AVG(SALARY)) AS 평균, MAX(SALARY), MIN(SALARY), DNO, COUNT(*)
FROM EMPLOYEE
GROUP BY ROLLUP (DNO)
ORDER BY DNO ASC;

-- CUBE를 사용
SELECT SUM(SALARY), ROUND(AVG(SALARY)) AS 평균, MAX(SALARY), MIN(SALARY), DNO, COUNT(*)
FROM EMPLOYEE
GROUP BY CUBE (DNO)
ORDER BY DNO ASC;

/* SUBQUERY (서브 쿼리) : select 내부의 select 구문, 여러번 작업을 하나의 쿼리에서 실행
        where 절에서 많이 사용함.
*/

-- ename이 SCOTT 인 사원과 동일한 직책의 사원들을 출력하라. 
/*
    1. ename이 SCOTT인 사원의 직책을 가져오는 쿼리
    2. 직책을 조건으로 해서 사원을 알아와야하는 쿼리
*/

SELECT * FROM EMPLOYEE;

SELECT JOB FROM EMPLOYEE WHERE ENAME ='SCOTT';

SELECT ENAME FROM EMPLOYEE WHERE JOB ='ANALYST';

-- SUBQUERY를 사용해서 ename이 SCOTT 인 사원과 동일한 직책의 사원들을 출력하라. 
SELECT ENAME , SALARY, JOB 
FROM EMPLOYEE
WHERE JOB = ( SELECT JOB FROM EMPLOYEE WHERE ENAME='SCOTT');

-- SMITH와 동일한 부서를 가진 사원들을 출력 하기(SUBQUERY)
SELECT ENAME, JOB
FROM EMPLOYEE
WHERE DNO=(SELECT DNO FROM EMPLOYEE WHERE ENAME='SMITH');

-- SCOTT의 월급보다 많은 사원 정보 출력 
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY >= (SELECT SALARY FROM EMPLOYEE WHERE ENAME='SCOTT') 
            AND ENAME!='SCOTT';

-- 최소 급여를 받는 사원의 이름과 담당업무, 급여 출력하기 
SELECT ENAME, SALARY, JOB
FROM EMPLOYEE
WHERE SALARY=(SELECT MIN(SALARY) FROM EMPLOYEE); 

-- 단일 값이 아니라 여러개의 값이 출력될 경우 IN  키워드를 사용 


-- SUBQUERY를 사용 
-- 부서별로 최소 급여를 받는 사원 정보의 이름, 직책, 월급을 출력, 
-- GRUOP BY, MIN, IN 키워드를 사용해서 출력 
SELECT ENAME 이름, JOB 직책, SALARY 월급, DNO 부서번호 
FROM EMPLOYEE
WHERE SALARY IN (
    SELECT MIN(SALARY)
    FROM EMPLOYEE
    GROUP BY DNO
);


-- 각 부서의 최소 급여가 30번 부서의 부서의 최소 급여보다 큰 부서를 출력 
-- 1. 30번 부서의 최소 급여 
-- 2. 각 부서의 최소 급여 HAVING

SELECT MIN(SALARY), DNO, COUNT(*)
FROM EMPLOYEE
GROUP BY DNO 
HAVING MIN(SALARY) > (
    -- 30번 부서의 초소급여를 출력 
    SELECT MIN(SALARY) FROM EMPLOYEE
    WHERE DNO = 30
);

/*
`   ANY 연산자 : 서브쿼리가 반환하는 각각의 값과 비교함. 
        -- < any : 는 최대값보다 작음을 뜻함
        -- > any : 는 최소값보다 큼을 뜻함
        -- = any : 는 IN과 동일한 키워드
        
    ALL 연산자 : 서브쿼리에서 반환되는 모든 값을 비교함. 
        -- < all 는 최소값 보다 작음      
        -- > all 는 최대값 보다 큼
*/

-- 직급이 salesman이 아니면서 직급이 salesman인 사원보다 급여가 적은 사원을 출력 
select *from employee order by job asc;

select ename, job, salary 
from employee
where salary < all ( select salary from employee 
                    where job='SALESMAN')
        and job !='SALESMAN';
        
-- min을 사용해서 출력
select ename, job, salary 
from employee
where salary <  (select min(salary) from employee 
                    where job='SALESMAN')
        and job !='SALESMAN';
        
-- 담당 업무가 분석가(ANALYST) 인 사원보다 급여가 적으면서 업무가 분석가가 아닌 사원들을 출력
SELECT ENAME, JOB, SALARY
FROM EMPLOYEE
WHERE SALARY < ALL( SELECT SALARY FROM EMPLOYEE
                                    WHERE JOB='ANALYST')
            AND JOB <> 'ANALYST'
ORDER BY JOB ASC;

  =====================================================================  
1. SUBSTR 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력 하시오. 
select ename, RPAD(SUBSTR(hiredate,1,6), LENGTH(HIREDATE),'*') AS 입사년월
from EMPLOYEE;

2. SUBSTR 함수를 사용하여 4월에 입사한 사원을 출력 하시오.
select ENAME, RPAD(SUBSTR(HIREDATE, 4,3), LENGTH(HIREDATE),'*') AS 입사년월 
from employee
WHERE HIREDATE LIKE '___04%';

3. MOD 함수를 사용하여 직속상관이 홀수인 사원만 출력하시오. 
select ENAME, MANAGER
from employee
WHERE MOD(MANAGER,2)=1;

4. MOD 함수를 사용하여 월급이 3의 배수인 사원들만 출력하세요.
select ENAME, SALARY
from employee
WHERE MOD(SALARY,3)=0;

5. 입사한 년도는 2자리 (YY), 월은 (MON)로 표시하고 요일은 약어 (DY)로 지정하여 출력 하시오. 
select ENAME, TO_CHAR(HIREDATE, 'YY/MON/DD DY') AS 입사일
from employee;

6. 올해 몇 일이 지났는지 출력 하시오. 현재 날짜에서 올해 1월 1일을 뺀 결과를 출력하고 TO_DATE 함수를 사용하여
   데이터 형식을 일치 시키시오.
select '2023/06/28' AS 오늘, TRUNC(SYSDATE - TO_DATE('2023/01/01', 'YYYY/MM/DD')) AS "2023년 지난 일수"
from DUAL;

7. 자신이 태어난 날짜에서 현재까지 몇 일이 지났는지 출력 하세요. 
select SYSDATE, TRUNC(SYSDATE - TO_DATE('1994/04/02', 'YYYY/MM/DD')) AS 숨쉰일수
from DUAL;

8. 자신이 태어난 날짜에서 현재까지 몇 개월이 지났는지 출력 하세요.
select TRUNC(MONTHS_BETWEEN(SYSDATE,TO_DATE( '1994/04/02', 'YYYY/MM/DD'))) 
                    AS 숨쉰개월수
from DUAL;

9. 사원들의 상관 사번을 출력하되 상관이 없는 사원에 대해서는 null 갑대신 0으로 출력 하시오.
select COALESCE(MANAGER, 0) AS 사번 
from employee;

10.   사원번호,
      [사원번호 2자리만출력 나머지는 *가림 ] as "가린번호", 
      이름, 
       [이름의 첫자만 출력 총 네자리, 세자리는 * 가림] as "가린이름"       
select ENO 사원번호,  RPAD(SUBSTR(ENO,1,2), LENGTH(ENO),'*') AS 가린사원번호,
        ENAME 이름, RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*') AS 가린이름
from employee;

11.  주민번호:   를 출력하되 801210-1*******   출력 하도록 , 전화 번호 : 010-12*******
	dual 테이블 사용
select  RPAD(SUBSTR('940402-2654787',1,8),
            LENGTH('940402-2654787'),'*')AS 주민번호,
          RPAD(SUBSTR('010-1234-5678', 1,6),
            LENGTH('010-1234-5678'),'*') AS 전화번호         
from DUAL;

=============================================================================
모든 평균은 소숫점 2자리까지 출력하되 반올림 해서 출력 하시오.  
1.  10 번 부서를 제외하고 각 부서별 월급의 합계와 평균과 최대값, 최소값을 구하시오. 
select DNO, SUM(SALARY), ROUND(AVG(SALARY),2), MAX(SALARY), MIN(SALARY)
from employee
WHERE DNO!=10
GROUP BY DNO;

2.  직책의 SALESMAN, PRESIDENT, CLERK 을 제외한 각 부서별 월급의 합계와 평균과 최대값, 최소값을 구하시오.   	
select JOB, SUM(SALARY), ROUND(AVG(SALARY),2), MAX(SALARY), MIN(SALARY)
from employee
WHERE JOB NOT IN ('SALESMAN','PRESIDENT', 'CLERK')
GROUP BY JOB;

3. SMITH 과 동일한 부서에 근무하는 사원들 의 월급의 합계와 평균과 최대값, 최소값을 구하시오. 
select SUM(SALARY), ROUND(AVG(SALARY),2), MAX(SALARY), MIN(SALARY)
from employee
WHERE DNO=(SELECT DNO FROM EMPLOYEE WHERE ENAME='SMITH');

4. 부서별 최소월급을 가져오되 최소월급이 1000 이상인 것만 출력하세요. 
select DNO, MIN(SALARY) AS 최소월급
from employee
GROUP BY DNO
HAVING MIN(SALARY)>=1000;

5.  부서별 월급의 합계가 9000 이상것만 출력
select DNO, SUM(SALARY) AS 월급합계 
from employee
GROUP BY DNO
HAVING SUM(SALARY)>=9000;

6.  부서별 월급의 평균이 2000 이상만 출력
select DNO, ROUND(AVG(SALARY),2) AS 월급평균 
from employee
GROUP BY DNO
HAVING ROUND(AVG(SALARY),2)>=2000 ;

7. 월급이 1500 이하는 제외하고 각 부서별로 월급의 평균을 구하되 월급의 평균이 2500이상인 것만 출력 하라. 
select DNO, ROUND(AVG(SALARY),2) AS 월급평균
from employee
WHERE SALARY >=1500
GROUP BY DNO
HAVING ROUND(AVG(SALARY),2)>=2500;

8. sub query - 부서별로 최소 급여를 받는 사용자의 이름과 급여와 직책과 부서번호를 출력하세요. 


SELECT ENAME 이름, JOB 직책, SALARY 월급, DNO 부서번호 
FROM EMPLOYEE
WHERE SALARY IN (
    SELECT MIN(SALARY)
    FROM EMPLOYEE
    GROUP BY DNO
);


9. sub query - 전체 평균 급여보다 많이 받는 사용자의  이름과 급여와 직책과 부서번호를 출력하세요. 
select ENAME 이름, JOB 직책, SALARY 월급, DNO 부서번호  
from employee
WHERE SALARY >ALL(SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEE );

10. sub query - 급여가 평균 급여보다 많은 사원들의 
--사원번호와 이름을 표시하되 결과를 급여에 대해 오름차순 정렬하시오. 
SELECT ENO 사원번호, ENAME 이름, SALARY 급여 
FROM EMPLOYEE
WHERE SALARY >ALL (SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEE)
ORDER BY SALARY ASC;





/* Select 문 */

/* 테이블의 모든 컬럼을 출력*/

SELECT * FROM employee;     -- 사원 정보가 저장된 테이블 

SELECT * FROM department;       -- 사원에 대한 부서 정보가 저장

SELECT * FROM salgrade;     -- 연봉에 대한 등급이 저장

/* Employee 테이블의 컬럼(필드) 구조
    
    ENO : 사원번호
    ENAME : 사원명 
    JOB : 직책 
    MANAGER : 직급 상사 (사수)
    HIREDATE : 입사년월일
    SALARY : 연봉
    COMMISSION : 보너스 `
    DNO : 부서번호 
*/

/* DEPARTMENT 테이블의 컬럼(필드) 구조
    DNO : 부서번호 
    DNAME : 부서이름
    LOC : 부서 지역
*/

/* SALGRADE 테이블의 컬럼(필드) 구조
   GRADE : 등급
   LOSAL : 최소 연봉
   HISAL : 최대 연봉 
*/

/* SELECT 쿼리 : 출력 

SELECT 컬럼명 
FROM 테이블명[뷰]
WHERE 조건
GROUP BY 그룹핑할컬럼
HAVING 조건(GROUPING한 결과의 조건) 
ORDER BY 컬럼명 (정렬할 컬럼명)

*/

-- 기본 SELECT 
SELECT * FROM employee;

-- 특정 컬럼만 출력 하기

/*이름이 JAMES인 사원의 이름과 직책, 입사월, 부서번호 출력 하기
SELECT, SELECT, FROM, FROM, WHERE, WHERE
컬럼에 저장된 값(레코드)을 가져올때 대소문자를 구분함. */

SELECT ENAME 일므, JOB 직책, HIREDATE 입사년월일, DNO 부서번호
FROM employee
WHERE ENAME = 'HAMES';

-- WHERE 절에서 연산자 사용
SELECT *
FROM employee
WHERE ENAME = 'JAMES' OR ENAME = 'SMITH';

-- WHERE 절에서 IN 연산자 사용 (=OR)
SELECT *
FROM employee
WHERE ENAME IN ('JAMES', 'SMITH');

-- WHERE 절에서 비교 연산자 사용하기: >, <, >=, <=
-- 연봉이 1500이상인 사용자만 출력
SELECT *
FROM employee
WHERE salary>=1500 ;

-- 월급이 1500 이상 이고 부서가 30인 사용자만 출력
SELECT *
FROM employee
WHERE salary>=1500 AND DNO=30;

-- 테이블의 컬럼의 자료형 및 테이블 구조 확인 
-- NUMBER : oracle에서 정수, 실수
    /*
        NUMBER(4) : 정수 : 4 : 자리까지만 넣을 수 있다. 
        NUMBER(7,2) : 실수 ( 전체 7자리, 소숫점이하 2자리 )
        
        CHAR(10) : 문자 10BYTE  <== 자릿수를 알수 있는 경우
                VARCHAR2보다 성능이 빠르다, 하드 공간 낭비가 있다. 
                주민번호(13), 비밀번호 4자리만 들어간다. 
                
        VARCHAR2(10) : 문자 10BYTE        <== VARCHAR2를 사용, <== 자릿수를 알수 없는 경우
                CHAR 보다 성능은 떨어지지만 하드 공간을 낭비하지 않는다.
                
        DATA : 날짜를 저장하는 데이터 타입
                
    */

-- 테이블 구조 확인

DESC EMPLOYEE;

SELECT * FROM EMPLOYEE;

-- NUMBER : 정수, 실수, 값을 가져올때 ''를 붙이면 안됨.
-- CHAR, VARCHAR2, DATE : 값 가져올때 ''를 붙여야함.

-- 직책(JOB)이 영업사원(SALESMAN)이고 연봉이 1500이상 3000 미만인 사원의 이름만 출력해 보기
SELECT ename
FROM employee
WHERE job='SALESMAN' AND ( salary >=1500 AND salary<=3000 );

-- NULL을 검색 : 주의 : =를 사용하면 안됨, IS NULL 
    -- NULL : 0이 아니고 비어있는 상태 
-- 보너스(COMMISSION) 가 없는 사원 정보를 출력
SELECT *
FROM employee
WHERE commission IS NULL ;

-- 보너스(COMMISSION)가 있는 사원 정보를 출력 : NULL이 아닌것만 검색
SELECT *
FROM employee
WHERE COMMISSION IS NOT NULL ;

-- 상사(사수) MANAGER가 없는 사원 정보 출력
SELECT * FROM EMPLOYEE;

SELECT * 
FROM EMPLOYEE
WHERE MANAGER IS NULL ;

-- 날짜 검색 하기 
--입사 날짜가 81/02/20일날 입사한 사원의 이름과 직책과 월급, 입사일을 출력 
select ename as 이름, job as 직책, salary 월급, hiredate 입사일
from employee
where hiredate = '81/02/20';

-- 81년도에 입사한 사용자만 출력 
select *
from employee
where hiredate >='81/01/01' and  hiredate <= '81/12/31';        --날짜 컬럼 : date


-- where 에서 like연산자 사용 <== 컬럼의 특정 단어를 검색 할때 사용 : 게시판, 이름, 글내용, 날짜로 검색
        -- 문자열의 단어를 검색할때 사용 
        -- 와일드 카드 식별자 사용- % : 어떤 글자가 와도 상관없다)
    
-- 이름이 A로 시작되는 사원을 검색 
select *
from employee
where ENAME LIKE 'A%';

select HIREDATE 
FROM EMPLOYEE
WHERE HIREDATE LIKE '81%';

-- 직책 (JOB) 컬럼에서 AG 라는 단어가 들어가는 사원 정보를 출력 

select *
from employee
WHERE JOB LIKE '%AG%';

/* 중복 제거하기 : DISTINCT, 다른 컬럼이 지정되면 오류 발생, 단일 컬럼에서 사용  */

 -- 우리 회사의 존재하는 직책을 출력 
 
select DISTINCT JOB
from employee ;

-- 우리 회사에 존재하는 부서를 출력 

SELECT DISTINCT DNO
FROM EMPLOYEE;

/* 정렬해서 출력 : ORDER BY 컬럼명 ASC[DESC] */
-- 사원 테이블의 이름 컬럼을 기준으로 내림 차순 정렬
SELECT * 
FROM EMPLOYEE
ORDER BY ENAME DESC;

-- 사원 번호를 기준으로 오름차순 정렬
SELECT * 
FROM EMPLOYEE
ORDER BY ENO ASC;

-- 최근 입사한 순서대로 출력 
 SELECT * 
FROM EMPLOYEE
ORDER BY HIREDATE DESC;

-- 급여가 많은 사원부터 출력하되 사원명, 직책, 급여 부서번호를 출력 하라. 
SELECT ENAME 사원명, JOB 직책, salary 급여, DNO 부서번호
FROM EMPLOYEE
ORDER BY salary DESC;

-- NVL,  함수 사용하기 : NULL을 0으로 처리하는 함수
    -- + /- /* / / + NULL은 = NULL 
    -- NULL은 비어있는 상태임. -이 아님. 
    -- NVL (COMMISSION, 0) : COMMISSION 컬럼의 NULL이 존재할 경우 0으로 바꾸어라
    
    
-- NVL 함수를 사용하지 않고 전체 연봉을 구하는 컬럼을 출력 
SELECT *
FROM employee

-- 전체 연봉을 계산해서 이름, 직책, 월급, 보너스, 총연봉
-- 총 연봉 = (월급*12)+보너스(COMMISSION) 
SELECT ENAME 이름, JOB 직책, SALARY 월급, COMMISSION 보너스, 
            (SALARY*12)+COMMISSION AS 총연봉
FROM employee

-- NVL함수를 사용해서 COMMISSION 컬럼의 NULL을 0으로 대치후 계산
-- 계산후 연봉 내림차순
SELECT ENAME 이름, JOB 직책, SALARY 월급, COMMISSION 보너스, 
            (SALARY*12)+NVL(COMMISSION,0) AS 총연봉
FROM employee
ORDER BY 총연봉 DESC;

-- WHERE 컬럼명 BETWEEN A AND B : A 이상 B이하
-- 월급이 1500이상 3000 이하인 사원명, 직책, 월급(급여), 입사일을 출력하되 최근 입사한 사용자로 정렬해서 출력
SELECT *
FROM employee
WHERE SALARY >= 1500 AND SALARY <=3000
ORDER BY HIREDATE DESC;
-- 위 아래 동일 
SELECT *
FROM employee
WHERE SALARY BETWEEN 1500 AND 3000
ORDER BY HIREDATE DESC;

/* 레코드 갯수 출력 : COUNT <== 게시판에서 DB의 전체 레코드 수를 가져와서 페이징 처리를 하기 위해서 사용 */
--  COUNT 함수는 NULL을 카운트 하지 않는다. 
-- 특정 컬럼의 평균을 구할 때, NULL을 카운트 할지 말지를 지정 
SELECT COUNT(*) "전체 레코드수"
FROM EMPLOYEE;

-- not null 컬럼을 conut 해야 전체레코드를 제대로 출력 할 수 있다. 
select count(eno)
from employee;

-- 특정 컬럼을 카운트 할때 null 허용된 컬럼인 경우 null은 카운트 되지 않음.
SELECT COUNT(COMMISSION) AS "레코드수"
FROM EMPLOYEE;

-- employee테이블의 컬럼의 null 허용 여부, 자료형 (number(n), char(n), varchar2(n), date ) 
desc employee;

SELECT *
FROM EMPLOYEE

-- 5시 45분까지 완료 
<문제1> 컬럼 알리어스(별칭) , commission(보너스) 컬럼의 null 인 값만 출력하되 사원번호, 사원이름,입사날짜를 출력 
SELECT eno 사원번호, ename 사원이름, hiredate 입사날짜
FROM EMPLOYEE
WHERE COMMISSION IS NULL;

<문제2> dno(부서번호) 가 20이고 입사날짜가 81년 4월 이후 사원의 이름과 직책과 입사날짜를 출력
SELECT ENAME 이름, JOB 직책, HIREDATE 입사날짜 
FROM EMPLOYEE
WHERE DNO=20 AND HIREDATE>='81/04/01';

<문제3> 연봉을 계산해서 사원번호, 사원이름, 월급, 보너스, 전체 연봉을 출력
SELECT ENO 사원번호, ENAME 사원이름, SALARY 월급, COMMISSION 보너스,
            (SALARY*12)+NVL(COMMISSION,0) AS "전체 연봉"
FROM EMPLOYEE;

<문제4> commission이 null 이 아닌 사용자의 이름만 출력 
SELECT ENAME 사용자이름
FROM EMPLOYEE
WHERE COMMISSION IS NOT NULL;

<문제5> manager (직급상사) 7698 인 사원이름과 직책을 출력.
SELECT ENAME 사원이름, JOB 직책
FROM EMPLOYEE
WHERE MANAGER=7698;

<문제6> 월급이 1500 이상이고 부서가 20인 사원의 사원이름과 입사날짜, 부서번호, 월급을 출력
SELECT ENAME 사원이름, HIREDATE 입사날짜, DNO 부서번호, SALARY 월급
FROM EMPLOYEE
WHERE SALARY>=1500 AND DNO=20;

<문제7> 입사날짜가 81년 4월 1일 이상이고 81년 12월 말일까지인 사원 이름과 입사날짜을 출력
SELECT ENAME 이름, HIREDATE 입사날짜
FROM EMPLOYEE
WHERE HIREDATE BETWEEN '81/4/1' AND '81/12/31';


<문제8> 직책(job) salesman 이면서 연봉이 1500 이상이면서 부서번호가 30인 사원명을 출력
SELECT ENAME 사원명
FROM EMPLOYEE
WHERE JOB='SALESMAN' AND SALARY>=1500 AND DNO=30;

<문제9> 월급이 1500 이하이면서 부서번호가 20번 이 아닌 사원이름과, 월급과, 부서번호를 출력
SELECT ENAME 사원이름,SALARY 월급,DNO 부서번호
FROM EMPLOYEE
WHERE SALARY<=1500 AND DNO <> 20;

<문제10> 사원번호(eno) 가 7788, 7782 인 부서번호와 이름과 직책을 출력 
SELECT DNO 부서번호, ENAME 이름,  JOB 직책
FROM EMPLOYEE
WHERE ENO=7788 OR ENO=7782;













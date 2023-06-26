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

/* 중복 제거하기 : DISTINCT */

 -- 우리 회사의 존재하는 직책을 출력 
 
select DISTINCT JOB
from employee ;



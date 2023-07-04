/* Select 2*/

/* 함수 사용 하기 */

/* 
    오라클에서 제공해 주는 다양한 기본 제공된 함수 
    1. 문자 처리 함수 
    2. 숫자 처리 함수
    3. 날짜 처리 함수
    4. 변환 함수 
    5. 일반 함수 
*/


/*
    1. 문자 함수 :
            UPPER : 대문자로 변환 해주는 함수
            LOWER : 소문자로 변환 해주는 함수 
            INITCAP : 첫자만 대문자로 변환 해주는 함수             
*/

/*
    dual : 가상의 테이블 , 단일 함수를 처리 하기 위해 가상으로 만든 테이블, 
*/

Select UPPER ('Oracle mania')
from dual; /* 위의 내용을 담기 위한 가상의 테이블 */

Select UPPER ('Oracle mania') as 대문자
from dual;

Select LOWER ('Oracle mania') as 소문자 
from dual;

Select INITCAP ('oracle mania') as 첫자만대문자
from dual;

select ename as "이름(원본)", LOWER (ename) as 소문자, INITCAP(ENAME) AS 첫자만대문자
from employee;

--
SELECT *
FROM EMPLOYEE;

SELECT *
FROM EMPLOYEE
WHERE ENAME = UPPER('ward');  -- WARD 가 있는데 소문자라 검색 안됨 대문자로 전환후 검색

/*
    문자의 길이를 처리하는 함수 
    LENGTH : 글자수를 반환 (한글을 1byte)
    LENGTHB : 글자수를 반환 (한글을 3byte)로 처리     <== UTF-8
*/
-- 글자수를 리턴 
select Length ('Oracle mania') as 글자수
from dual;

--한글 1자는 3byte인데 Length는 1자로 출력 
select length ('오라클 매니아') as 글자수 
from dual;

select Lengthb('Oracle mania') as 글자수 
from dual;

-- LENGTHB: 한글 1자를 3byte로 처리 
select lengthB ('오라클 매니아') as 글자수 
from dual;

/*
    char, varchar2 => 1byte / nchar, nvarchar2 => 3byte
    char(6) : 영문 : 6자, 한글 : 2자 가능       <== 글자의 자릿수가 지정된 경우  : 주민번호(13), 은행비밀번호
    varchar2(6) : 영문 : 6자, 한글 : 2자 가능 <== 글자의 자릿수를 알수 없는 경우 : 주소, 메일주소 등  
    nchar(6) : 유니코드(한글, 일본어, 중국어) : 6자 가능     <==
    nvarchar2(6) : 유니코드(한글, 일본어, 중국어) : 6자 가능  
*/

-- Test01 테이블 생성 
create table test01 (
    name1 char(6)not null , 
    name2 varchar2(6) null,
    name3 nchar(6) null,
    name4 nvarchar2(6) null
    );
    
drop table test01;

desc test01;


-- test01 테이블에 값넣기 
-- name1, name2 : 영문 6자, 한글 2자 
-- name3, name4 : 영문 6자, 한글 6자

insert into test01 ( name1, name2, name3, name4)
values ('abcdef', 'hijklm', '가나다라마바', null);

insert into test01 ( name1, name2)
values ('오늘', '날씨');


select * from test01;

-- 실제 테이블의 글자수를 읽어오기 
select *from employee;
select ename, length(ename) as 이름의글자수
from employee;

/*
        CONCAT : 문자열을 연결 시켜주는 함수
        SUBSTR : 문자를 잘라내는 함수, 한글 1자를 1byte로 처리함. 
        SUBSTRB : 문자를 잘라내는 함수, 한글 1자를 3byte로 처리함. 
        INSTR: 특정 문자의 위치값을 반환 (한글 1byte) 
        INSTRB : 특정 문자의 위치값을 반환 (한글 3byte)
        LPAD : 글자 자릿수를 입력받고 나머지는 특정기호로 채움 (왼쪽)
        RPAD : 글자 자릿수를 입력받고 나머지는 특정기호로 채움 (오늘쪽)
        TRIM : 공백을 제거하는 함수 (앞, 뒤)
        RTRIM : 오른쪽의 공백을 제거하는 함수
        LTRIM : 왼쪽의 공백을 제거하는 함수
        
*/`


SELECT 'Oracle', 'mania',
            concat ('Oracle', 'mania')
from dual ;            

select * from employee;

select * from employee;

select ename, job, concat (ename, job) as 컬럼연결 from employee;

-- substr : 문자열을 잘라오는 함수 : substr(컬럼 , 4,3) -- 컬럼의 4번째 자리에서 3자를 잘라와서 출력
select substr('Oracle mania', 4,3)
from dual;

select substr('오라클 매니아', 4,3)
from dual;

select substr('Oracle mania', 5,3)
from dual;

select substrb('오라클 매니아', 4,3)
from dual;

select substrb('Oracle mania', 4,3)
from dual;

-- 실제 테이블에서 사용
select * from employee;

select hiredate, substr( hiredate, 1,2 ) as 연도만출력
from employee;

select hiredate, substr( hiredate, 1,2 ) as 연도만출력 , substr( hiredate, 4,2 ) as 월만출력,
substr( hiredate, 7,2 ) as 일만출력
from employee;

-- INSTR : 특정 문자의 위치를 출력 
-- Oracle mania 에서 a라는 단어가 들어간 자릿수 : 3
SELECT INSTR ('Oracle mania', 'a')
from dual; 

-- 4번째 자리 이후부터 검색 : a가 들어간 자릿수
SELECT INSTR ('Oracle mania', 'a', 4 )
from dual; 

--사원 이름 컬럼에 'k' 글자가 들어간 자릿수를 검색 : 검색이 되지 않는 경우 : 0
select ename, INSTR(ENAME, 'K')
FROM EMPLOYEE;

--LPAD : 컬럼 , 자릿수를 늘림 , '*' : 특수문자를 왼쪽에 출력
-- RPAD : 컬럼, 자릿수를 늘림, '*' : 특수문자를 오른쪽에 출력 
SELECT SALARY, LPAD(SALARY, 10,'*'), RPAD(SALARY, 10, '*')
FROM EMPLOYEE;


-- 주민번호(13자리) : 230627-1234567  : 전체 : 14자리 , 230627-1******
    -- substr를 사용해서 잘라내고, RPAD를 사용해서 오른쪽은 *로 처리 출력
    -- LENGTH함수를 사용
    -- DUAL 테이블을 적용해서 출력 
    select * from employee;
    
SELECT '230627-1234567' AS 주민번호, 
                RPAD(SUBSTR('230627-1234567',1,8), 
                LENGTH('230627-1234567'), '*') AS 주민번호2
FROM DUAL;

SELECT * FROM EMPLOYEE;

-- 이름, 입사일 년도월** 
SELECT ENAME AS 이름, RPAD(SUBSTR(HIREDATE,1,6),
                LENGTH(HIREDATE),'*') AS 입사년월
FROM EMPLOYEE;

-- TRIM을 사용해서 공백 제거  : DATABASE에 저장하기 전 CLIENT에서 문자열의 앞뒤 공백을 제거후 DB에 저장
SELECT  '           Oracle Mania         ' as 원본, 
        RTRIM('           Oracle Mania         ') AS 오른쪽공백제거,
        LTRIM('           Oracle Mania         ') AS 왼쪽공백제거,
        TRIM('           Oracle Mania         ') AS 양쪽공백제거
FROM DUAL;

/* 2. 숫자함수 
        ROUND : 특정 자릿수에서 반올림 처리 하는 함수 <== 연산시 소숫점 자리를 반올림해서 처리
                        5이상은 반올림, 5이하는 없앰.
        ROUND (대상) : 소숫점 뒷자리에서 반올림.
        ROUND (대상, 소숫점자릿수) : 
                    - 양수일때 : 소숫점 기준으로 오른쪽으로 이동해서 반올림, 그자릿수 뒤에서 반올림 <== 주의
                    - 음수일때 : 소숫점 기준으로 왼쪽으로 이동해서 반올림, 그자리에서 반올림
                    
        TRUNC : 특정 자릿수에서 잘라서 버림
        MOD : 나머지 값만 반환    
*/

SELECT 98.7654 AS 원본, 
        ROUND (98.7654),                 --99
        ROUND(98.7654, 2),                 -- 99.77 소숫점 2째자리에서 반올림
        ROUND(98.7654, 3),                 -- 99.77 소숫점 3째자리에서 반올림
        ROUND(98.7654, -2),              -- 99에서 반올림 100
        ROUND(98.7654, -1),              -- 99에서 반올림 100
        ROUND(98.7654,-3)              -- 0
FROM DUAL ;

SELECT ROUND(1234/34,2)
FROM DUAL;

-- 월 근로소득세를 출력 : 월급 * 0.033
SELECT SALARY, ROUND(SALARY*0.033, 1) AS 근로소득세
FROM EMPLOYEE;

--TRUNC : 특정 자리에서 버림 
SELECT TRUNC(98.7654),
        TRUNC(98.7654, 2),
        TRUNC(98.7654, -1),
        TRUNC(98.7654, 1)
FROM DUAL;

-- MOD (대상, 나누는 수) : 나머지값만 출력

-- 31을 나누어서 몫만 출력 , 나머지 출력 
SELECT ROUND ( 31/2 ) AS 몫만출력 , MOD(31, 2) AS 나머지만출력 
FROM DUAL;


1. 덧셈 연산자를 사용하여 모든 사원에 대해서 $300의 급여 인상을 계산한후 사원이름, 
급여, 인상된 급여를 출력하세요. 
SELECT ENAME 사원이름, SALARY 급여, SALARY+300 AS 인상된급여
FROM EMPLOYEE;

2. 사원의 이름, 급여, 연간 총 수입이 많은것 부터 작은순으로 출력 하시오. 
    연간 총 수입은 월급에 12를 곱한후 $100의 상여금을 더해서 계산 하시오.
SELECT ENAME 이름, SALARY 급여, 
            SALARY*12+100+NVL(COMMISSION,0) AS 연간총수입
FROM EMPLOYEE
ORDER BY 연간총수입 DESC;

3. 급여가 2000을 넘는 사원의 이름과 급여를 급여가 많은것 부터 작은순으로 출력하세요. 
SELECT ENAME 이름, SALARY 급여 
FROM EMPLOYEE
WHERE SALARY >=2000
ORDER BY SALARY DESC;


4. 사원번호가 7788인 사원의 이름과 부서번호를 출력하세요. 
SELECT ENAME 이름, DNO 부서번호
FROM EMPLOYEE
WHERE ENO=7788;

5. 급여가 2000에서 3000사이에 포함되지 않는 사원의 이름과 급여를 출력 하세요. 
SELECT ENAME 이름, SALARY 급여
FROM EMPLOYEE
WHERE SALARY<=1999 OR SALARY>=3001;

6. 1981년 2월 20일부터 81년 5월 1일 사이의 입사한 사원의 이름 담당업무, 입사일을 출력하시오
SELECT ENAME 이름, JOB 담당업무, HIREDATE 입사일
FROM EMPLOYEE
WHERE HIREDATE BETWEEN '81/02/20' AND '81/05/01';

7. 부서번호가 20및 30에 속한 사원의 이름과 부서번호를 출력하되 이름을 기준(내림차순)으로 출력하시오. 
SELECT ENAME 이름, DNO 부서번호
FROM EMPLOYEE
WHERE DNO=20 OR DNO=30
ORDER BY ENAME DESC;

8. 사원의 급여가 2000에서 3000사이에 포함되고 부서번호가 20 또는 30인 사원의 이름, 급여와 부서번호를 출력하되 이름을 오름차순으로 출력하세요. 
SELECT ENAME 이름, SALARY 급여, DNO 부서번호 
FROM EMPLOYEE
WHERE DNO=20 OR DNO=30 AND (SALARY BETWEEN 2000 AND 3000)
ORDER BY ENAME ASC;

9. 1981년도 입사한 사원의 이름과 입사일을 출력 하시오 ( like 연산자와 와일드 카드 사용 : _ , % )
SELECT ENAME AS 이름, RPAD( SUBSTR (HIREDATE,1,3), LENGTH(HIREDATE),'*' ) AS 입사일
FROM EMPLOYEE
WHERE HIREDATE LIKE '81%';

10. 관리자가 없는 사원의 이름과 담당업무를 출력하세요.
SELECT ENAME 이름, JOB 담당업무
FROM EMPLOYEE
WHERE MANAGER IS NULL;

11. 커밋션을 받을 수 있는 자격이 되는 사원의 이름, 급여, 커미션을 출력하되 
급여및 커밋션을 기준으로 내림차순 정렬하여 표시하시오.
SELECT ENAME 이름, SALARY 급여, COMMISSION 커미션
FROM EMPLOYEE
WHERE COMMISSION IS NOT NULL
ORDER BY SALARY DESC, COMMISSION DESC;

12. 이름이 세번째 문자인 R인 사원의 이름을 표시하시오.
SELECT ENAME 이름
FROM EMPLOYEE
WHERE ENAME LIKE '__R%';

13. 이름에 A 와 E 를 모두 포함하고 있는 사원의 이름을 표시하시오.
SELECT ENAME 이름
FROM EMPLOYEE
WHERE ENAME LIKE '%A%' AND ENAME LIKE '%E%'

14. 담당 업무가 사무원(CLERK) 또는 영업사원(SALESMAN)이며서 
    급여가 $1600, $950, 또는 $1300 이 아닌 사원의 이름, 담당업무, 급여를 출력하시오.
SELECT ENAME 이름, JOB 담당업무, SALARY 급여 
FROM EMPLOYEE
WHERE (JOB='CLERK' OR JOB='SALESMAN') AND SALARY NOT IN (1600,950,1300);

15. 커미션이 $500이상인 사원의 이름과 급여 및 커미션을 출력하시오.  
SELECT ENAME 이름, SALARY 급여, COMMISSION 커미션
FROM EMPLOYEE
WHERE COMMISSION >= 500;

SELECT* FROM EMPLOYEE;

-- JOB ASC, ENAME DESC
-- 두개 이상의 컬럼이 정렬될때, JOB 컬럼을 정렬후, JOB 컬럼의 중복되 ㄴ값에 대해서 ENAME DESC정렬됨
SELECT*
FROM EMPLOYEE
ORDER BY JOB ASC;

SELECT * 
FROM EMPLOYEE
ORDER BY JOB ASC, ENAME DESC;


/* 날짜 함수 
    SYSDATE:현재 시스템의 날짜를 출력 하는 함수
    MONTHS_BETWEEN : 두 날짜 사이의 개월 수를 출력
    ADD_MONTHS : 
    NEXT_DAY : 특정 날짜에서 초래하는 요일을 인자로 받아서 요일이 도래하는 날짜를 출력
    LAST_DAY ; 달의 마지막 날짜를 바환
    ROUND ; 날짜를 반올림하는 함수, 15일 이상 : 반올림, 15미만 : 삭제
    TRUNC : 날짜를 잘라내는 함수
*/

-- 현재 시스템의 날짜를 출력: 년/월/일
SELECT SYSDATE
FROM DUAL;

SELECT SYSDATE -1 AS 어제, SYSDATE  AS 오늘, SYSDATE +1 AS 내일
FROM DUAL;

SELECT * FROM EMPLOYEE;

-- 입사일로부터 오늘 날짜까지 근무일 출력 
SELECT ENAME AS 이름, HIREDATE 입사일, ROUND(SYSDATE-HIREDATE) AS 총근무일수
FROM EMPLOYEE;

-- 입사일로부터 1000일 지난 시점의 날짜를 출력.
SELECT ENAME 이름, HIREDATE 입사일, HIREDATE+1000 입사천일날짜
FROM EMPLOYEE;

-- 특정 날짜에서 월을 기준으로 출력
SELECT HIREDATE AS 원본, TRUNC(HIREDATE, 'MONTH'), ROUND(HIREDATE, 'MONTH')
FROM EMPLOYEE;

-- MONTHS_BETWEEN : 두 날짜 사이의 개월 수를 출력
-- 입사일로 부터 현재까지의 근무한 개월수를 출력 
SELECT ENAME, HIREDATE, 
             TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS "근무 개월수"
FROM EMPLOYEE;

-- DATE( 날짜타입)
-- ADD_MONTHS (날짜, 개월수) : 날짜에 개월수를 더하는 함수
-- 오늘 날짜에 100개월을 더한 날짜
SELECT ADD_MONTHS (SYSDATE, 100) AS "100개월후" , 
                SYSDATE+100 AS "100일후"
FROM DUAL;

-- 입사 후6개월이 지난 시점을 출력
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 6) AS "입사후 6개월 후"
FROM EMPLOYEE;

-- NEXT_DAY: 특정날짜에서 요일을 인풋으로 넣어서 도래하는 요일의 날짜를 출력
SELECT NEXT_DAY( SYSDATE, '금요일'),NEXT_DAY( SYSDATE, '월요일'),
                NEXT_DAY( SYSDATE, '수요일'), NEXT_DAY( SYSDATE, '토요일')
FROM DUAL;

-- LAST_DAY (DATE) : DATE 월의 마지막 날짜를 출력 (30일 OR 31일)
SELECT SYSDATE AS 오늘날짜, LAST_DAY(SYSDATE) AS 마지막날짜
FROM DUAL;

-- 사원테이블에서 입사일의 마지막 날짜를 출력
SELECT HIREDATE AS 입사일, LAST_DAY(HIREDATE)
FROM EMPLOYEE;

/* 형식 변환 함수
    TO_CHAR : 날짜, 숫자형을 문자형으로 변환
    TO_DATE : 문자형을 날짜형으로 변환
    TO_NUMBER : 문자형을 숫자로 변환
*/

-- TO_CHAR (DATE, 'YYYYMMDD') : 날짜형식을 'YYYYMMDD' 형식으로 뽑아와서 CHAR 형식으로 변환
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD')
FROM DUAL;




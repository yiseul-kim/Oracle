
/* DDL, DML, 제약조건 */ 

/*
SQL ( Structured Query Language) : 에스큐엘, 씨퀄, 구조화된 질의 언어 

select 컬럼명
from 테이블명[뷰]
where 조건
group by 컬럼[그룹핑]
having 조건[group by 결과의조건]
order by 정렬컬럼 

SQL 구문의 종류를 분류 

DDL (Data Definition Language)  : 객체(테이블, 계정,  함수, 뷰, 트리거, 저장프로시져, 인덱스, )를 생성하는 언어(구문)
                                : 스키마(틀, 객체) 를 생성하는 언어 
    - create (생성), alter (수정), drop (삭제) 
    
DML (Data Manipulation Language) : 테이블의 레코드(값)를 조작 언어 <== 트랜잭션을 발생 시킴 (commit, rollback) 
    -- 오라클에서는 트랜잭션 시작은 자동으로 작동됨. 
    -- 트랜잭션을 완료 해야한다. ( commit , rollback)  
        <== 트랜잭션을 완료하지 않으면 LOCK 이 걸려서 다른 사용자가 접근이 안됨
    - insert (입력), update (수정), delete (삭제)
    
DCL (Data Control Language) : 데이터 제어 언어, 계정에 권한을 부여,수정,제거 
    - grant (권한을 부여), revoke (권한을 취소) 
    
==============================================================

DQL (Data Query Language) : 데이타 질의 언어 (출력), 
    - Select 
TCL (Transaction Control Language ) : 트랜잭션 제어 언어 ,   <== DML 발생됨 
    -- begin transaction     : 트랜잭션 자동으로 시작 ( insert, update, delete) 
    
    -- commit [ transaction ]: 트랜잭션을 완료, 실제 DataBase 에 영구적으로 저장 
    -- rollback  [ transaction ] : 트랜잭션을 시작시점으로 되될림. 
    
    -- savepoint : 트랜잭션의 임시 저장 시점 설정 

*/ 

-- 테이블 생성 : create table 

create table dept (
    dno number(2) not null , 
    dname varchar2(50) not null, 
    loc varchar2 (13) null
); 

desc dept ;   -- 테이블 구조 확인  

-- 테이블에 값 넣기 
--begin transaction ; 
insert into dept ( dno , dname , loc ) 
values ( 10, '인사부', '서울'); 

rollback; 
commit ; 


select * from dept; 

/*
     트랜잭션 (Transaction) : 작업(일) 을 처리하는 최소 단위 
        -- DBMS : 네트워크를 통해서 여러 명의 사용자가 동시에 작업 
        -- 작업을 할때 LOCK 을 걸고 완료되면 LOCK을 풀어줌 
        -- DML 문에서 작동 , 
        -- 트랜잭션을 종료(commit, rollback) 하기 전까지는 LOCK 이 걸려서 다른 사용자의 접근을 차단 
        -- commit : RAM의 수정된 내용을 DB에 영구적으로 저장 
        -- rollback : 트랜잭션 시작 시점으로 되돌림.
        -- commit 전까지는 RAM 에서만 적용되어 있음. 
        -- log 에 기록됨 , "트랜잭션로그"   <== 백업시점이 아니라 오류시점까지 복구  
        
        -- 트랜잭션의 4가지 특징 
            -- ALL or NOTHING : 되면 전부 되게 하거나 아니면 원래로 되돌리거나 
           
           - 원자성 (Atomicity) : 일을처리하는 최소 단위 
           - 일관성 (Consistency) : 트랜잭션에서 처리한 결과는 일관성을 가진다.
           - 독립성 (lsolation) : 하나의 트랜잭션은 다른 트랜잭션과 격리 , LOCK 
           - 지속성 (Durability) : commit 트랜잭션은 DB에 저장된 
                
            A 가 B 에게 100억 입금 예   :  두 update 구문이 하나의 트랜Ъ퓽막 작동되어야함. 
            
            1. update 문을 사용해서 A 통장 100억을 출금 
            
            2. update 문을 사용해서 B 통장 100억을 입금 
        
*/ 

-- insert 문 
desc dept; 

insert into dept ( loc, dname, dno)
values ( '부산', '관리부', 20); 

-- 컬럼이 생략 되면 모든 컬럼에 값을 할당 
insert into dept 
values ( 30, '영업부' , null ) 

select * from dept; 

insert into dept (dno, dname) 
values ( 40, '광주'); 

commit; 

select * from dept; 

-- UPDATE : 수정     <=== 주의 : 반드시 where조건(Primary Key, Unique 컬럼 ) 을 사용해야 한다.  

update dept 
set dname = '제조부'
where dno = 40; 

rollback; 
commit; 

INSERT INTO DEPT (DNO, DNAME)
VALUES (40, '판매부');

-- DNO : WHERE 절 사용, 중복된 값이 저장되지 않는 컬럼을 사용 ( primary key, Unique )
UPDATE DEPT
SET DNAME = 'HR', LOC='대전'
WHERE DNO = 40;

-- 테이블에는 primary key 컬럼이 존재해야 한다.   <== 중복된 값을 넣을 수 없도록 제약을 설정


-- delete : 테이블의 특정 레코드 삭제 : 반드시 where조건(Primary Key, Unique 컬럼 ) 을 사용해야 한다.

delete dept
where dno=40;

commit; 

/* 제약 조건 : 컬럼에 부여되는 제약, primary key, Unique, Default, Not null, Check, 
            특정 컬럼에 무결성을 확보하기 위해서 부여 
    Primary key : 
            -- 중복된 값을 넣지 못하도록 설정. 
            -- not null 
            -- 테이블에 한번만 넣을 수 있다. 여러 컬럼에 하나의 단일키를 넣을 수 있다
            -- INDEX가 자동으로 생성된다. <== 검색을 빠르게 하기 위한
            -- UPDATE, DELATE 시 WHERE절에서 사용되는 컬럼
*/

CREATE TABLE MEMBER1 (
     ID VARCHAR2 (50) NOT NULL PRIMARY KEY ,
     PASS VARCHAR2(50) NOT NULL, 
     ADDR VARCHAR2(100) NULL, 
     PHONE VARCHAR2(30) NULL,
     AGE NUMBER(3) ,                -- 정수 3자리 
     WEIGHT NUMBER(5,2)         -- 실수 : 전체 5자리, 소숫점 이하 2자리 
);


-- Insert
insert into member1
values ('ddd', 'aaa', '서울', '010-1111-1111', 20, 70.55);

select * from member1;

commit ;

-- update 시 where조건에 primary key 컬럼을 조건으로 해서 처리

update member1 
set addr = '부산', phone='010-2222-2222', age=30, weight=88.55
where id= 'bbb';

-- delete 시 where조건에 primary key 컬럼을 조건으로 해서 처리
delete member1
where id='ccc';

create table member2(
    ID VARCHAR2 (50) NOT NULL PRIMARY KEY ,
     PASS VARCHAR2(50) NOT NULL unique, 
     ADDR VARCHAR2(100) NULL, 
     PHONE VARCHAR2(30) NULL unique, 
     AGE NUMBER(3) ,              
     WEIGHT NUMBER(5,2)        
);


/*
        데이터 사전 : 오라클에서 테이블에 대한 각종 정보를 저장한 테이블
        user_constraints
        select * from user_constraint
*/


-- Insert
insert into member2
values('bbbb', 'bbbbb', '서울', '010-2222-2222', 10, 70.55);

select * from member2;
commit;

-- 오라클의 데이터 사전을 사용해서 member2 테이블의 제약조건을 확인
show user;      -- 현재 접속한 계정 정보를 출력 : C##HR

select * from user_constraints 
where table_name = 'MEMBER2 ';


-- 테이블 생성시 제약 조건이름을 부여하면서 제약 조건 할당. 
-- 제약 조건 이름은 : PK_테이블이름_컬럼명

create table member3 (
    ID VARCHAR2 (50) NOT NULL CONSTRAINT PK_MEMBER3_ID  PRIMARY KEY ,
     PASS VARCHAR2(50) NOT NULL CONSTRAINT U_MEMBER3_PASS unique, 
     ADDR VARCHAR2(100) NULL, 
     PHONE VARCHAR2(30) NULL CONSTRAINT U_MEMBER3_PHONE unique, 
     AGE NUMBER(3) ,              
     WEIGHT NUMBER(5,2)        
);

-- Insert
insert into member3
values('BB', 'BB', '서울', '010-1111-2222', 10, 70.55);

select * from member3;
commit;

/* CHECK : 컬럼의 값을 체크  */
create table member4 (
    ID VARCHAR2 (50) NOT NULL CONSTRAINT PK_MEMBER4_ID  PRIMARY KEY ,
     PASS VARCHAR2(50) NOT NULL CONSTRAINT U_MEMBER4_PASS unique, 
     ADDR VARCHAR2(100) NULL, 
     PHONE VARCHAR2(30) NULL CONSTRAINT U_MEMBER4_PHONE unique, 
     AGE NUMBER(3) CONSTRAINT CK_MEMBER4_AGE CHECK ( AGE > 0 AND AGE < 150 ) ,            
     GENDER CHAR(1) CONSTRAINT  CK_MEMBER4_GENDER CHECK (GENDER IN ('W', 'M') ),
     WEIGHT NUMBER(5,2)        
);


-- 제약 조건 출력
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'MEMBER4';

-- Insert
insert into member4
values('B', 'B', '서울', '010-1111-2222', 20, 'M', 70.55);

select * from member4;
commit;

/* DEFAULT : 값을 넣지 않으면 DEFAULT로 설정된 값이 자동으로 들어감*/

create table member5 (
    ID VARCHAR2 (50) NOT NULL CONSTRAINT PK_MEMBER5_ID  PRIMARY KEY ,
     PASS VARCHAR2(50) NOT NULL CONSTRAINT U_MEMBER5_PASS unique, 
     ADDR VARCHAR2(100) DEFAULT '서울' NULL, 
     PHONE VARCHAR2(30) NULL CONSTRAINT U_MEMBER5_PHONE unique, 
     AGE NUMBER(3) NULL CONSTRAINT CK_MEMBER5_AGE CHECK ( AGE > 0 AND AGE < 150 ) ,            
     GENDER CHAR(1) NULL CONSTRAINT  CK_MEMBER5_GENDER CHECK (GENDER IN ('W', 'M') ),
     WEIGHT NUMBER(5,2) DEFAULT 10.00 NULL,
   HIREDATE DATE  DEFAULT SYSDATE
);

DROP TABLE MEMBER5;

-- Insert : DEFAULT 에 값 할당 : DEFAULT 키를 사용하는 경우 
--방법 1
insert into member5
values('B', 'B', DEFAULT, '010-1111-2222', 20, 'M', DEFAULT, DEFAULT);
--방법 2
insert into member5 (ID, PASS, PHONE, AGE, GENDER)
values('C', 'C', '서울', '010-1111-3333', 20, 'M', 70.55);

select * from member5;
commit;

/* Foreign Key : 부모 테이블의 특정컬럼을 참조해서 값을 넣도록 설정 
        - 부모 테이블의 primary key, Unique 키 컬럼을 참조 
        -  Foreign Key는 자식 테이블에 특정 컬럼에 넣는다. 

*/

-- employee  테이블의 dno 컬럼은 foreign key가 들어가 있어서 department 테이블의 dno 컬럼을 참조
-- employee 테이블의 dno 컬럼의 값을 할당할때 department 테이블의 dno 컬럼의 값을 참조후 할당.

select * from department ;      -- 부서 정보를 저장하는 테이블 (부모 테이블) dno  
select * from employee;         -- 사원 정보를 저장하는 테이블  (자식 테이블 : foreign key (dno)) 

desc employee;

-- EMPLOYEE의 DNO컬럼은 DEPARTMENT의 DNO를 참조함. 
insert into employee (eno, ename, job, manager, hiredate, salary, commission, dno)
values (8000, 'PJW', 'MANAGER', 7369, SYSDATE, 1000, 100, 40);

SELECT * FROM EMPLOYEE;
ROLLBACK;

/* FOREIGN KEY 실습 테이블 */

-- 부모 테이블 생성 ( PK, UK)
CREATE TABLE PARENTTBL (
    INFO NUMBER CONSTRAINT PK_PARENTTBL PRIMARY KEY, 
    NAME VARCHAR2 (20), 
    AGE NUMBER(3) CHECK( AGE>0 AND AGE<200 ),
    GENDER CHAR(1) CHECK( GENDER IN ('W', 'M'))
);

-- 부모 테이블의 더미(DUMY: 테스트할 값) 데이터 넣기
INSERT INTO PARENTTBL ( INFO, NAME, AGE, GENDER)
VALUES (10, '홍길동', 22, 'M'); 

INSERT INTO PARENTTBL ( INFO, NAME, AGE, GENDER)
VALUES (20, '이길동', 32, 'W'); 

INSERT INTO PARENTTBL ( INFO, NAME, AGE, GENDER)
VALUES (30, '김길동', 42, 'M'); 

INSERT INTO PARENTTBL ( INFO, NAME, AGE, GENDER)
VALUES (40, '송길동', 52, 'W'); 


COMMIT;
SELECT * FROM PARENTTBL;

-- 자식 테이블 생성 ( FK )  : 부모키가 먼저 만들어져 있어야 만들수 있음. 
CREATE TABLE CHILDTBL (
    ID VARCHAR2 (40) CONSTRAINT PK_CHILDTBL PRIMARY KEY, 
    PW VARCHAR2 (40) ,
    INFO NUMBER,
            CONSTRAINT FK_CHILDTBL_INFO FOREIGN KEY (INFO) REFERENCES PARENTTBL (INFO)
);

-- 자식 테이블의 더미 데이터 입력
INSERT INTO CHILDTBL (ID, PW, INFO)
VALUES ('AAA', 'AAA', 10);

INSERT INTO CHILDTBL (ID, PW, INFO)
VALUES ('BBB', 'AAA', 10);

INSERT INTO CHILDTBL (ID, PW, INFO)
VALUES ('CCC', 'AAA', 30);

INSERT INTO CHILDTBL (ID, PW, INFO)
VALUES ('DDD', 'AAA', 40);

SELECT * FROM CHILDTBL;







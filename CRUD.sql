
/* CRUD : Create, Read(=select), Update, Delets */

/* 테이블 생성 */
CREATE table myTest (
    idx number not null ,
    name varchar2(10) not null ,
    pass varchar2(50) not null , 
    addr varchar2(100) null,
    email varchar2(100) null
    );
    
/* 테이블의 내용을 출력  */
SELECT * FROM myTest;
    
/* 테이블에 값을 입력 */
insert into myTest (idx, name, pass, addr, email)
values ( 1, '홍길동', '1234', '서울', 'aaa@aaa.com');

insert into myTest (idx, name, pass, addr, email)
values ( 2, '홍길순', '1234', '부산', 'bbb@bbb.com');

commit;   --트랜잭션을 완료 데이터베이스의 상태를 변화시키기 해서 수행하는 작업의 단위

--  MS-SQL, MySQL : 자동 커밋 트랜잭션 (커밋 안쳐도 됨)

/* 기존의 테이블의 값을 수정 : update  는 where 조건을 처리 */
update mytest
set addr = '광주'
where idx = 2;

commit;

/* 기존의 테이블의 값을 삭제 : delate  */
DELETE myTest
where idx=2;

commit;



    
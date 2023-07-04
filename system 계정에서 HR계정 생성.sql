
-- Oracle의 한줄 주석
/*
    오라클의 여러줄 주석 
    
*/ 

-- 1. 계정을 생성 : ID:  HR, PW: 1234  <== 계정 명 앞에 C##을 붙여서 계정 생성(oracle 12버전)
create user C##HR IDENTIFIED by 1234
    default tablespace users            -- 객체를 저장 : USERS
    temporary tablespace TEMP;      -- 트랜잭션 로그 : TEMP

-- 2. 계정에게 권한을 부여, 
            --오라클에 접속할 수 있는 권한,  객체를 생성, 수정, 삭제
            
grant resource, connect to C##HR;
            
-- 3. 테이블 스페이스에 사용량(쿼터) 적용 

alter user C##HR quota unlimited on USERS;
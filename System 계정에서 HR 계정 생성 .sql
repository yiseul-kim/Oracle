
-- Oracle�� ���� �ּ� 
/* 
    ������ �ּ� 
    
*/

-- 1. ������ ���� : HR , 1234    <== ���� �� �տ� c## �� �ٿ��� ���� ����  ( Oracle 12����) 
create user C##HR identified by 1234
    default tablespace USERS        -- ��ü�� ���� : USERS
    temporary tablespace TEMP;      -- Ʈ����� �α� : TEMP 
    
-- 2. �������� ������ �ο�, ( 
        --����Ŭ�� ������ �� �ִ� ����, ��ü �� ����, ����, ���� )
        
grant resource, connect to C##HR; 

-- 3. ���̺� �����̽��� ��뷮(����) ���� 

alter user C##HR quota unlimited on USERS; 








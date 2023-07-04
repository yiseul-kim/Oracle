
-- Oracle�� ���� �ּ�
/*
    ����Ŭ�� ������ �ּ� 
    
*/ 

-- 1. ������ ���� : ID:  HR, PW: 1234  <== ���� �� �տ� C##�� �ٿ��� ���� ����(oracle 12����)
create user C##HR IDENTIFIED by 1234
    default tablespace users            -- ��ü�� ���� : USERS
    temporary tablespace TEMP;      -- Ʈ����� �α� : TEMP

-- 2. �������� ������ �ο�, 
            --����Ŭ�� ������ �� �ִ� ����,  ��ü�� ����, ����, ����
            
grant resource, connect to C##HR;
            
-- 3. ���̺� �����̽��� ��뷮(����) ���� 

alter user C##HR quota unlimited on USERS;
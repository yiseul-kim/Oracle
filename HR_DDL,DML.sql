
/* DDL, DML, �������� */ 

/*
SQL ( Structured Query Language) : ����ť��, ����, ����ȭ�� ���� ��� 

select �÷���
from ���̺��[��]
where ����
group by �÷�[�׷���]
having ����[group by ���������]
order by �����÷� 

SQL ������ ������ �з� 

DDL (Data Definition Language)  : ��ü(���̺�, ����,  �Լ�, ��, Ʈ����, �������ν���, �ε���, )�� �����ϴ� ���(����)
                                : ��Ű��(Ʋ, ��ü) �� �����ϴ� ��� 
    - create (����), alter (����), drop (����) 
    
DML (Data Manipulation Language) : ���̺��� ���ڵ�(��)�� ���� ��� <== Ʈ������� �߻� ��Ŵ (commit, rollback) 
    -- ����Ŭ������ Ʈ����� ������ �ڵ����� �۵���. 
    -- Ʈ������� �Ϸ� �ؾ��Ѵ�. ( commit , rollback)  
        <== Ʈ������� �Ϸ����� ������ LOCK �� �ɷ��� �ٸ� ����ڰ� ������ �ȵ�
    - insert (�Է�), update (����), delete (����)
    
DCL (Data Control Language) : ������ ���� ���, ������ ������ �ο�,����,���� 
    - grant (������ �ο�), revoke (������ ���) 
    
==============================================================

DQL (Data Query Language) : ����Ÿ ���� ��� (���), 
    - Select 
TCL (Transaction Control Language ) : Ʈ����� ���� ��� ,   <== DML �߻��� 
    -- begin transaction     : Ʈ����� �ڵ����� ���� ( insert, update, delete) 
    
    -- commit [ transaction ]: Ʈ������� �Ϸ�, ���� DataBase �� ���������� ���� 
    -- rollback  [ transaction ] : Ʈ������� ���۽������� �ǵɸ�. 
    
    -- savepoint : Ʈ������� �ӽ� ���� ���� ���� 

*/ 

-- ���̺� ���� : create table 

create table dept (
    dno number(2) not null , 
    dname varchar2(50) not null, 
    loc varchar2 (13) null
); 

desc dept ;   -- ���̺� ���� Ȯ��  

-- ���̺� �� �ֱ� 
--begin transaction ; 
insert into dept ( dno , dname , loc ) 
values ( 10, '�λ��', '����'); 

rollback; 
commit ; 


select * from dept; 

/*
     Ʈ����� (Transaction) : �۾�(��) �� ó���ϴ� �ּ� ���� 
        -- DBMS : ��Ʈ��ũ�� ���ؼ� ���� ���� ����ڰ� ���ÿ� �۾� 
        -- �۾��� �Ҷ� LOCK �� �ɰ� �Ϸ�Ǹ� LOCK�� Ǯ���� 
        -- DML ������ �۵� , 
        -- Ʈ������� ����(commit, rollback) �ϱ� �������� LOCK �� �ɷ��� �ٸ� ������� ������ ���� 
        -- commit : RAM�� ������ ������ DB�� ���������� ���� 
        -- rollback : Ʈ����� ���� �������� �ǵ���.
        -- commit �������� RAM ������ ����Ǿ� ����. 
        -- log �� ��ϵ� , "Ʈ����Ƿα�"   <== ��������� �ƴ϶� ������������ ����  
        
        -- Ʈ������� 4���� Ư¡ 
            -- ALL or NOTHING : �Ǹ� ���� �ǰ� �ϰų� �ƴϸ� ������ �ǵ����ų� 
           
           - ���ڼ� (Atomicity) : ����ó���ϴ� �ּ� ���� 
           - �ϰ��� (Consistency) : Ʈ����ǿ��� ó���� ����� �ϰ����� ������.
           - ������ (lsolation) : �ϳ��� Ʈ������� �ٸ� Ʈ����ǰ� �ݸ� , LOCK 
           - ���Ӽ� (Durability) : commit Ʈ������� DB�� ����� 
                
            A �� B ���� 100�� �Ա� ��   :  �� update ������ �ϳ��� Ʈ�������� �۵��Ǿ����. 
            
            1. update ���� ����ؼ� A ���� 100���� ��� 
            
            2. update ���� ����ؼ� B ���� 100���� �Ա� 
        
*/ 

-- insert �� 
desc dept; 

insert into dept ( loc, dname, dno)
values ( '�λ�', '������', 20); 

-- �÷��� ���� �Ǹ� ��� �÷��� ���� �Ҵ� 
insert into dept 
values ( 30, '������' , null ) 

select * from dept; 

insert into dept (dno, dname) 
values ( 40, '����'); 

commit; 

select * from dept; 

-- UPDATE : ����     <=== ���� : �ݵ�� where����(Primary Key, Unique �÷� ) �� ����ؾ� �Ѵ�.  

update dept 
set dname = '������'
where dno = 40; 

rollback; 
commit; 

INSERT INTO DEPT (DNO, DNAME)
VALUES (40, '�Ǹź�');

-- DNO : WHERE �� ���, �ߺ��� ���� ������� �ʴ� �÷��� ��� ( primary key, Unique )
UPDATE DEPT
SET DNAME = 'HR', LOC='����'
WHERE DNO = 40;

-- ���̺��� primary key �÷��� �����ؾ� �Ѵ�.   <== �ߺ��� ���� ���� �� ������ ������ ����


-- delete : ���̺��� Ư�� ���ڵ� ���� : �ݵ�� where����(Primary Key, Unique �÷� ) �� ����ؾ� �Ѵ�.

delete dept
where dno=40;

commit; 

/* ���� ���� : �÷��� �ο��Ǵ� ����, primary key, Unique, Default, Not null, Check, 
            Ư�� �÷��� ���Ἲ�� Ȯ���ϱ� ���ؼ� �ο� 
    Primary key : 
            -- �ߺ��� ���� ���� ���ϵ��� ����. 
            -- not null 
            -- ���̺� �ѹ��� ���� �� �ִ�. ���� �÷��� �ϳ��� ����Ű�� ���� �� �ִ�
            -- INDEX�� �ڵ����� �����ȴ�. <== �˻��� ������ �ϱ� ����
            -- UPDATE, DELATE �� WHERE������ ���Ǵ� �÷�
*/

CREATE TABLE MEMBER1 (
     ID VARCHAR2 (50) NOT NULL PRIMARY KEY ,
     PASS VARCHAR2(50) NOT NULL, 
     ADDR VARCHAR2(100) NULL, 
     PHONE VARCHAR2(30) NULL,
     AGE NUMBER(3) ,                -- ���� 3�ڸ� 
     WEIGHT NUMBER(5,2)         -- �Ǽ� : ��ü 5�ڸ�, �Ҽ��� ���� 2�ڸ� 
);


-- Insert
insert into member1
values ('ddd', 'aaa', '����', '010-1111-1111', 20, 70.55);

select * from member1;

commit ;

-- update �� where���ǿ� primary key �÷��� �������� �ؼ� ó��

update member1 
set addr = '�λ�', phone='010-2222-2222', age=30, weight=88.55
where id= 'bbb';

-- delete �� where���ǿ� primary key �÷��� �������� �ؼ� ó��
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
        ������ ���� : ����Ŭ���� ���̺� ���� ���� ������ ������ ���̺�
        user_constraints
        select * from user_constraint
*/


-- Insert
insert into member2
values('bbbb', 'bbbbb', '����', '010-2222-2222', 10, 70.55);

select * from member2;
commit;

-- ����Ŭ�� ������ ������ ����ؼ� member2 ���̺��� ���������� Ȯ��
show user;      -- ���� ������ ���� ������ ��� : C##HR

select * from user_constraints 
where table_name = 'MEMBER2 ';


-- ���̺� ������ ���� �����̸��� �ο��ϸ鼭 ���� ���� �Ҵ�. 
-- ���� ���� �̸��� : PK_���̺��̸�_�÷���

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
values('BB', 'BB', '����', '010-1111-2222', 10, 70.55);

select * from member3;
commit;

/* CHECK : �÷��� ���� üũ  */
create table member4 (
    ID VARCHAR2 (50) NOT NULL CONSTRAINT PK_MEMBER4_ID  PRIMARY KEY ,
     PASS VARCHAR2(50) NOT NULL CONSTRAINT U_MEMBER4_PASS unique, 
     ADDR VARCHAR2(100) NULL, 
     PHONE VARCHAR2(30) NULL CONSTRAINT U_MEMBER4_PHONE unique, 
     AGE NUMBER(3) CONSTRAINT CK_MEMBER4_AGE CHECK ( AGE > 0 AND AGE < 150 ) ,            
     GENDER CHAR(1) CONSTRAINT  CK_MEMBER4_GENDER CHECK (GENDER IN ('W', 'M') ),
     WEIGHT NUMBER(5,2)        
);


-- ���� ���� ���
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'MEMBER4';

-- Insert
insert into member4
values('B', 'B', '����', '010-1111-2222', 20, 'M', 70.55);

select * from member4;
commit;

/* DEFAULT : ���� ���� ������ DEFAULT�� ������ ���� �ڵ����� ��*/

create table member5 (
    ID VARCHAR2 (50) NOT NULL CONSTRAINT PK_MEMBER5_ID  PRIMARY KEY ,
     PASS VARCHAR2(50) NOT NULL CONSTRAINT U_MEMBER5_PASS unique, 
     ADDR VARCHAR2(100) DEFAULT '����' NULL, 
     PHONE VARCHAR2(30) NULL CONSTRAINT U_MEMBER5_PHONE unique, 
     AGE NUMBER(3) NULL CONSTRAINT CK_MEMBER5_AGE CHECK ( AGE > 0 AND AGE < 150 ) ,            
     GENDER CHAR(1) NULL CONSTRAINT  CK_MEMBER5_GENDER CHECK (GENDER IN ('W', 'M') ),
     WEIGHT NUMBER(5,2) DEFAULT 10.00 NULL,
   HIREDATE DATE  DEFAULT SYSDATE
);

DROP TABLE MEMBER5;

-- Insert : DEFAULT �� �� �Ҵ� : DEFAULT Ű�� ����ϴ� ��� 
--��� 1
insert into member5
values('B', 'B', DEFAULT, '010-1111-2222', 20, 'M', DEFAULT, DEFAULT);
--��� 2
insert into member5 (ID, PASS, PHONE, AGE, GENDER)
values('C', 'C', '����', '010-1111-3333', 20, 'M', 70.55);

select * from member5;
commit;

/* Foreign Key : �θ� ���̺��� Ư���÷��� �����ؼ� ���� �ֵ��� ���� 
        - �θ� ���̺��� primary key, Unique Ű �÷��� ���� 
        -  Foreign Key�� �ڽ� ���̺� Ư�� �÷��� �ִ´�. 

*/

-- employee  ���̺��� dno �÷��� foreign key�� �� �־ department ���̺��� dno �÷��� ����
-- employee ���̺��� dno �÷��� ���� �Ҵ��Ҷ� department ���̺��� dno �÷��� ���� ������ �Ҵ�.

select * from department ;      -- �μ� ������ �����ϴ� ���̺� (�θ� ���̺�) dno  
select * from employee;         -- ��� ������ �����ϴ� ���̺�  (�ڽ� ���̺� : foreign key (dno)) 

desc employee;

-- EMPLOYEE�� DNO�÷��� DEPARTMENT�� DNO�� ������. 
insert into employee (eno, ename, job, manager, hiredate, salary, commission, dno)
values (8000, 'PJW', 'MANAGER', 7369, SYSDATE, 1000, 100, 40);

SELECT * FROM EMPLOYEE;
ROLLBACK;

/* FOREIGN KEY �ǽ� ���̺� */

-- �θ� ���̺� ���� ( PK, UK)
CREATE TABLE PARENTTBL (
    INFO NUMBER CONSTRAINT PK_PARENTTBL PRIMARY KEY, 
    NAME VARCHAR2 (20), 
    AGE NUMBER(3) CHECK( AGE>0 AND AGE<200 ),
    GENDER CHAR(1) CHECK( GENDER IN ('W', 'M'))
);

-- �θ� ���̺��� ����(DUMY: �׽�Ʈ�� ��) ������ �ֱ�
INSERT INTO PARENTTBL ( INFO, NAME, AGE, GENDER)
VALUES (10, 'ȫ�浿', 22, 'M'); 

INSERT INTO PARENTTBL ( INFO, NAME, AGE, GENDER)
VALUES (20, '�̱浿', 32, 'W'); 

INSERT INTO PARENTTBL ( INFO, NAME, AGE, GENDER)
VALUES (30, '��浿', 42, 'M'); 

INSERT INTO PARENTTBL ( INFO, NAME, AGE, GENDER)
VALUES (40, '�۱浿', 52, 'W'); 


COMMIT;
SELECT * FROM PARENTTBL;

-- �ڽ� ���̺� ���� ( FK )  : �θ�Ű�� ���� ������� �־�� ����� ����. 
CREATE TABLE CHILDTBL (
    ID VARCHAR2 (40) CONSTRAINT PK_CHILDTBL PRIMARY KEY, 
    PW VARCHAR2 (40) ,
    INFO NUMBER,
            CONSTRAINT FK_CHILDTBL_INFO FOREIGN KEY (INFO) REFERENCES PARENTTBL (INFO)
);

-- �ڽ� ���̺��� ���� ������ �Է�
INSERT INTO CHILDTBL (ID, PW, INFO)
VALUES ('AAA', 'AAA', 10);

INSERT INTO CHILDTBL (ID, PW, INFO)
VALUES ('BBB', 'AAA', 10);

INSERT INTO CHILDTBL (ID, PW, INFO)
VALUES ('CCC', 'AAA', 30);

INSERT INTO CHILDTBL (ID, PW, INFO)
VALUES ('DDD', 'AAA', 40);

SELECT * FROM CHILDTBL;








/* CRUD : Create, Read(=select), Update, Delets */

/* ���̺� ���� */
CREATE table myTest (
    idx int not null ,
    name varchar(10) not null ,
    pass varchar(50) not null , 
    addr varchar(100) null,
    email varchar(100) null
    );
    
/* ���̺��� ������ ���  */
SELECT * FROM myTest;
    
/* ���̺� ���� �Է� */
insert into myTest (idx, name, pass, addr, email)
values ( 1, 'ȫ�浿', '1234', '����', 'aaa@aaa.com');

insert into myTest (idx, name, pass, addr, email)
values ( 2, 'ȫ���', '1234', '�λ�', 'bbb@bbb.com');

--Ʈ������� �Ϸ� �����ͺ��̽��� ���¸� ��ȭ��Ű�� �ؼ� �����ϴ� �۾��� ����

--  MS-SQL, MySQL : �ڵ� Ŀ�� Ʈ����� (Ŀ�� ���ĵ� ��)

/* ������ ���̺��� ���� ���� : update  �� where ������ ó�� */
update mytest
set addr = '����'
where idx = 2;

/* ������ ���̺��� ���� ���� : delate  */
DELETE myTest
where idx=2;



    
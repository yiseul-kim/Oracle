
/* CRUD : Create, Read(=select), Update, Delets */

/* ���̺� ���� */
CREATE table myTest (
    idx number not null ,
    name varchar2(10) not null ,
    pass varchar2(50) not null , 
    addr varchar2(100) null,
    email varchar2(100) null
    );
    
/* ���̺��� ������ ���  */
SELECT * FROM myTest;
    
/* ���̺� ���� �Է� */
insert into myTest (idx, name, pass, addr, email)
values ( 1, 'ȫ�浿', '1234', '����', 'aaa@aaa.com');

insert into myTest (idx, name, pass, addr, email)
values ( 2, 'ȫ���', '1234', '�λ�', 'bbb@bbb.com');

commit;   --Ʈ������� �Ϸ� �����ͺ��̽��� ���¸� ��ȭ��Ű�� �ؼ� �����ϴ� �۾��� ����

--  MS-SQL, MySQL : �ڵ� Ŀ�� Ʈ����� (Ŀ�� ���ĵ� ��)

/* ������ ���̺��� ���� ���� : update  �� where ������ ó�� */
update mytest
set addr = '����'
where idx = 2;

commit;

/* ������ ���̺��� ���� ���� : delate  */
DELETE myTest
where idx=2;

commit;



    
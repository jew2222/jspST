--<ScriptOptions statementTerminator=";"/>

create database lecdb;
--drop database lecdb;


drop table ȸ��;


create table ȸ��(
ȸ���	varchar (20)	NOT NULL,
ȸ��_������  varchar(20)   NULL,
��ǥ��  varchar(20)   NULL,
����о�  varchar(20)   NULL,
�����  int   NULL,
������  int   NULL,
ä��Ը�  int   NULL,  

primary key (ȸ���)
);

--ä��Ը� = 2021�⵵ �ű�ä���ο� �Ը�


insert into ȸ��
values('īī��','����','����','����',2000,500,100),
('���̹�','����','����','��',3000,1000,200),
('����','�̱�','�ٴ�','��',7000,5000,400),
('����Ʈ','��⵵','���','��',2000,3000,200),
('����','�̱�','����','�����',7000,5000,400),
('���','�̱�','�ٹ�','SW',6000,3000,100);

--ȸ�� DB�� ���ʷ��� DDL �� �����
--�ڹ� ����� �ʵ带 ó���ؾ� �� 
--5�� �̻� insert

--�ڹٺ��� + DBCP �� �����ͺ��̽� ���� 
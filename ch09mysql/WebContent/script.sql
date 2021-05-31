drop database mydb;

create database mydb;

CREATE TABLE member (
	id                  varchar(20)          NOT NULL  ,
	passwd              varchar(20)          NULL      ,
	name                varchar(20)          NULL      ,
	mem_num1            varchar(6)           NULL      ,
	mem_num2            varchar(7)           NULL      ,
	e_mail              varchar(30)          NULL      ,
	phone               varchar(30)          NULL      ,
	zipcode             varchar(7)           NULL      ,
	address             varchar(60)          NULL      ,
	job                 varchar(30)          NULL      ,
	PRIMARY KEY ( id )
);

INSERT INTO MEMBER (id, passwd, name, mem_num1, mem_num2, e_mail, phone, zipcode, address, job) 
VALUES ('combachi', '11111111', 'kang', '880229', '1077818','combachi@hanmail.net',
        '011-123-1111', '333-111', 'seoul', 'development');

INSERT INTO MEMBER (id, passwd, name, mem_num1, mem_num2, e_mail, phone, zipcode, address, job) 
VALUES ('com', '11111111', 'ȫ�浿', '880229', '1077818','combachi@hanmail.net',
        '011-123-1111', '333-111', 'seoul', 'development');

select * from member;

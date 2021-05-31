--<ScriptOptions statementTerminator=";"/>

--create database lecdb;

create table 회사(
'회사명'	varchar (20)	NOT NULL,
'회사 소재지'  varchar(20)   NULL,
'대표자'  varchar(20)   NULL,
'사업분야'  varchar(20)   NULL,
'매출액'  int   NULL,
'직원수'  int   NULL,
'2021년도 신규채용인원 규모'  int   NULL,

primary('회사명')
);

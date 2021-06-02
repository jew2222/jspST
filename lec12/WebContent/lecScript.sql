--<ScriptOptions statementTerminator=";"/>

create database lecdb;
--drop database lecdb;


drop table 회사;


create table 회사(
회사명	varchar (20)	NOT NULL,
회사_소재지  varchar(20)   NULL,
대표자  varchar(20)   NULL,
사업분야  varchar(20)   NULL,
매출액  int   NULL,
직원수  int   NULL,
채용규모  int   NULL,  

primary key (회사명)
);

--채용규모 = 2021년도 신규채용인원 규모


insert into 회사
values('카카오','서울','가가','어플',2000,500,100),
('네이버','서울','나나','웹',3000,1000,200),
('구글','미국','다다','웹',7000,5000,400),
('네이트','경기도','라라','웹',2000,3000,200),
('애플','미국','마마','모바일',7000,5000,400),
('어도비','미국','바바','SW',6000,3000,100);

--회사 DB를 제너레잇 DDL 로 만들고
--자바 빈즈로 필드를 처리해야 함 
--5행 이상 insert

--자바빈즈 + DBCP 로 데이터베이스 접속 
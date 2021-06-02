--<ScriptOptions statementTerminator=";"/>

create database lecdb;
--drop database lecdb;
--drop table 회사;


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





--insert into '회사명','회사소재지','대표자' values('네이버','카카오','애플','구글','어도비','일렉트로닉스')





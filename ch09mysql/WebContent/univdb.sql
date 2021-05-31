--create database univdb;--

create table student (
	id		varchar(20) NOT NULL,
	passwd  varchar(20) NOT NULL,
	name    varchar(20) NOT NULL,
	year	int			NULL,	
	snum	varchar(10) NULL,
	depart	varchar(20) NULL,
	mobile1 char(3)  	NULL,
	mobile2 varchar(10) NULL,
	address varchar(65) NULL,
	email   varchar(30) NULL,
	PRIMARY KEY ( id )
);

insert into student (id, passwd, name) values ('1','adfd','afdfdd');
insert into student (id, passwd, name) values ('2','avfvdvvd','afdfdd');
insert into student (id, passwd, name) values ('3','dffdd','afdfdfsdd');

insert into student (id, passwd, name) values ('4','absdgvf','afdfdfddd');
insert into student (id, passwd, name) values ('5','fvfd','affgdfvsd');

--select * from student
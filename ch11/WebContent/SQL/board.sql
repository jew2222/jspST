create database univdb;

create table board (
	id		int				NOT NULL	PRIMARY KEY	auto_increment,
	name    varchar(20)     NOT NULL,
	passwd  varchar(20)     NOT NULL,
	title	varchar(100)	NULL,	
	email   varchar(30)     NULL,
	regdate	datetime		NULL,
	content	text			NULL 
);

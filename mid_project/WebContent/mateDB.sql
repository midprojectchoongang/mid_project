create table master (
master_id varchar2(10) primary key,
password varchar2(14)
);

insert into master values('master', '1234');

create table notice (
notice_no number(8) primary key,
subject varchar2(30),
content varchar2(500),
reg_date date not null,
del char(1) default 'n'
);

select * from notice;

create table location (
location_no number(3) primary key,	-- 지역번호(서울은 2)
local_name varchar2(10) not null
);

insert into location values (2,'서울');
insert into location values (31,'경기');
insert into location values (32,'인천');
insert into location values (41,'충남');
insert into location values (42,'대전');
insert into location values (43,'충북');
insert into location values (44,'세종');
insert into location values (51,'부산');
insert into location values (52,'울산');
insert into location values (53,'대구');
insert into location values (54,'경북');
insert into location values (55,'경남');
insert into location values (61,'전남');
insert into location values (62,'광주');
insert into location values (63,'전북');
insert into location values (64,'제주');

select * from location;

create table shelter (
shelter_no number primary key,
location_no number(3) references location(location_no),
name varchar2(50) not null,
tel varchar2(20) not null,
del char(1) default 'n'
);

create table largecate (
largecate_id char(1) primary key,	-- d(강아지) c(고양이)
largecate_name varchar2(10) not null
);

insert into largecate values ('d', 'dog');
insert into largecate values ('c', 'cat');

create table smallcate (
largecate_id char(1) references largecate(largecate_id),
smallcate_id char(2) primary key,	-- d1/d2/d3(강아지) c1/c2(고양이) 
smallcate_name varchar2(30) not null
);

insert into smallcate values ('d','d1','large');
insert into smallcate values ('d','d2','medium');
insert into smallcate values ('d','d3','small');
insert into smallcate values ('c','c1','long');
insert into smallcate values ('c','c2','short');

create table member (
member_id varchar2(20) primary key,
password varchar2(30) not null,
name varchar2(10) not null,
gender char(1) not null,	-- f/m
email varchar2(50) not null,
tel varchar2(20) not null,
location_no number(3) references location(location_no),
experience char(1) not null,	-- y/n
reg_date date not null,
del char(1) default 'n'
);

select * from member;

create sequence free_seq;

create table free_board (
free_no number primary key,
member_id varchar2(20) references member(member_id),
category char(1) not null,	-- f(잡담)/i(정보)/a(입양후기)
subject varchar2(50) not null,
free_image1 varchar2(50),
free_image2 varchar2(50),
free_image3 varchar2(50),
free_image4 varchar2(50),
free_image5 varchar2(50),
content varchar2(2000) not null,
reg_date date not null,
del char(1) default 'n'
); 

select * from free_board;

create table free_scrap (
member_id varchar2(20) references member(member_id),
free_no number references free_board(free_no),
primary key(member_id, free_no),
subject varchar2(50) not null,
reg_date date not null,
del char(1) default 'n'
);

create sequence comments_seq;

create table comments (
comment_no number primary key,
member_id varchar2(20) references member(member_id),
free_no number references free_board(free_no),
ref number not null,
re_step number not null,
re_level number not null,
reg_date date not null,
del char(1) default 'n'
);

create sequence adopt_seq;

create table adopt_board (
adopt_no number primary key,
member_id varchar2(20) references member(member_id),
largecate_id char(1) references largecate(largecate_id),
smallcate_id char(2) references smallcate(smallcate_id),
location_no number(3) not null,
subject varchar2(50) not null,
adopt_image1 varchar2(50),
adopt_image2 varchar2(50),
adopt_image3 varchar2(50),
adopt_image4 varchar2(50),
adopt_image5 varchar2(50),
content varchar2(2000) not null,
applier_count number(3) default 0,
reg_date date not null,
del char(1) default 'n'
);

create table adopt_scrap (
member_id varchar2(20) references member(member_id),
adopt_no number references adopt_board(adopt_no),
primary key(member_id, adopt_no),
largecate_id char(1) not null,
smallcate_id char(2) not null,
location_no number(3) not null,
subject varchar2(50) not null,
reg_date date not null,
del char(1) default 'n'
);

create sequence application_seq;

create table application (
application_no number primary key,
member_id varchar2(20) references member(member_id),
adopt_no number references adopt_board(adopt_no),
largecate_id char(1) not null,
smallcate_id char(2) not null,
location_no number(3) not null,
subject varchar2(50) not null,
gender char(1) not null,
email varchar2(50) not null,
tel varchar2(20) not null,
experience char(1) not null,
content varchar2(2000) not null,
reg_date date not null,
del char(1) default 'n'
);
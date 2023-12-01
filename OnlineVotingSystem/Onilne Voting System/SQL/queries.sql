-- create database onlineVotingDB;
use onlineVotingDB;

create table admin(adminId int auto_increment not null , adminName varchar(30) not null, 
adminPass varchar(30) not null , primary key (adminId));

Create table temp_vc_number(id int auto_increment not null
,voter_card_number varchar(30) not null,primary key(id));

 
 Create table vote(id int auto_increment not null
,voter_card_number varchar(30) not null,partie varchar(30) not null,primary key(id));

 
 Create table voters(vid int auto_increment not null , name varchar(30) not null, 
pnumber varchar(30) not null,email varchar(30) not null, voter_card_number varchar(30) not null ,
address varchar(30) not null, date_of_birth varchar(30) not null ,primary key (vid));

Create table contact(cid int auto_increment not null , name varchar(30) not null, 
pnumber varchar(30) not null,email varchar(30) not null, comment varchar(30) not null ,primary key (cid));

select * from vote;
select * from voters;
select * from temp_vc_number;
select* from contact;
select partie,count(partie) as c from vote group by partie;
select partie,count(partie) as c from vote group by partie limit 3;
select partie,count(partie) as c from vote group by partie order by c desc limit 3;

insert into admin (adminName,adminPass) values ("bharat","password");
insert into temp_vc_number (voter_card_number) values('0000000000');

delete from temp_vc_number where id = 1;

set sql_safe_updates = 0;
set sql_safe_updates = 1; 
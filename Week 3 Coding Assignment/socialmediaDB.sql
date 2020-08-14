create database if not exists socialmediadb;

use socialmediadb;

drop table if exists comment;
drop table if exists post;
drop table if exists user;

create table user (
	id int(11) not null auto_increment,
	username varchar(20) not null,
	password varchar(20) not null,
	email varchar(30) not null,
	primary key (id)
);

create table post (
	id int(11) not null auto_increment,
	user_id int(11) not null,
	time_stamp datetime default current_timestamp,
	content varchar(255) not null,
	primary key (id),
	foreign key (user_id) references user(id)
);

create table comment (
	post_id int(11) not null,
	user_id int (11) not null,
	time_stamp datetime default current_timestamp,
	content varchar(255) not null,
	primary key (post_id, user_id),
	foreign key (post_id) references post(id),
	foreign key (user_id) references user(id)
);
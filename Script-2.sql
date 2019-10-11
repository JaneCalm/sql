drop database if exists vk;
create database vk;
use vk;

drop database if exists users;
create table users(
	id SERIAL PRIMARY KEY,
	firstname VARCHAR(100),
	lastname VARCHAR(100) comment 'Фамилия',
	email VARCHAR(120) UNIQUE,
	password_hash VARCHAR(100),
	phone bigint,
	

	
	);

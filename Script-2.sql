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
	
	INDEX (phone),
	INDEX (firstname, lastname)
);

drop database if exists `profiles`;
create table `profiles`(
	user_id SERIAL PRIMARY KEY,
	gender CHAR(1),
	birthday DATE,
	photo_id BIGINT UNSIGNED NULL,
	hometown VARCHAR(100),
	created_at DATETIME DEFAULT NOW()
);

alter table `profiles`
	add constraint fk_user_id
	foreign key (user_id) references users(id)
	on update CASCADE
	on delete RESTRICT
;

drop database if exists messages;
create table messages(
	user_id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	created_at DATETIME DEFAULT NOW(),
	
	index(from_user_id),
	index (to_user_id),
	foreign key(from_user_id) references users(id),
	foreign key (to_user_id) references users(id)
);

drop database if exists friend_requests;
create table friend_requests(
	 initiator_user_id BIGINT UNSIGNED NOT NULL,
	 target_user_id BIGINT UNSIGNED NOT NULL,
	 status ENUM('requested', 'approved', 'declined', 'unfiended'),
	 requested_at DATETIME DEFAULT NOW(),
	 updated_at DATETIME,
	 
	 primary key (initiator_user_id, target_user_id),
	 index (initiator_user_id),
	 index (target_user_id),
	 foreign key (initiator_user_id) references users(id),
	 foreign key (target_user_id) references users(id)
);

drop database if exists communities;
create table communities(
	id SERIAL PRIMARY KEY,
	name VARCHAR(150),
	
	INDEX (name)
);








	
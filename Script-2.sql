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

drop table if exists users_communities;
create table users_communities(
	user_id BIGINT UNSIGNED NOT NULL,
	community_id BIGINT UNSIGNED NOT NULL,
	
	primary key (user_id, community_id),
	foreign key (user_id) references users(id),
	foreign key (community_id) references communities(id)
);

drop table if exists media_types;
create table media_types(
	id SERIAL PRIMARY KEY,
	name VARCHAR(150),
	created_at DATETIME DEFAULT NOW()
);

drop table if exists media;
create table media(
	id SERIAL PRIMARY KEY,
	media_type_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	filename VARCHAR(255),
	`size` int,
	metadata JSON,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT current_timestamp ON UPDATE current_timestamp,
	
	index(user_id),
	foreign key (user_id) references users(id),
	foreign key (media_type_id) references media_types(id)
);

ALTER TABLE vk.profiles ADD CONSTRAINT profiles_FK_1 FOREIGN KEY (photo_id) REFERENCES vk.media(id);

drop table if exists likes;
create table likes(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	media_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW()	
);

ALTER TABLE vk.likes ADD CONSTRAINT likes_FK FOREIGN KEY (user_id) REFERENCES vk.users(id);
ALTER TABLE vk.likes ADD CONSTRAINT likes_FK_1 FOREIGN KEY (media_id) REFERENCES vk.media(id);

	
drop table if exists photo_albums;
create table photo_albums(
	id SERIAL PRIMARY KEY,
	name VARCHAR(150),
	user_id BIGINT UNSIGNED NOT NULL,
	
	foreign key (user_id) references users(id)	
);

drop table if exists photos;
create table photos(
	id SERIAL PRIMARY KEY,
	album_id BIGINT UNSIGNED NOT NULL,
	media_id BIGINT UNSIGNED NOT NULL,
	
	foreign key (album_id) references photo_albums(id),
	foreign key (media_id) references media(id)	
);





	
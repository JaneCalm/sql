INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES 
('101', 'Nia', 'Stamm', 'jaylen02@wintheiser.biz', '476335f3c92d6c1ee92356ee5442d9355e7e0a4d', '8731320617'),
('102', 'Domenica', 'Goyette', 'lemuel.herzog@gmail.com', 'd306324e4db23e5d762ff965a6fd96a1c7d9161a', '909801'),
('103', 'Jon', 'Bayer', 'd\'angelo26@hotmail.com', 'd1496babafc546ac51642690a567ab76a7db9e0f', '71'),
('104', 'Joshua', 'Braun', 'stamm.santina@hotmail.com', '622085a05a5b4487d6cb57a0b995d132ba040977', '831'),
('105', 'Shania', 'Grimes', 'terrence84@yahoo.com', '9ad5b68240fa6820454f4b4065dfcc3316075688', '1'),
('106', 'Samara', 'Altenwerth', 'aletha69@dibbertjones.com', 'c9a2bac7b695681ef3c9cba2d51918a1a1d67635', '2926108233'),
('107', 'Murray', 'Torphy', 'kozey.jennifer@yahoo.com', 'edda49fea22c8908bea702155aa5344a45bb0b10', '527829'),
('108', 'Hulda', 'Gottlieb', 'bailey.hand@zboncak.com', 'f03685125fbeee5566439a0700f454c872dca913', '88'),
('109', 'Christelle', 'Collins', 'bahringer.kristin@yahoo.com', '4e857d8199b6d11c0726c068d9e55796f4e00098', '597065')
;

insert into `messages` VALUES
('101', '101', '102', 'Alice with one finger for the moment he was in the distance.',DEFAULT,0),
('102', '101', '103', 'Alice with one finger for the moment he was in the distance. ',DEFAULT,0),
('103', '101', '104', 'Alice with one finger for the moment he was in the distance.',DEFAULT,0),
('104', '101', '105', 'Alice with one finger for the moment he was in the distance.',DEFAULT,0),
('105', '101', '106', 'Alice with one finger for the moment he was in the distance.',DEFAULT,0)
;

delete from messages
where from_user_id = 1;

update messages
set is_deleted = 1
where from_user_id = 1;

TRUNCATE messages;


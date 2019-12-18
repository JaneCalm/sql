/*
1 Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
 */

UPDATE try.users
	SET created_at=NULL;
UPDATE try.users
	SET updated_at=NULL;

UPDATE try.users
	SET created_at=CURRENT_TIMESTAMP;
UPDATE try.users
	SET updated_at=CURRENT_TIMESTAMP;
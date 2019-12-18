/*
2 Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". 
Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
 */
use try;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(255),
  updated_at VARCHAR(255)
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES
  ('Геннадий', '1990-10-05', '20.10.2017 8:10', '20.10.2019 8:10'),
  ('Наталья', '1984-11-12', '20.10.2007 8:10', '20.10.2019 8:10'),
  ('Александр', '1985-05-20', '20.10.1997 8:10', '20.10.2019 8:10'),
  ('Сергей', '1988-02-14',  '21.10.2017 8:10', '20.10.2019 8:10'),
  ('Иван', '1998-01-12', '20.11.2017 8:10', '20.10.2019 8:10'),
  ('Мария', '1992-08-29', '20.09.2017 8:10', '20.10.2019 8:10');
 
 
UPDATE users  
	SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i');

ALTER TABLE users 
MODIFY COLUMN created_at datetime;

UPDATE users  
	SET updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');

ALTER TABLE users 
MODIFY COLUMN updated_at datetime;
  
 
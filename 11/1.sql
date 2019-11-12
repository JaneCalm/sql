use shop;

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	name_tabl VARCHAR(255) COMMENT 'Имя таблицы',
	name_col VARCHAR(255),
	from_id INT UNSIGNED,
	ar_created_at DATETIME DEFAULT CURRENT_TIMESTAMP
)
ENGINE=ARCHIVE;


Drop TRIGGER if EXISTS logsu;
DELIMITER //
CREATE TRIGGER logsu AFTER INSERT ON users FOR EACH ROW
begin
	INSERT INTO shop.logs select 'users', name, id, created_at from shop.users where id=NEW.id;
 END//
 
DELIMITER ;

Drop TRIGGER if EXISTS logsp;
DELIMITER //
CREATE TRIGGER logsp AFTER INSERT ON products FOR EACH ROW
begin
	INSERT INTO shop.logs select 'products ', name, id, created_at from shop.products where id=NEW.id;
 END//
 
DELIMITER ;

Drop TRIGGER if EXISTS logsc;
DELIMITER //
CREATE TRIGGER logsc AFTER INSERT ON catalogs FOR EACH ROW
begin
	DECLARE CONTINUE HANDLER
      FOR SQLSTATE '21S01'
      BEGIN END;
	INSERT INTO shop.logs (name_tabl, name_col, from_id) select 'catalogs', name, id from shop.catalogs where name=NEW.name;
 END//
 
DELIMITER ;

INSERT INTO users (name, birthday_at) VALUES
  ('Катя', '1990-10-05'),
  ('Вася', '1984-11-12')
;
 
INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('Intel Core i3-810', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-740', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1);
 
INSERT INTO catalogs VALUES
  (NULL, 'мыши'),
  (NULL, 'клавиатуры');

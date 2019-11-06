/*Практическое задание по теме “Транзакции, переменные, представления”
В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.

Практическое задание по теме “Хранимые процедуры и функции, триггеры"
Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема.
 Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.
*/


START TRANSACTION;
insert into sample.users (name,birthday_at,created_at,updated_at) 
select t.name, t.birthday_at, t.created_at, t.updated_at
from (
select * from shop.users as sh where sh.id = 1)t;
COMMIT;

#2

use shop;

create OR REPLACE VIEW names as 
select p.name as 'products name', c.name as 'catalogs name'
from products p 
join catalogs c on c.id = p.catalog_id
;

select * from names;

#3
delimiter //

DROP FUNCTION IF EXISTS hello//
create FUNCTION hello()
RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
DECLARE i VARCHAR(20);
DECLAre t INT;
set t = (SELECT DATE_FORMAT(now(), '%H'));
	if (t BETWEEN '6' AND '11') then 
		set i = 'Доброе утро';
	elseif 	(t BETWEEN '12' AND '17') then 
		set i = 'Добрый день';
	elseif 	(t BETWEEN '18' AND '25') then 
		set i = 'Добрый вечер';
	else 
		set i = 'Доброй ночи';
	end if;
RETURN i;
END//
select hello()//


#4 застряла на этой задаче, не понимаю как дальше

drop trigger if EXISTS check_catalog_id_insert//

CREATE TRIGGER check_catalog_id_insert AFTER UPDATE ON products
FOR EACH ROW
BEGIN 
select @h := concat (products.name, ' ', products.description) from products where new.name <> old.name ;
if @h = 'NULL' THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'DELETE canceled';
end if;
END//


UPDATE products SET name = NULL WHERE id = '3'//
UPDATE products SET description = NULL WHERE id = '3'//
SELECT * FROM products//







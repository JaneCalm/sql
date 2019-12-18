/*
3 В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы.
 Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.

 */
use try;

INSERT INTO storehouses_products (storehouse_id,product_id,value)
	VALUES 
	(1,1,1),
	(1,2,0),
	(2,4,50),
	(2,78,23),
	(2,98,0);

select * from storehouses_products ORDER BY value = 0 ASC, value ASC;



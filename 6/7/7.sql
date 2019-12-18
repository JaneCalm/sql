/*
Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
Выведите список товаров products и разделов catalogs, который соответствует товару.
*/
use try;

select 
	u.name
from
	users as u
join 
	orders as o_u
where 
	u.id = o_u.user_id
group by 
	name
;

SELECT
	products.name as name,
	catalogs.name as catalogs
from
	products
JOIN
	catalogs
WHERE
	products.catalog_id = catalogs.id
;



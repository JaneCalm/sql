use try;

/*
  Подсчитайте средний возраст пользователей в таблице users
  
SELECT
  floor(AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW()))) AS birthday_at
FROM
	 users;

 Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.
 */


select COUNT(*), dayname(DATE_FORMAT(birthday_at, '2019.%m.%d')) AS day
FROM	
	users
GROUP BY
	day
; 


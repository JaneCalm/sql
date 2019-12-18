/*• - Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
• - Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..
• - Определить кто больше поставил лайков (всего) - мужчины или женщины?
*/

use vk;

select 
count(*) as cnt,
from_user_id  from(
	select
		from_user_id, to_user_id
	from messages as m
	where from_user_id in(
		select initiator_user_id from friend_requests  as fr where target_user_id = 1 and status = 'approved'	
		 	UNION
		 select target_user_id from friend_requests  as fr where initiator_user_id = 1 and status = 'approved'	
	) and to_user_id = 1) t
group by from_user_id, to_user_id
order by cnt DESC
limit 1;

select 
	count(*)
from likes as l
where id = media_id in(
select id  

SELECT
	TIMESTAMPDIFF(YEAR, birthday, now()) as age < 10
from profiles as p
)
;



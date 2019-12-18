
select 
	firstname,
	lastname,
	(select hometown from profiles as p where user_id = 2) as 'city',
	(select filename from media where id =
		(select photo_id from profiles where user_id = 2)
	)	as'main_photo'
from users
where id = 2;

select *
from media_types as nt
where name like '_i%';

desc media;

select filename
from media
where user_id = (select id from users where email = 'jaylen02@wintheiser.biz')
	 and media_type_id = (select id from media_types as mt where name = 'photo')
;

select *
from media as m
where user_id = 3
	and media_type_id = 3;

select count(*) as 'photos'
from media as m
where user_id = 3
	 and media_type_id = (select id from media_types as mt where name = 'photo');
	
 select 
 	MONTHNAME(created_at) as month_name,
 	count(*) as cnt
 from media as m
 group by month_name
 ;
 
select 
	 count(*) as cnt,
	 user_id
from media
where user_id = 1
group by user_id
having cnt > 1
;

select *
from friend_requests as fr
WHERE
 (initiator_user_id = 89 or target_user_id = 89)
 and status = 'approved'

select *
from media
where user_id = 46
	union
select *
from media as m
where user_id in (
	select initiator_user_id from friend_requests  as fr where target_user_id = 46 and status = 'approved'	
	 	UNION
	 select target_user_id from friend_requests  as fr where initiator_user_id = 46 and status = 'approved'	
)
order by created_at desc
limit 1 offset 1
;

select
	media_id,
	count(*)
from likes as l
where media_id in (
	select id from media where user_id = 1
)
group by media_id
;

select *
from messages as m
where from_user_id = 1
	 or to_user_id = 1
order by created_at desc;

select *
from messages as m
where from_user_id = 1
	 and is_read = 0
order by created_at desc;

update messages
set is_read = 1
where created_at < date_sub(now(), interval 100 day)
	and to_user_id = 1
;

SELECT
	user_id,
	case (gender)
		when '1' then 'male'
		else 'female'
	end	as gender,
	TIMESTAMPDIFF(YEAR, birthday, now()) as age
from profiles as p
where user_id in(
	select initiator_user_id from friend_requests  as fr where target_user_id like '%' and status = 'approved'	
	 	UNION
	 select target_user_id from friend_requests  as fr where initiator_user_id = 46 and status = 'approved'	
)

update communities
set admin_user_id = 2
where id = 1;

select 2 = (
	select admin_user_id 
	from communities as c
	where id = 1
) as 'is_admin'




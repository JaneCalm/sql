use vk;

insert  into users (id, firstname, lastname, email, phone)
values (101, 'Reubert', 'Nienow', 'adiuh@mail.ru', '65765765');

insert  IGNORE into users (id, firstname, lastname, email, phone)
values (102, 'Reuberit', 'Nienow', 'adiuh@mail.ru', NULL);

alter table vk.users add is_deleted BIT DEFAULT 0 NOT NULL;

insert into users (id, firstname, lastname, email, phone)
values (103,'Reubherit', 'Nienow', 'adiuh@mail.ru', '76757');

insert into users
	(id, firstname, lastname, email, phone)
SELECT	
	'106', 'jyf', 'Jgch', 'dhg@gjh.yhg', '67576'
;

select 1,2,3,4;

select DISTINCT
	id, firstname
from users;

select *
from users
limit 3 offset 9;

SELECT
	id, firstname
from users 
where id IN (1,2,3,4,56);

SELECT
	*
from profiles
where year(birthday) in (1990,1980,2000);

use vk;

insert into friend_requests (`initiator_user_id`, `target_user_id`, `status`)
VALUES ('1', '3', 'requested');

insert into friend_requests (`initiator_user_id`, `target_user_id`, `status`)
VALUES ('1', '4', 'requested');

insert into friend_requests (`initiator_user_id`, `target_user_id`, `status`)
VALUES ('1', '2', 'requested');

insert into friend_requests (`initiator_user_id`, `target_user_id`, `status`)
VALUES ('1', '5', 'requested');

UPDATE friend_requests
	SET status = 'unfiended';

update friend_requests
set
	status = 'approved',
	updated_at = now()
WHERE 
	initiator_user_id = 7
	AND target_user_id = 7
;

update friend_requests
set
	status = 'declined',
	updated_at = now()
WHERE 
	initiator_user_id = 8
	AND target_user_id = 8
;









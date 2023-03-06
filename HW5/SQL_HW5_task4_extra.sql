/*Выбрать всех пользователей, указав их id, имя и фамилию, город и аватарку (используя вложенные запросы)*/

SELECT users.id, users.firstname, users.lastname, hometown, users_media.body
FROM users
JOIN (SELECT user_id, hometown FROM profiles) as hometowns 
ON users.id = hometowns.user_id
JOIN  (SELECT user_id, body, filename
		FROM media 
        WHERE media_type_id = (SELECT id FROM media_types WHERE name_type='Photo')) as users_media
ON users.id = users_media.user_id;

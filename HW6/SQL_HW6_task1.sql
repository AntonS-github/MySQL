/*1. Создайте функцию, которая принимает кол-во сек и
форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '*/

DROP FUNCTION IF EXISTS date_time;

delimiter $$
CREATE FUNCTION date_time(seconds INT)
RETURNS VARCHAR(60)
DETERMINISTIC
BEGIN
	DECLARE sec_in_day INT DEFAULT 86400;
    DECLARE sec_in_hour INT DEFAULT 3600;
    DECLARE sec_in_min INT DEFAULT 60;
    DECLARE days INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    
    SET days = FLOOR(seconds/sec_in_day);
    SET seconds = seconds - (days*sec_in_day);
    SET hours = FLOOR(seconds/sec_in_hour);
    SET seconds = seconds - (hours*sec_in_hour);
	SET minutes = FLOOR(seconds/sec_in_min);
    SET seconds = seconds - (minutes*sec_in_min);
    
    RETURN CONCAT(days, " days ", hours, " hour ", minutes, " minute ", seconds, " seconds ");
END $$
delimiter ;
SELECT date_time(789564);


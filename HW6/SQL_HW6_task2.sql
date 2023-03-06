/*2. Выведите только четные числа от 1 до 10 включительно.
(Через функцию / процедуру)
Пример: 2,4,6,8,10 (можно сделать через шаг + 2: х = 2, х+=2)*/

DROP PROCEDURE IF EXISTS evens;

delimiter $$
CREATE PROCEDURE evens(num INT)
DETERMINISTIC
BEGIN
	DECLARE result VARCHAR(30) DEFAULT "";
    DECLARE current_num INT DEFAULT 0;
    
    SET current_num = IF(current_num%2=0, current_num, current_num+1);
    
	WHILE current_num < num DO
		SET result = IF(result="", current_num, CONCAT(result,", ",current_num)); 
        SET current_num = current_num+2;
	END WHILE;
    SELECT result;
END $$
delimiter ;

CALL evens(10);
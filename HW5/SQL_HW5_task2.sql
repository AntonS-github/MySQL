/*2. Изменить в существующем представлении порог
для стоимости: пусть цена будет до 30 000 долларов
(используя оператор ALTER VIEW)*/

ALTER VIEW cheap_auto AS
SELECT name, cost
FROM cars
WHERE cost < 30000;

SELECT * FROM cheap_auto;
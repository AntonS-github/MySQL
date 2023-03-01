/*1. Создайте представление, в которое попадут
автомобили стоимостью до 25 000 долларов*/

CREATE VIEW cheap_auto AS
SELECT name, cost
FROM cars
WHERE cost < 25000;

SELECT * FROM cheap_auto;




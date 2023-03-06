/*3. Создайте представление, в котором будут только
автомобили марки “Шкода” и “Ауди”*/

DROP VIEW vw_cars;
CREATE VIEW vw_cars AS
SELECT name, cost
FROM cars
WHERE name = "Skoda" OR name = "Audi";

SELECT * FROM vw_cars;
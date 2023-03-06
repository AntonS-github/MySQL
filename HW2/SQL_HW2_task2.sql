/*2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.*/

SELECT 
		id AS ID,
        order_date AS "дата заказа",
        count_product AS "кол-во",
		IF(count_product < 100, "плохие продажи",
			IF(count_product BETWEEN 100 AND 300, "средние продажи","хорошие продажи"))
		AS "тип заказа"
FROM sales;


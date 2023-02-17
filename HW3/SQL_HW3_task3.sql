/*Посчитайте суммарную зарплату (salary) по каждой специальности (роst)*/

SELECT post, SUM(salary)
FROM staff
GROUP BY post;
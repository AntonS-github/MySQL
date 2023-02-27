/*3.	Вывести магазины, в котором НЕ продаются коты “Мурзик” и “Zuza”*/

SELECT shops.id, shops.shopname
FROM shops
JOIN cats
ON shops.id = cats.shops_id
WHERE name <> 'Murzik' OR name <> 'Zuza';

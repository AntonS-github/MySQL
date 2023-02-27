/*2.	Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)*/

# 1 способ
SELECT shops.shopname, cats.name
FROM shops
JOIN cats
ON shops.id = cats.shops_id
WHERE cats.name = 'Murzik';

# 2 способ
SELECT shops.shopname, murzik_data.name
FROM shops
JOIN (SELECT id, name, shops_id
FROM cats WHERE name = 'Murzik') AS murzik_data
ON shops.id = murzik_data.shops_id;


/* Решение задач по SQL*/


/* 1) Найдите номер модели, скорость и размер жесткого диска для всех ПК 
стоимостью менее 500 дол. Вывести: model, speed и hd */

SELECT  model, speed, hd
FROM pc
WHERE price<500.0000;

/* 2) Найдите производителей принтеров. Вывести: Maker */

SELECT DISTINCT Maker
FROM Product
WHERE type = 'Printer';

/* 3) Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол. */

SELECT model, ram, screen
FROM Laptop
WHERE price > CAST('1000' AS MONEY);

/* 4) Найдите все записи таблицы Printer для цветных принтеров. */

SELECT *
FROM Printer
WHERE color = 'y';
 
/* 5) Найдите номер модели, скорость и размер жесткого диска ПК, 
имеющих 12x или 24x CD и цену менее 600 дол. */

SELECT model, speed, hd 
FROM PC 
WHERE cd IN ('12x', '24x')
AND price < CAST('600' AS MONEY);

/* 6) Для каждого производителя, выпускающего ПК-блокноты c объёмом 
жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. 
Вывод: производитель, скорость. */

SELECT DISTINCT Product.maker, Laptop.speed
FROM Product 
JOIN Laptop ON Product.model = Laptop.model
WHERE Laptop.hd >= 10

/* 7) Найдите номера моделей и цены всех имеющихся в продаже продуктов 
(любого типа) производителя B (латинская буква). */

SELECT newtab.model, newtab.price
FROM (SELECT model, price SELECT pc
UNION SELECT model, price SELECT laptop
UNION SELECT model, price SELECT printer) AS newtab
JOIN product ON newtab.model = product.model
WHERE product.maker = 'B'

/* 8) Найдите производителя, выпускающего ПК, но не ПК-блокноты. */

SELECT distinct maker 
FROM product
WHERE type = 'PC' 
EXCEPT
SELECT maker 
FROM product
WHERE type = 'Laptop'

/* 9) Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker */

SELECT distinct maker
FROM product
JOIN pc ON product.model = pc.model
WHERE speed >= 450

/* 10) Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price */

SELECT model, price
FROM printer
WHERE price = (SELECT Max(price)
FROM printer)

/* 11) Найдите среднюю скорость ПК. */

SELECT AVG(speed) FROM pc

/* 12) Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол. */

SELECT AVG(speed) FROM LAPTOP
WHERE PRICE > 1000

/* 13) Найдите среднюю скорость ПК, выпущенных производителем A. */

SELECT AVG(speed) FROM pc
JOIN product ON pc.model = product.model
WHERE maker = 'A'

/* 14) Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий. */

SELECT classes.class, name, country
FROM ships
JOIN classes ON ships.class = classes.class
WHERE numGuns >= 10

SELECT ships.class, name, country
FROM classes
JOIN ships ON ships.class = classes.class
WHERE numGuns >= 10

/* 15) Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD */

SELECT hd
FROM pc
GROUP BY hd
HAVING COUNT(hd) >= 2

/* 16) Найдите пары моделей PC, имеющих одинаковые скорость и RAM. 
В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), 
Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM. */

SELECT DISTINCT pc.model, pc2.model, pc.speed, pc.ram
FROM pc, (SELECT model, speed, ram
FROM pc) as pc2
WHERE pc.speed = pc2.speed AND pc.ram = pc2.ram AND pc.model > pc2.model

/* 17) Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК. 
Вывести: type, model, speed  */

SELECT  DISTINCT product.type, laptop.model, laptop.speed 
FROM Laptop, Product
WHERE (laptop.speed < ALL(SELECT speed FROM PC )) AND product.type ='laptop'

SELECT DISTINCT product.type, laptop.model, laptop.speed
FROM product
JOIN laptop ON laptop.model = product.model
WHERE laptop.speed < ALL(SELECT speed FROM pc)

/* 18) Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price */

SELECT DISTINCT product.maker, printer.price
FROM product
LEFT JOIN printer ON printer.model = product.model
WHERE color = 'Y' AND price = (SELECT MIN(price) FROM printer WHERE color = 'Y')

/* 24) Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.
 Вывести: model */

SELECT model FROM 
(SELECT model, price FROM pc
UNION
SELECT model, price FROM laptop
UNION
SELECT model, price FROM Printer) as Tabl

WHERE price in (SELECT MAX(price) 
FROM (SELECT  price FROM pc
UNION
SELECT price FROM laptop
UNION
SELECT price FROM Printer) as Tab2)

/* 25) Найдите производителей принтеров, 
которые производят ПК с наименьшим объемом RAM и 
с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. 
Вывести: Maker */

SELECT DISTINCT maker 
FROM product 
WHERE model IN
(SELECT model FROM pc 
WHERE ram = (SELECT MIN (ram) FROM pc) AND
      speed = (SELECT MAX(speed) FROM pc WHERE ram = (SELECT MIN (ram) FROM pc))) AND 
      maker in (SELECT maker FROM product WHERE type='printer')

/* 26) Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). 
Вывести: одна общая средняя цена. */

SELECT AVG(price) as SREDNEE 
FROM 
(select price FROM pc LEFT JOIN product ON pc.model=product.model WHERE product.maker='A'
UNION ALL
select price FROM laptop LEFT JOIN product ON  laptop.model=product.model WHERE product.maker='A') as t1


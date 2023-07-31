# TASK 1. 
/*1. Используя операторы языка SQL,
создайте таблицу “sales”. Заполните ее данными.
Справа располагается рисунок к первому
заданию.
*/
/*2. Для данных таблицы “sales” укажите тип
заказа в зависимости от кол-ва :
меньше 100 - Маленький заказ
от 100 до 300 - Средний заказ
больше 300 - Большой заказ
*/

CREATE DATABASE IF NOT EXISTS sales; -- Создаем БД с именем sales, если она не была создана

USE sales; -- Подключаемся к БД salea

-- 2. Создание таблицы
CREATE TABLE IF NOT EXISTS sales (
  id INT UNSIGNED PRIMARY KEY NOT NULL,
  order_date DATE NOT NULL,
  count_product INT UNSIGNED
);

-- 3. Заполняем таблицу
INSERT sales (id, order_date, count_product)
VALUES 
  (1,'2022-01-01', 156),
  (2,'2022-01-02', 180),
  (3,'2022-01-03', 21),
  (4,'2022-01-04', 124),
  (5,'2022-01-05', 341);

-- 4. Делаем выборку
SELECT 
id AS "id заказа",
CASE
	WHEN count_product BETWEEN 101 AND 300 THEN "Средний заказ"
    WHEN count_product > 300 THEN "Большой заказ"
    ELSE "Маленький заказ"
END AS "Тип заказа"
FROM sales;

-- 5. Просмотр таблицы
SELECT * FROM sales;


# TASK 2. 
/* Создайте таблицу “orders”, заполните ее значениями.
Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED - «Order is cancelled»
*/

CREATE DATABASE IF NOT EXISTS orders; -- Создаем БД с именем orders, если она не была создана

USE orders; -- Подключаемся к БД orders

-- 2. Создание таблицы
CREATE TABLE IF NOT EXISTS orders (
  id INT UNSIGNED PRIMARY KEY NOT NULL,
  employee_id VARCHAR(45) NOT NULL,
  amount DOUBLE NOT NULL,
  order_status VARCHAR(45) NOT NULL
);

-- 3. Заполняем таблицу
INSERT orders (id, employee_id, amount, order_status)
VALUES 
  (1,"e03", 15.00, "OPEN"),
  (2,"e01", 25.50, "OPEN"),
  (3,"e05", 100.70, "CLOSED"),
  (4,"e02", 22.18, "OPEN"),
  (5,"e04", 9.50, "CANCELLED");

-- 4. Делаем выборку
SELECT order_status,
CASE
	WHEN order_status LIKE '%OPEN%'THEN "«Order is in open state»"
    WHEN order_status LIKE '%CLOSED%'THEN "«Order is closed»"
    WHEN order_status LIKE '%CANCELLED%'THEN "«Order is cancelled»"
END AS "full_order_status"
FROM orders;

-- 5. Просмотр таблицы
SELECT * FROM orders;

# TASK 3. 
/* Чем 0 отличается от NULL?
Ответ: 0 в MySQL - это значение, которое представляет целочисленный ноль. 
NULL в MySQL - это значение, которое представляет отсутствие значения или 
неопределенное значение. Отличие между ними заключается в том, что 0 является 
конкретным значением, а NULL - абстрактным. Кроме того, 0 может использоваться 
в вычислениях, тогда как NULL не может быть использован в таких случаях.
*/

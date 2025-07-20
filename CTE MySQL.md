### Создадим init.sql

```
USE sales_db;

-- 1. Создаём таблицу магазинов
CREATE TABLE stores (
    store_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(50) NOT NULL
);

-- 2. Создаём таблицу продаж
CREATE TABLE sales (
    sale_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    store_id BIGINT UNSIGNED NOT NULL,
    date TIMESTAMP NOT NULL,
    sale_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (store_id) REFERENCES stores (store_id)
);

-- 3. Cгенерируем 10 магазинов в таблице stores
INSERT INTO stores (address)
SELECT CONCAT('Store Address #', n)
FROM (
  SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
  UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10
) AS numbers;

-- 4. Сгенерируем 100000 продаж в таблице sales за последние 2 года через процедуру
DELIMITER $$

CREATE PROCEDURE populate_sales()
BEGIN
  DECLARE i INT DEFAULT 0;
  DECLARE sid BIGINT;
  DECLARE sale_dt TIMESTAMP;
  DECLARE amount DECIMAL(10,2);

  WHILE i < 100000 DO
    -- 70-75% продаж попадут в магазин 1
    IF i < 72500 THEN
      SET sid = 1;
    ELSE
      SET sid = FLOOR(2 + RAND() * 9); -- случайный id от 2 до 10
    END IF;

    -- случайная дата за последние 2 года
    SET sale_dt = TIMESTAMP(DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY) + INTERVAL FLOOR(RAND() * 86400) SECOND);

    -- случайная сумма от 5 до 500
    SET amount = ROUND(5 + (RAND() * 495), 2);

    -- вставка
    INSERT INTO sales (store_id, date, sale_amount)
    VALUES (sid, sale_dt, amount);

    SET i = i + 1;
  END WHILE;
END$$

DELIMITER ;

-- 5. Запускаем процедуру
CALL populate_sales();
```

> Скрипт будет запускаться при поднятии контейнера

```
version: '3.8'
services:
  mysql:
    image: mysql:8
    container_name: sales_mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root     
      MYSQL_DATABASE: sales_db      
    ports:
      - "3307:3306"                    
    volumes:
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql -- Вот наш скрипт

```
### Поднимаем контейнер 

<img width="1013" height="596" alt="image" src="https://github.com/user-attachments/assets/8d69e2fe-e7bb-4537-a9ea-b0738b62fe80" />

### Проверяем данные

<img width="1009" height="597" alt="image" src="https://github.com/user-attachments/assets/60ff31a0-90f5-4e84-9eeb-12e6775d9e3f" />

### Выполним запрос, который выведет нарастающий итог продаж по каждому магазину с группировкой по месяцам

```
SELECT
    store_id,
    DATE_FORMAT(date, '%Y-%m') AS month,
    SUM(sale_amount) AS monthly_sales,
    SUM(SUM(sale_amount)) OVER (
        PARTITION BY store_id
        ORDER BY DATE_FORMAT(date, '%Y-%m')
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_sales
FROM sales
GROUP BY store_id, month
ORDER BY store_id, month;
```

<img width="1203" height="785" alt="image" src="https://github.com/user-attachments/assets/3e3e5329-a6b5-483f-aab4-d8ab838cc1be" />

### Выполним запрос, который выведет 7-дневное скользящее среднее за последний месяц по самому плодовитому магазину

```
WITH top_store AS (
    SELECT store_id
    FROM sales
    GROUP BY store_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
),
filtered_sales AS (
    SELECT
        DATE(date) AS sale_day,
        SUM(sale_amount) AS daily_total
    FROM sales
    WHERE store_id = (SELECT store_id FROM top_store)
      AND date >= DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), '%Y-%m-01')
      AND date < DATE_FORMAT(CURDATE(), '%Y-%m-01') + INTERVAL 1 MONTH
    GROUP BY DATE(date)
),
7_by_day AS (
    SELECT
        f1.sale_day,
        (
            SELECT AVG(f2.daily_total)
            FROM filtered_sales f2
            WHERE f2.sale_day BETWEEN f1.sale_day - INTERVAL 6 DAY AND f1.sale_day
        ) AS rolling_avg_7
    FROM filtered_sales f1
)
SELECT
    ROUND(AVG(rolling_avg_7), 2) AS final_monthly_rolling_avg_7d
FROM 7_by_day;
```
<img width="1197" height="799" alt="image" src="https://github.com/user-attachments/assets/ba2ba904-f1a2-4199-b07d-a22dc87ccf68" />


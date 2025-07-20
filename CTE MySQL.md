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

### 1. Подготовка окружения

> Запуск контейнера
> Создание директории
```
mkdir -Force ~/mysql-docker
cd ~/mysql-docker
```

> Создание файлов

> init.sql

```
@'
CREATE DATABASE IF NOT EXISTS test;
USE test;

CREATE TABLE IF NOT EXISTS test (
    id INT AUTO_INCREMENT PRIMARY KEY,
    text VARCHAR(256) NOT NULL
);

INSERT INTO test (text) VALUES 
('example text'),
('another row'),
('test data');
'@ | Out-File -Encoding utf8 init.sql
```

> my.cnf

```
@'
[mysqld]
innodb_buffer_pool_size = 128M
max_connections = 50
skip-name-resolve
'@ | Out-File -Encoding utf8 my.cnf
```

> dockerfile

```
@'
FROM mysql:8.0

COPY my.cnf /etc/mysql/conf.d/
COPY init.sql /docker-entrypoint-initdb.d/

ENV MYSQL_ROOT_PASSWORD=rootpass
ENV MYSQL_DATABASE=test

EXPOSE 3306
'@ | Out-File -Encoding utf8 Dockerfile
```

![image](https://github.com/user-attachments/assets/1b79add3-d035-4113-a3f9-48e8c565c96b)


### 3. Сборка и запуск

![image](https://github.com/user-attachments/assets/9a09323c-8371-4f3b-9ac9-e88f03dbcbef)
![image](https://github.com/user-attachments/assets/42864867-b8fc-4d9a-8331-9d7a447ef107)
![image](https://github.com/user-attachments/assets/70ea8e15-b6ba-47d0-989f-3a12a763fb1a)


### 4. Итог

![image](https://github.com/user-attachments/assets/51d99d87-2700-4273-86a2-a448689540c3)





### Запускаем два контейнера

<img width="1594" height="566" alt="image" src="https://github.com/user-attachments/assets/d888552b-412d-4226-9cd5-1a03b6ab2528" />

### Настройка репликации

> Выполняем на master - Выдаем полномочия

```
CREATE USER 'repl'@'%' IDENTIFIED BY 'replpass';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
FLUSH PRIVILEGES;
```

<img width="720" height="197" alt="image" src="https://github.com/user-attachments/assets/b6a190a6-fe16-42c8-afda-660c4137ffd6" 

> Выполняем на slave - Настраиваем репликацию

```
CHANGE REPLICATION SOURCE TO
  SOURCE_HOST='mysql-master',
  SOURCE_USER='repl',
  SOURCE_PASSWORD='replpass',
  SOURCE_AUTO_POSITION=1;

START REPLICA;
```
<img width="1381" height="323" alt="image" src="https://github.com/user-attachments/assets/4f62822d-5e7c-42f1-b34a-47edc04fc6e6" />



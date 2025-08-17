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

# Создаем БД t1 на master и делаем dump

<img width="1393" height="333" alt="image" src="https://github.com/user-attachments/assets/7291d111-241e-4854-ac8c-8bce1d05ff49" />

> Вставляем значение в master

<img width="1391" height="364" alt="image" src="https://github.com/user-attachments/assets/7b025d5d-ec8d-41de-b344-0993ea182cb2" />

> Проверяем данные на slave

<img width="1381" height="324" alt="image" src="https://github.com/user-attachments/assets/82f1f3d1-b95c-429f-a900-52308b184355" />




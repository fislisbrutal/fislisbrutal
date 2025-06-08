## Физическая репликация

### Шаг 1: Подготовка master-сервера и настройка репликации

<img width="861" alt="image" src="https://github.com/user-attachments/assets/c9d8a961-dcdf-413a-8727-f455e60c265a" />

> Внесение правок в postgresql.conf
<img width="842" alt="image" src="https://github.com/user-attachments/assets/e70b99b2-9b9e-493c-9f19-b6a9568ea65f" />


### Шаг 2: Настройка реплики

Запускаем контейнер реплики и создаем backup на master и сразу копируем в реплику

<img width="841" alt="image" src="https://github.com/user-attachments/assets/8352fbf3-9245-4b06-bd99-cdcfda5a4c1a" />

<img width="855" alt="image" src="https://github.com/user-attachments/assets/b501c9a4-bba7-4ab4-ae66-1d535704815f" />

### Шаг 3: Итоги

Таблица test перенесена
<img width="832" alt="image" src="https://github.com/user-attachments/assets/f9a8c00e-5c62-4b38-a882-c0a1ea45fc4b" />

<img width="844" alt="image" src="https://github.com/user-attachments/assets/6b164f7c-e330-465a-afce-4c23027eb2cc" />

## Логическая репликация

### Шаг 1: Запускаем master с логической репликацией
<img width="1004" alt="image" src="https://github.com/user-attachments/assets/1b238054-abbf-471e-a41c-7b3e86072185" />
### Шаг 2: Настраиваем репликацию и создаем таблицу
<img width="856" alt="image" src="https://github.com/user-attachments/assets/ea9b685d-6f28-4032-9122-1b64abd4bd76" />
<img width="850" alt="image" src="https://github.com/user-attachments/assets/b30e91af-c403-4eec-9be7-90cf4006d8af" />
### Шаг 3: Создание replica и подписки
<img width="846" alt="image" src="https://github.com/user-attachments/assets/4a5770f5-b332-45c0-9bd1-2337ac94c7f1" />
### Шаг 4: Вставка в master и проверка в replica
<img width="856" alt="image" src="https://github.com/user-attachments/assets/9ddff3a6-f83d-432d-b3d2-6586bc81ea55" />













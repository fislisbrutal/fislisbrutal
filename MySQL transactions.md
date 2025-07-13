> Таблицы:
> Products — товары с информацией о цене, рейтинге и количестве на складе.
> Categories — категории товаров.
> Orders — таблица заказов.
> OrderDetails — детализация каждого заказа (товары и количество).

### 1. Создаем процедуру

> Процедура проверяет следующие шаги:
> - Проверка наличия товара на складе (products).
> - Уменьшение количества товаров на складе.
> - Создание записи о заказе в отдельной таблице orders.
> - Добавление деталей заказа в таблицу order_details, связывая заказанный товар с заказом.

<img width="1337" height="926" alt="image" src="https://github.com/user-attachments/assets/7b8818fc-1d12-455d-a897-d00fac804ea0" />


### 2. Вызываем процедуру

> Оформляем заказ для конкретного пользователя

<img width="1334" height="916" alt="image" src="https://github.com/user-attachments/assets/8c2b824e-bc81-4abf-9bfe-1977f0340490" />


##№ Создадим еще одну процедуру для импорта данных из CSV в таблицу products

<img width="1722" height="890" alt="image" src="https://github.com/user-attachments/assets/a363ebb5-69fe-4932-b61c-ffbb0050579c" />
<img width="1714" height="930" alt="image" src="https://github.com/user-attachments/assets/550943d9-c271-4c45-a9ad-4d46e9c11202" />





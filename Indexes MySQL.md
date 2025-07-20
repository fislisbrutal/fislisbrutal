
### Без индекса (медленно) LIKE '%...'

<img width="767" height="652" alt="image" src="https://github.com/user-attachments/assets/963c4524-1250-4e28-9280-e84c543f0bb7" />

### Создаем FULLTEXT-индекс

```
ALTER TABLE products
ADD FULLTEXT INDEX ft_title_category_status (title, category, status);
```

### С FULLTEXT индексом на те же поля

<img width="765" height="638" alt="image" src="https://github.com/user-attachments/assets/d46f615c-1793-49cc-9920-0770319fcdba" />

Результат:
```
-> Filter: (match products.title,products.category,products.`status` against ('орехи наличие'))  (cost=0.35 rows=1) (actual time=0.0701..0.211 rows=76 loops=1)
    -> Full-text index search on products using ft_title_category_status (title = 'орехи наличие')  (cost=0.35 rows=1) (actual time=0.0676..0.203 rows=76 loops=1)

```


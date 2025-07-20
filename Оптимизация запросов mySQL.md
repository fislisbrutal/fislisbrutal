### Возьмем сложную выборку с несколькими join и подзапросами

```
SELECT 
    p.id,
    p.title,
    p.category,
    p.price,
    p.rating,
    p.status,
    p.created_at,

    (
        SELECT AVG(p2.price)
        FROM products p2
        WHERE p2.category = p.category
    ) AS avg_category_price,

    (
        SELECT COUNT(*)
        FROM products p3
        WHERE p3.category = p.category AND p3.status = 'Распродан'
    ) AS sold_count_in_category

FROM 
    products p
WHERE 
    p.status = 'В наличии'
    AND p.price > (
        SELECT AVG(price) FROM products
    )
    AND p.rating >= 3
ORDER BY 
    p.rating DESC,
    p.price DESC
LIMIT 10;
```

### EXPLAIN

```
id|select_type       |table   |partitions|type|possible_keys|key|key_len|ref|rows|filtered|Extra                      |
--+------------------+--------+----------+----+-------------+---+-------+---+----+--------+---------------------------+
 1|PRIMARY           |p       |          |ALL |             |   |       |   | 207|    1.11|Using where; Using filesort|
 4|SUBQUERY          |products|          |ALL |             |   |       |   | 207|   100.0|                           |
 3|DEPENDENT SUBQUERY|p3      |          |ALL |             |   |       |   | 207|     1.0|Using where                |
 2|DEPENDENT SUBQUERY|p2      |          |ALL |             |   |       |   | 207|    10.0|Using where                |
```

### EXPLAIN ANALYZE

```
EXPLAIN                                                                                                                                                                                                                                                        |
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
-> Limit: 10 row(s)  (cost=21 rows=10) (actual time=1.08..1.08 rows=10 loops=1)¶    -> Sort: p.rating DESC, p.price DESC, limit input to 10 row(s) per chunk  (cost=21 rows=207) (actual time=1.08..1.08 rows=10 loops=1)¶        -> Filter: ((p.`status` = 'В |
```

### EXPLAIN FORMAT=JSON

```
EXPLAIN                                                                                                                                                                                                                                                        |
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
{¶  "query_block": {¶    "select_id": 1,¶    "cost_info": {¶      "query_cost": "23.75"¶    },¶    "ordering_operation": {¶      "using_filesort": true,¶      "cost_info": {¶        "sort_cost": "2.30"¶      },¶      "table": {¶        "table_name": "p",¶|
```
> Узкое горлышко запросов
- Подзапросы в SELECT
- Отсутствие индексов, что так же увеличивает время поиска
- Filesort при сортировке


### Создадим индексы

<img width="652" height="198" alt="image" src="https://github.com/user-attachments/assets/cad5897f-1cda-4c52-aab6-e898191749aa" />

### Добавим в запрос окконую функцию

```
WITH avg_category_price AS (
  SELECT category, AVG(price) AS avg_price
  FROM products
  GROUP BY category
),
avg_global_price AS (
  SELECT AVG(price) AS avg_price FROM products
),
rating_counts AS (
  SELECT rating, COUNT(*) AS rating_count
  FROM products
  GROUP BY rating
)
SELECT 
    p.id,
    p.title,
    p.category,
    p.price,
    p.rating,
    p.status,
    p.created_at,
    ac.avg_price AS avg_price_in_category,
    rc.rating_count AS same_rating_count,
    RANK() OVER (PARTITION BY p.category ORDER BY p.price DESC) AS price_rank
FROM products p
JOIN avg_category_price ac ON ac.category = p.category
JOIN rating_counts rc ON rc.rating = p.rating
JOIN avg_global_price ag ON p.price > ag.avg_price
WHERE p.status = 'В наличии'
ORDER BY p.price DESC
LIMIT 20;
```

### Добавим гистограмму
<img width="734" height="630" alt="image" src="https://github.com/user-attachments/assets/61c9adbe-57a1-4179-8546-481d881e8c30" />


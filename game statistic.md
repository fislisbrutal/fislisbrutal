### написать запрос суммы очков с группировкой и сортировкой по годам

```
SELECT player_name, COUNT(points), year_game 
FROM temp.statistic 
GROUP BY player_name, year_game 
ORDER BY year_game ASC;
```
<img width="856" alt="image" src="https://github.com/user-attachments/assets/3ec1f255-6510-4929-9fe3-baf860e03b45" />



### написать cte показывающее тоже самое

```
    WITH grouped_data AS (
    SELECT player_name,
           COUNT(points) AS points_count,
           year_game
    FROM temp.statistic
    GROUP BY player_name, year_game
)
SELECT *
FROM grouped_data
ORDER BY year_game ASC;
```
<img width="854" alt="image" src="https://github.com/user-attachments/assets/8e8c89ce-6de3-4918-8e1c-d54ed71062ac" />

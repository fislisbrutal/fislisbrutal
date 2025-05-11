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

### 
```
WITH grouped_data AS (
    SELECT player_name,
           SUM(points) AS total_points,
           year_game
    FROM temp.statistic
    GROUP BY player_name, year_game
),
lag_data AS (
    SELECT player_name,
           total_points,
           year_game,
           LAG(total_points) OVER(PARTITION BY player_name ORDER BY year_game) AS prev_year_points
    FROM grouped_data
)
SELECT * 
FROM lag_data
ORDER BY player_name, year_game;
```
<img width="853" alt="image" src="https://github.com/user-attachments/assets/c1b4adbd-29b4-496f-a77e-7aa331fea5f9" />

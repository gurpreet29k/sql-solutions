--Problem- https://datalemur.com/questions/sql-average-post-hiatus-1

SELECT 
  user_id, 
  MAX(post_date::Date) - MIN(post_date::DATE) as days_between
FROM posts
WHERE extract(year from post_date) = '2021'
GROUP BY user_id
HAVING count(user_id) > 1
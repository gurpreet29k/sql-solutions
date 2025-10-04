--Problem- https://datalemur.com/questions/sql-page-with-no-likes

SELECT p.page_id 
FROM pages p
LEFT JOIN page_likes pl 
ON p.page_id = pl.page_id
WHERE user_id is NULL
ORDER BY p.page_id;

-- Problem: https://datalemur.com/questions/sql-histogram-tweets

SELECT t.tweet_bucket, 
COUNT(t.tweet_bucket) as users_num 
FROM
  (SELECT count(user_id) as tweet_bucket, user_id
   FROM tweets
   WHERE EXTRACT(YEAR from tweet_date) = '2022'
   GROUP BY user_id) t
GROUP BY tweet_bucket

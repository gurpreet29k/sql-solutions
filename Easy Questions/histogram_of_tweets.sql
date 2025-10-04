-- Problem: https://datalemur.com/questions/sql-histogram-tweets

select t.tweet_bucket, 
count(t.tweet_bucket) as users_num FROM
(SELECT count(user_id) as tweet_bucket,
user_id
FROM tweets
where EXTRACT(YEAR from tweet_date) = '2022'
group by user_id) t
group BY tweet_bucket

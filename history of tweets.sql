Select tweet_bucket,
count(users_num)
from 
(
  Select 
  count(tweet_id) as tweet_bucket,
  user_id as users_num
  from tweets
  where tweet_date between '2022-01-01' and '2022-12-21'
  group by   user_id 
  ) as total_tweets
group by tweet_bucket
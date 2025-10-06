--Problem- https://datalemur.com/questions/time-spent-snaps

WITH cte AS(
SELECT 
    age.age_bucket,
    SUM(CASE WHEN act.activity_type = 'send'
        THEN act.time_spent else 0 end) as send_timespent,
    SUM(CASE WHEN act.activity_type = 'open'
        THEN act.time_spent else 0 end) as open_timespent,
    SUM(act.time_spent) as total_timespent
FROM activities as act 
INNER JOIN age_breakdown age 
ON act.user_id = age.user_id
WHERE act.activity_type in ('send','open')
GROUP BY age.age_bucket
)

SELECT
    age_bucket,
    round(100 * send_timespent/total_timespent,2) as send_perc,
    round(100 * open_timespent/total_timespent,2) as open_perc
FROM cte

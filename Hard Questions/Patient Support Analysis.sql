--Problem- https://datalemur.com/questions/long-calls-growth

WITH cte as(
SELECT 
  EXTRACT(YEAR from call_date) as yr,
  EXTRACT(MONTH from call_date) as mth,
  count(case_id) as current_mth_calls,
  LAG(count(case_id)) over (
      order by  EXTRACT(MONTH from call_date)) as prev_mth_calls
FROM callers
WHERE call_duration_secs > 300
GROUP BY EXTRACT(YEAR from call_date) ,
         EXTRACT(MONTH from call_date)
)

SELECT 
    yr, mth, 
    ROUND(100.0 * (current_mth_calls - prev_mth_calls)/prev_mth_calls,1) as long_calls_growth_pct
FROM cte 
ORDER BY yr,mth 



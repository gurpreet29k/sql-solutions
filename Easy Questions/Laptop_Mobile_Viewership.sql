SELECT 
SUM(CASE WHEN device_type = 'laptop' then 1 else 0 end) laptop_views,
SUM(CASE WHEN device_type in ('phone','tablet') then 1 else 0 end) mobile_views
FROM viewership
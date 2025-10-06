--Problem- https://leetcode.com/problems/trips-and-users/description/?utm_source=chatgpt.com

With cte as(
    SELECT 
    request_at as Day, COUNT(id) as total_trips, 
    SUM( CASE WHEN status in ('Completed') THEN 1 ELSE 0 END) AS completed_trips,
    SUM( CASE WHEN status in ('cancelled_by_client', 'cancelled_by_driver' ) THEN 1 ELSE 0 END) as cancelled_trips
    FROM Trips
    INNER JOIN Users 
    ON Trips.client_id = Users.users_id
    WHERE Users.banned = 'No'
    GROUP BY  request_at
)

SELECT 
    Day,
    ROUND(cancelled_trips/total_trips,2) as 'Cancellation Rate'
FROM cte
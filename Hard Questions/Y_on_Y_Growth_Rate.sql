--Problem- https://datalemur.com/questions/yoy-growth-rate

WITH yearly_spend_cte as(
SELECT 
  extract(year from transaction_date) as year,
  product_id,
  spend as curr_year_spend,
  LAG(spend) over (
                  partition by product_id    
                  order by product_id,
                  extract(year from transaction_date)) as prev_year_return
FROM user_transactions
)
 
SELECT *,
 round(100 * (curr_year_spend - prev_year_return) / prev_year_return,2) as yoy_return
FROM yearly_spend_cte


/*
PostgreSQL LAG() function allows you to access data of the previous row from the current row. It can be very useful for comparing the value of the current row with the value of the previous row.

Here’s the basic syntax of the LAG() function:

LAG(expression [,offset [,default_value]])
OVER (
    [PARTITION BY partition_expression, ... ]
    ORDER BY sort_expression [ASC | DESC], ...
)

In the above code, The LAG function allows us to access the spend of the previous year based on the product ID.
*/

/*Within this CTE, we'll apply the year-on-year (y-o-y) growth rate formula to calculate the growth rate between the current year's spend and the previous year's spend.

Year-on-Year Growth Rate = ((Current Year's Spend - Previous Year’s Spend) / Previous Year’s Spend) x 100
*/

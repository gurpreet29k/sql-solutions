--Problem- https://datalemur.com/questions/sql-third-transaction

SELECT user_id, spend, transaction_date
FROM (
  SELECT *,
  RANK() OVER (PARTITION BY user_id ORDER BY transaction_date) AS rank
  FROM transactions
  ) as ranked_transactions
WHERE rank = 3

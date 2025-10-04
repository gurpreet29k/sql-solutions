Select 
user_id, spend, transaction_date
from (
SELECT *,
RANK() OVER (PARTITION BY user_id ORDER BY transaction_date) AS rank
FROM transactions
) as ranked_transactions
where rank = 3
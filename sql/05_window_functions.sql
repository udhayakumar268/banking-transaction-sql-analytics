-- Exercise 55: sequential behaviour and within-account transaction ranks.
WITH ranked AS (
    SELECT t.transaction_id, t.account_id, t.transaction_date,
           t.amount, t.transaction_type,
           ROW_NUMBER() OVER (
               PARTITION BY t.account_id ORDER BY t.transaction_date, t.transaction_id
           ) AS transaction_sequence,
           LAG(t.amount) OVER (
               PARTITION BY t.account_id ORDER BY t.transaction_date, t.transaction_id
           ) AS previous_amount,
           RANK() OVER (
               PARTITION BY t.account_id ORDER BY t.amount DESC
           ) AS amount_rank
    FROM transactions t
)
SELECT *,
       CASE WHEN previous_amount IS NOT NULL
                 AND amount >= 3 * previous_amount
            THEN 1 ELSE 0 END AS sudden_increase_flag
FROM ranked
ORDER BY account_id, transaction_sequence;

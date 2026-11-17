-- Exercise 56: reusable, all-time account-level feature view.
CREATE OR REPLACE VIEW account_fraud_features AS
WITH account_stats AS (
    SELECT a.account_id, a.customer_id, a.account_type, a.balance,
           COUNT(t.transaction_id) AS total_transactions,
           COALESCE(SUM(t.amount), 0)::numeric(14,2) AS total_amount,
           ROUND(COALESCE(AVG(t.amount), 0), 2) AS avg_amount,
           COALESCE(MAX(t.amount), 0)::numeric(12,2) AS max_amount,
           COUNT(t.transaction_id) FILTER (WHERE t.amount > 5000) AS high_value_count,
           COUNT(t.transaction_id) FILTER (WHERE t.transaction_type = 'Transfer') AS transfer_count
    FROM accounts a
    LEFT JOIN transactions t ON t.account_id = a.account_id
    GROUP BY a.account_id, a.customer_id, a.account_type, a.balance
)
SELECT s.*, c.customer_name, c.city,
       CASE WHEN s.max_amount > 8000 THEN 'High Risk' ELSE 'Normal' END AS risk_flag
FROM account_stats s
JOIN customers c ON c.customer_id = s.customer_id;

SELECT * FROM account_fraud_features ORDER BY account_id;

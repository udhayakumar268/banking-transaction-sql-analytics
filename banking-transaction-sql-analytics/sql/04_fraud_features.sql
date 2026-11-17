-- Exercise 54: January account-level features (all transaction types).
SELECT a.account_id, c.customer_name,
       COUNT(t.transaction_id) AS total_transactions,
       SUM(t.amount) AS total_amount,
       ROUND(AVG(t.amount), 2) AS avg_amount,
       MAX(t.amount) AS max_amount,
       SUM(CASE WHEN t.amount > 5000 THEN 1 ELSE 0 END) AS high_value_count,
       CASE WHEN MAX(t.amount) > 8000 THEN 'High Risk' ELSE 'Normal' END AS risk_flag
FROM customers c
JOIN accounts a ON a.customer_id = c.customer_id
JOIN transactions t ON t.account_id = a.account_id
WHERE t.transaction_date >= DATE '2026-01-01'
  AND t.transaction_date < DATE '2026-02-01'
GROUP BY a.account_id, c.customer_name
ORDER BY total_amount DESC;

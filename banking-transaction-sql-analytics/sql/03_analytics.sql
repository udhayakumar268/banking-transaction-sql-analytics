-- Exercise 53: January transfers above 10,000 per customer.
SELECT c.customer_id, c.customer_name,
       SUM(t.amount) AS total_transfer_amount,
       COUNT(t.transaction_id) AS transfer_count,
       ROUND(AVG(t.amount), 2) AS avg_transfer_amount
FROM customers c
JOIN accounts a ON a.customer_id = c.customer_id
JOIN transactions t ON t.account_id = a.account_id
WHERE t.transaction_type = 'Transfer'
  AND t.transaction_date >= DATE '2026-01-01'
  AND t.transaction_date < DATE '2026-02-01'
GROUP BY c.customer_id, c.customer_name
HAVING SUM(t.amount) > 10000
ORDER BY total_transfer_amount DESC;

-- Monthly transaction volumes, all types.
SELECT DATE_TRUNC('month', transaction_date)::date AS month,
       transaction_type, COUNT(*) AS transaction_count,
       SUM(amount) AS total_amount
FROM transactions
GROUP BY 1, 2
ORDER BY 1, 2;

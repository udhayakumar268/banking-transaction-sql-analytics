-- Exercise 58: one row per account, including zero-transaction accounts.
-- The risk flag is a heuristic demonstration, NOT a ground-truth fraud label.
SELECT account_id, customer_id, account_type, balance, city,
       total_transactions, total_amount, avg_amount, max_amount,
       high_value_count, transfer_count,
       CASE WHEN risk_flag = 'High Risk' THEN 1 ELSE 0 END AS heuristic_risk_flag
FROM account_fraud_features
ORDER BY account_id;

-- In psql, export using client-side \copy (edit the destination path as needed):
-- \copy (SELECT account_id, customer_id, account_type, balance, city, total_transactions, total_amount, avg_amount, max_amount, high_value_count, transfer_count, CASE WHEN risk_flag = 'High Risk' THEN 1 ELSE 0 END AS heuristic_risk_flag FROM account_fraud_features ORDER BY account_id) TO 'outputs/ml_ready_account_features.csv' WITH (FORMAT CSV, HEADER TRUE)

-- Verify record counts and basic data integrity.
SELECT 'customers' AS table_name, COUNT(*) AS rows FROM customers
UNION ALL SELECT 'accounts', COUNT(*) FROM accounts
UNION ALL SELECT 'transactions', COUNT(*) FROM transactions;

SELECT COUNT(*) AS orphaned_transactions
FROM transactions t LEFT JOIN accounts a ON a.account_id = t.account_id
WHERE a.account_id IS NULL;

-- Transaction control demonstration: update and then roll back, leaving data unchanged.
BEGIN;
UPDATE accounts SET balance = balance + 100 WHERE account_id = 201;
SELECT account_id, balance FROM accounts WHERE account_id = 201;
ROLLBACK;
SELECT account_id, balance FROM accounts WHERE account_id = 201;

-- Example of UPDATE / DELETE / ALTER TABLE syntax is intentionally not run on project data:
-- ALTER TABLE customers ADD COLUMN phone VARCHAR(30);
-- UPDATE customers SET city = 'Newport' WHERE customer_id = 102;
-- DELETE FROM transactions WHERE transaction_id = 14;

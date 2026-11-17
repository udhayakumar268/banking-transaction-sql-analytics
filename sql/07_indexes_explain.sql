-- Exercise 57: indexes to support date filtering and account/date lookups.
CREATE INDEX IF NOT EXISTS idx_transactions_date ON transactions (transaction_date);
CREATE INDEX IF NOT EXISTS idx_transactions_account_date
    ON transactions (account_id, transaction_date);

-- Review plan and actual timing. Tiny sample tables may still favour sequential scans.
EXPLAIN (ANALYZE, BUFFERS)
SELECT account_id, COUNT(*), SUM(amount)
FROM transactions
WHERE transaction_date >= DATE '2026-01-01'
  AND transaction_date < DATE '2026-02-01'
GROUP BY account_id;

# Banking Transaction Analytics & Fraud Detection Features (PostgreSQL)

A portfolio-ready SQL project using **synthetic banking data** to demonstrate relational modelling, analytics, feature engineering, window functions, views, and query optimisation.

## Stack
PostgreSQL, SQL, psql (optional), VS Code, Git/GitHub.

## Schema
`customers (1) → (many) accounts (1) → (many) transactions`.

## Setup
1. Create an empty PostgreSQL database, for example `banking_analytics`.
2. Run `sql/01_schema.sql` **only in that dedicated database**. It drops and recreates the three project tables, deleting their existing data.
3. Run `sql/02_seed.sql` once.
4. Run `sql/03_analytics.sql` through `sql/09_validation_transactions.sql` in filename order.

Using `psql` from the project root (banking_analytics):

```bash
createdb banking_analytics
for file in sql/*.sql; do psql -v ON_ERROR_STOP=1 -d banking_analytics -f "$file" || break; done
```

On Windows, run the numbered SQL files sequentially in pgAdmin Query Tool or use `psql -d banking_analytics -f sql/01_schema.sql`, repeating for each file.

## Key deliverables
- `03_analytics.sql`: January transfer totals by customer.
- `04_fraud_features.sql`: January account features and simple risk flags.
- `05_window_functions.sql`: prior transaction, rank, and sudden increase detection.
- `06_views_ctes.sql`: reusable all-time feature view.
- `07_indexes_explain.sql`: indexing and query-plan inspection.
- `08_ml_dataset.sql`: account-level ML-ready feature selection and optional CSV export.
- `09_validation_transactions.sql`: integrity checks and rollback demonstration.

## Expected results
January transfers over 10,000: David (18,000, 3 transfers), John (12,500, 3 transfers).
January risk features: David and John = High Risk; Sarah = Normal.

## Important limitations
This dataset has only 5 accounts and 14 transactions, so it is **not sufficient to train or evaluate a meaningful fraud model**. The `heuristic_risk_flag` is derived from transaction amounts, not a verified fraud label. Do not treat it as ground truth; using it as a target with its source features would cause target leakage. The sample is for SQL demonstration only.

## GitHub
```bash
git init
git add .
git commit -m "Build PostgreSQL banking analytics portfolio project"
git branch -M main
git remote add origin <https://github.com/udhayakumar268/banking-transaction-sql-analytics>
git push -u origin main
``` 
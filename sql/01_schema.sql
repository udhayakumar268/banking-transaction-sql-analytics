-- Run against a dedicated PostgreSQL database.
-- Rerunnable setup: drops only this project's three tables.
DROP VIEW IF EXISTS account_fraud_features CASCADE;
DROP TABLE IF EXISTS transactions CASCADE;
DROP TABLE IF EXISTS accounts CASCADE;
DROP TABLE IF EXISTS customers CASCADE;

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    city VARCHAR(100)
);
CREATE TABLE accounts (
    account_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES customers(customer_id),
    account_type VARCHAR(30) NOT NULL,
    balance NUMERIC(12,2) NOT NULL CHECK (balance >= 0)
);
CREATE TABLE transactions (
    transaction_id INTEGER PRIMARY KEY,
    account_id INTEGER NOT NULL REFERENCES accounts(account_id),
    amount NUMERIC(12,2) NOT NULL CHECK (amount > 0),
    transaction_type VARCHAR(30) NOT NULL,
    transaction_date DATE NOT NULL
);

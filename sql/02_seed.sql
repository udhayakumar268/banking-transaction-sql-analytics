INSERT INTO customers (customer_id, customer_name, email, city) VALUES
(101, 'John', 'john@example.com', 'London'),
(102, 'Sarah', 'sarah@example.com', 'Cardiff'),
(103, 'David', 'david@example.com', 'Bristol'),
(104, 'Emma', 'emma@example.com', 'Manchester'),
(105, 'James', 'james@example.com', 'Birmingham');

INSERT INTO accounts (account_id, customer_id, account_type, balance) VALUES
(201, 101, 'Savings', 15000),
(202, 102, 'Current', 8000),
(203, 103, 'Savings', 25000),
(204, 104, 'Current', 12000),
(205, 105, 'Savings', 18000);

INSERT INTO transactions (transaction_id, account_id, amount, transaction_type, transaction_date) VALUES
(1, 201, 1000, 'Transfer', '2026-01-05'),
(2, 201, 2500, 'Transfer', '2026-01-10'),
(3, 201, 9000, 'Transfer', '2026-01-15'),
(4, 202, 500, 'Payment', '2026-01-07'),
(5, 202, 1500, 'Transfer', '2026-01-12'),
(6, 202, 7000, 'Transfer', '2026-01-20'),
(7, 203, 2000, 'Transfer', '2026-01-06'),
(8, 203, 4000, 'Transfer', '2026-01-14'),
(9, 203, 12000, 'Transfer', '2026-01-25'),
(10, 204, 3000, 'Payment', '2026-02-02'),
(11, 204, 8000, 'Transfer', '2026-02-08'),
(12, 205, 600, 'Transfer', '2026-02-05'),
(13, 205, 1800, 'Transfer', '2026-02-12'),
(14, 205, 10000, 'Transfer', '2026-02-20');

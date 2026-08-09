# SQL Basics — Coding Exercises (Days 1-4)

Practice problems only — no solutions. Use PostgreSQL if you can (matches RDS/Aurora you'll see in real DevOps work).

## Sample schema to create first
Run these to set up the two tables every exercise below runs against.

```sql
CREATE TABLE servers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    status VARCHAR(20),
    region VARCHAR(20),
    cpu_usage NUMERIC(5,2),
    created_at DATE
);

CREATE TABLE deployments (
    id SERIAL PRIMARY KEY,
    server_id INT,
    status VARCHAR(20),
    deployed_at DATE
);
```

```sql
INSERT INTO servers (name, status, region, cpu_usage, created_at) VALUES
('web-01', 'running', 'us-west-2', 45.20, '2026-01-10'),
('web-02', 'running', 'us-west-2', 88.50, '2026-02-15'),
('db-01',  'running', 'us-east-1', 92.10, '2026-01-05'),
('db-02',  'stopped', 'us-east-1', 0.00,  '2026-03-01'),
('cache-01', 'error',   'us-west-1', 76.30, '2026-02-20'),
('cache-02', 'running', 'us-west-1', 55.00, '2026-04-01'),
('api-01', 'running', 'us-east-1', 81.40, '2026-03-18'),
('api-02', 'stopped', 'us-west-2', 12.00, '2026-04-10'),
('worker-01', 'running', 'ap-south-1', 67.90, '2026-01-25'),
('worker-02', 'error',   'ap-south-1', 95.00, '2026-04-22');
```

```sql
INSERT INTO deployments (server_id, status, deployed_at) VALUES
(1, 'success', '2026-01-11'),
(1, 'success', '2026-02-01'),
(2, 'failed',  '2026-02-16'),
(2, 'success', '2026-02-20'),
(3, 'success', '2026-01-06'),
(3, 'failed',  '2026-03-02'),
(3, NULL,      '2026-03-15'),
(5, 'failed',  '2026-02-21'),
(6, 'success', '2026-04-02'),
(7, 'success', '2026-03-19'),
(7, 'success', '2026-04-05'),
(9, 'success', '2026-01-26'),
(10, 'failed', '2026-04-23'),
(99, 'success', '2026-03-10'),
(100, 'failed', '2026-04-15');
```

Notes on this data:
- Servers `4` (`db-02`) and `8` (`api-02`) have **no deployments at all** — use these for the "zero deployments" exercise in Day 4.
- Deployments referencing `server_id` 99 and 100 have **no matching server** — use these for the "orphaned deployment" exercise in Day 4.
- One deployment row has a `NULL` status — use it for the `IS NULL` exercise in Day 2.

---

## Day 1 — `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`

1. Select all columns from `servers`.
2. Select only `name` and `status` from `servers`.
3. Select all servers where `status = 'running'`.
4. Select all servers with `cpu_usage` greater than 80.
5. Select all servers, ordered by `cpu_usage` from highest to lowest.
6. Select the 3 most recently created servers (`ORDER BY` + `LIMIT`).
7. Select the single server with the highest `cpu_usage` (combine `ORDER BY` + `LIMIT 1`).

---

## Day 2 — Filtering & operators

1. Select servers where `status = 'stopped'` OR `status = 'error'`.
2. Rewrite the same query using `IN` instead of `OR`.
3. Select servers with `cpu_usage` between 50 and 90 using `BETWEEN`.
4. Select servers whose `name` starts with `"web-"` using `LIKE`.
5. Select deployments where `status` is `NULL` (simulate a couple of rows with missing status first) using `IS NULL`.
6. Combine conditions: select running servers in the `"us-west-2"` region with `cpu_usage` above 70.
7. Select servers whose name contains `"db"` anywhere in it (`LIKE` with `%` on both sides).

---

## Day 3 — Aggregate functions & `GROUP BY`/`HAVING`

1. Count the total number of servers.
2. Count how many servers are in each `status` (`GROUP BY status`).
3. Find the average `cpu_usage` across all servers.
4. Find the min and max `cpu_usage` per `region` (`GROUP BY region`).
5. Count how many deployments have `status = 'failed'`.
6. Group deployments by `status` and count each — this simulates a "deployment success rate" report.
7. Using `HAVING`, find only the regions where the average `cpu_usage` is above 75 (i.e., filter groups, not rows).
8. Find how many deployments each `server_id` has, sorted from most to fewest (`GROUP BY server_id`, `ORDER BY count DESC`).

---

## Day 4 — Joins

1. Write an `INNER JOIN` between `servers` and `deployments` to list each deployment alongside its server's `name` and `region`.
2. Write a `LEFT JOIN` from `servers` to `deployments` to list every server, including ones that have **no** deployments (their deployment columns will show as NULL).
3. Using the `LEFT JOIN` from #2, find all servers that have zero deployments (`WHERE deployment column IS NULL`) — simulates finding "servers never deployed to."
4. Write a `RIGHT JOIN` (or flip it as a `LEFT JOIN`) to find any deployments that reference a `server_id` that doesn't exist in `servers` — simulates finding orphaned/broken records, a real data-integrity check.
5. Combine a join with an aggregate: for each server, count how many deployments it has, including servers with zero (`LEFT JOIN` + `GROUP BY` + `COUNT`).
6. Combine a join with filtering: list all failed deployments along with the server's `name` and `region`, but only for servers in `"us-east-1"`.

---

## How to use this
Do the exercises in order — Day 4 deliberately reuses the same `servers`/`deployments` tables from Days 1-3 so joins feel like a natural extension, not a new topic. If a query returns nothing or errors, that's normal — debugging your own SQL is part of the exercise.

-- Question 2---
---Step 1: Identify each customer's latest day
WITH LatestPerCustomer AS (
    SELECT
        customer_id,
        utilization_percent,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY date DESC) AS rn
    FROM dbo.Loan_Snap_shot_Dataset
)

-- Step 2: Calculating average utilization across all customers---
SELECT
    AVG(utilization_percent) AS avg_utilization_pct
FROM LatestPerCustomer
WHERE rn = 1
---Question 4----
WITH Customers AS (
    SELECT *
    FROM dbo.Loan_Snap_shot_Dataset
    WHERE date <= DATEADD(DAY, 59, (SELECT MIN(date) FROM dbo.Loan_Snap_shot_Dataset))
),
LatestBalance AS (
    SELECT
        customer_id,
        outstanding_balance,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY date DESC) AS rn
    FROM Customers
)
SELECT
    COUNT(*) AS fully_paid_customers
FROM LatestBalance
WHERE rn = 1
  AND outstanding_balance = 0
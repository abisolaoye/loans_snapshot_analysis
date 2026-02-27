---Question 3---
WITH Customers AS (
    SELECT *
    FROM dbo.Loan_Snap_shot_Dataset
    WHERE date <= DATEADD(DAY, 59, (SELECT MIN(date) FROM dbo.Loan_Snap_shot_Dataset))
)
SELECT
    customer_id,
    MAX(days_in_arrears) AS max_days_in_arrears
FROM Customers
GROUP BY customer_id
ORDER BY customer_id;
WITH LatestPerCustomer AS (
    SELECT
        customer_id,
        risk_band,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY date DESC) AS rn
    FROM dbo.Loan_Snap_shot_Dataset
)
SELECT
    risk_band,
    COUNT(*) AS num_customers
FROM LatestPerCustomer
WHERE rn = 1
GROUP BY risk_band
ORDER BY risk_band
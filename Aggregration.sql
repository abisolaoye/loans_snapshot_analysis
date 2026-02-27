---Question 1

WITH Customers AS (
    SELECT 
        customer_id,
        cumulative_repayment,
        cumulative_interest,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY date DESC) AS rn
    FROM dbo.Loan_Snap_shot_Dataset
    WHERE date <= DATEADD(DAY, 59, (SELECT MIN(date) FROM dbo.Loan_Snap_shot_Dataset))
)
SELECT
    customer_id,
    MAX(cumulative_repayment) AS total_cumulative_repayment,
    MAX(cumulative_interest) AS total_cumulative_interest
FROM Customers
GROUP BY customer_id
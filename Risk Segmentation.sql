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
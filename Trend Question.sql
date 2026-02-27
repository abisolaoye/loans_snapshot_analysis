 ----Question 6---

  WITH CustomerPayments AS (
    SELECT *
    FROM dbo.Loan_Snap_shot_Dataset
    WHERE customer_id = 'C001'  
)
SELECT
    date,
    cumulative_paid,
    cumulative_paid - LAG(cumulative_paid, 1, 0) OVER (ORDER BY date) AS daily_paid
FROM CustomerPayments
ORDER BY date

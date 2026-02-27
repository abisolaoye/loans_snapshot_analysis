#Statistics and Data Interpretation

1- I would track the rate of decline in utilization over time, since utilization reflects the proportion of the loan still outstanding. Customers with the largest and fastest reductions in utilization over the 60-day window would be considered to be repaying most aggressively.
I would track the rate of decline in utilization over time, since utilization reflects the proportion of the loan still outstanding. Customers with the largest and fastest reductions in utilization over the 60-day window would be considered to be repaying most aggressively.

SELECT TOP 20
    loan_amount,
    outstanding_balance,
    [utilization_percent],
    (outstanding_balance * 100.0 / loan_amount) AS calculated_utilization
FROM dbo.Loan_Snap_shot_Dataset;
 
Question 2

A high cumulative interest-to-repayment ratio indicates that a significant portion of the customer’s payments is being absorbed by interest rather than reducing principal. This typically suggests slower amortization of the loan balance and may indicate higher credit risk or potential financial stress, especially if the pattern persists over time.

Question 3:

I would visualize repayment performance using a portfolio-level time-series of average utilization or outstanding balance to monitor overall trends. For deeper behavioral insight, I would use segmented customer line charts or cohort heatmaps to compare repayment speed across customer groups while avoiding overplotting in large populations.

Question 4:

With large customer populations, I would use statistical techniques such as z-score standardization or IQR-based methods on key repayment metrics (e.g., utilization change, days in arrears, or payment velocity) to systematically flag customers whose behavior deviates materially from the portfolio norm. This approach scales better than visual inspection and supports automated risk monitoring.

Question 5:

With large customer populations,Primary metric: Delinquency rate over time.
 I would use statistical techniques such as z-score standardization or IQR-based methods on key repayment metrics (e.g., utilization change, days in arrears, or payment velocity) to systematically flag customers whose behavior deviates materially from the portfolio norm. This approach scales better than visual inspection and supports automated risk monitoring.
SELECT
    date,
    COUNT(CASE WHEN days_in_arrears > 0 THEN 1 END) * 100.0
        / COUNT(*) AS delinquency_rate
FROM dbo.Loan_Snap_shot_Dataset
GROUP BY date
ORDER BY date;


% of customers with days_in_arrears > 0
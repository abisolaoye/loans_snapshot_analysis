# Technical Analysis: Statistical Methodology & Data Interpretation

## Executive Summary
This report outlines the statistical frameworks used to evaluate loan repayment velocity, monitor portfolio health, and implement scalable anomaly detection. It demonstrates a data-driven approach to identifying risk and credit performance.

---

## 1. Analysis of Repayment Velocity
To identify the most aggressive repayers, I track the **Rate of Utilization Decay** over a 60-day window. 
* **Logic**: Utilization reflects the proportion of the loan still outstanding. 
* **Insight**: Customers with the largest and fastest reductions in utilization are identified as high-velocity repayers, signaling strong financial health.
  ``````sql
SELECT TOP 20
    loan_amount,
    outstanding_balance,
    utilization_percent,
    (outstanding_balance * 100.0 / loan_amount) AS calculated_utilization
FROM dbo.Loan_Snap_shot_Dataset;

## 2. Interest-to-Repayment Dynamics
A high **Cumulative Interest-to-Repayment Ratio** is a critical indicator of loan performance.
* **Analysis**: This suggests a significant portion of payments is absorbed by interest rather than principal reduction.
* **Risk Factor**: This pattern indicates **Slower Amortization** and can be a precursor to financial stress or elevated credit risk.

## 3. Advanced Data Visualization
To maintain clarity in large datasets, I employ a multi-layered visualization strategy:
* **Portfolio Level**: Time-series analysis of average utilization or outstanding balances to monitor macro trends.
* **Behavioral Insight**: Segmented line charts and **Cohort Heatmaps** to compare repayment speeds across groups while avoiding "overplotting."

## 4. Scalable Anomaly Detection
For large customer populations, manual inspection is replaced by automated statistical techniques:
* **Z-Score Standardization**: Used to flag customers whose behavior deviates materially from the portfolio mean.
* **IQR-Based Methods**: Applied to payment velocity and days in arrears to isolate behavioral outliers.
* **Scalability**: This approach supports automated risk monitoring and scales efficiently across millions of records.

## 5. Primary KPI: Portfolio Health
The core metric for monitoring the portfolio is the **Delinquency Rate Over Time**.
* **Methodology**: I use statistical flagging (Z-Scores/IQR) to systematically monitor key metrics like payment velocity and utilization change.
* **Goal**: To detect deviations from the portfolio norm and enable proactive risk management.

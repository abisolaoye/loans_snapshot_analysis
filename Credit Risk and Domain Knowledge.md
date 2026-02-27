# Technical Brief: Credit Risk Framework & Domain Expertise

## Executive Summary
This document outlines the strategic application of credit risk metrics, delinquency segmentation, and predictive behavioral monitoring. It demonstrates a data-driven approach to mitigating portfolio risk through granular analysis of repayment patterns and exposure management.

---

## 1. Delinquency Metrics: Days in Arrears vs. DPD Buckets
In credit risk modeling, understanding the distinction between granular and categorical data is vital for regulatory compliance and collection efficiency.

* **Days in Arrears**: Provides a granular, continuous measure of how long a customer has missed a payment (e.g., 15 days). This serves as the primary signal for emerging risk.
* **DPD (Days Past Due) Bucketing**: Categorizes arrears into standardized risk tiers:
    * **Tier 1**: 0 Days (Current)
    * **Tier 2**: 1–30 Days (Early Delinquency)
    * **Tier 3**: 31–60 Days
    * **Tier 4**: 61–90 Days
    * **Tier 5**: 90+ Days (Standard Default/NPL threshold)

**Strategic Value**: Together, these metrics allow for structured **Expected Credit Loss (ECL)** calculations and prioritized collection workflows.

---

## 2. High-Priority Risk Indicators
A profile characterized by **High Utilization** coupled with **Early Delinquency (1–30 DPD)** represents a critical intervention point.
* **Analysis**: High utilization indicates a lack of financial buffer.
* **Intervention Strategy**: This profile warrants immediate proactive measures such as limit adjustments or targeted reminders to prevent migration into higher DPD buckets.

---

## 3. Risk Scoring Model Design
To build a robust scoring model, I advocate for an integrated feature set:
* **Core Features**: Cumulative Repayment, Utilization, Days in Arrears, Outstanding Balance, and DPD Buckets.
* **Methodology**:
    1.  **Standardization**: Categorize features to ensure comparability.
    2.  **Aggregation**: Use a points-based heuristic or a **Logistic Regression** model to predict the **Probability of Default (PD)**.
    3.  **Segmentation**: Classify customers into Low, Medium, and High-risk tranches for automated decisioning.

---

## 4. Differential Risk Band Allocation
It is a common misconception that exposure size (Outstanding Balance) dictates risk. In advanced credit modeling:
* **Exposure vs. Behavior**: Two customers with identical balances may reside in different risk bands based on **Repayment Consistency**.
* **The Differentiator**: A customer with high balance but consistent, timely payments is lower risk than a customer with the same balance exhibiting **Deteriorating Repayment Patterns** or frequent DPD migration.

---

## 5. Proactive Default Mitigation Framework
To minimize defaults, I monitor forward-looking behavioral indicators to detect "early-warning" deterioration:

| Metric | Strategic Significance |
| :--- | :--- |
| **DPD Migration** | Identifies accounts rolling into higher delinquency tiers. |
| **Utilization Trends** | Signals a reducing repayment buffer and potential financial stress. |
| **Repayment Momentum** | Monitoring daily changes in `cumulative_paid` to detect slowing velocity. |
| **Portfolio Delinquency Rate** | Provides a macro view of portfolio health and systemic risk. |

**Goal**: Enable proactive collections and limit management before accounts reach the 90+ DPD default threshold.

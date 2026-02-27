#Credit Risk /Domain Knowlegde

Days_in_arrears means the number of days a customer has missed a payment.

This directs the measure of repayment delinquency and also signals emerging risk before default occurs.
Example:
A customer who hasn’t paid for 15 days has days_in_arrears = 15. This immediately flags them as potentially risky.
What DPD buckets are

DPD = Days Past Due

Buckets categorize customers by risk levels based on how long they’ve been delinquent.E.g 0, 1-30,31-60,61-90,90+
Days_in_arrears provides a granular measure of how long a customer has missed payments, while DPD buckets categorize those arrears into risk tiers. Together, they allow credit risk teams to monitor early signs of default, segment the portfolio by risk, prioritize collection efforts, and calculate provisions or expected credit losses in a structured and regulatory-compliant way.


Question2:
A customer with high utilization and early delinquency is a high-priority watch. The high utilization means they have little capacity to absorb financial shocks, while the 1–30 DPD indicates emerging repayment issues. Together, this profile signals elevated credit risk and may warrant early intervention, such as monitoring, reminders, or limit adjustments.


Question 3: 
To design a risk scoring model using this dataset, I would combine key features such as cumulative repayment, utilization, days_in_arrears, outstanding balance, and DPD buckets. Each feature would be standardized or categorized to ensure comparability, then aggregated into a single risk score — either through a points-based rule (e.g., high utilization, early arrears, low repayment progress increase the score) or a statistical model such as logistic regression predicting probability of default. The resulting score allows customers to be segmented into low, medium, and high-risk categories, providing a structured, interpretable way to monitor repayment behavior and prioritize interventions.
Question 4: 
Two customers with the same outstanding balance may fall into different risk bands because risk assessment in credit portfolios is driven by repayment behavior and delinquency patterns rather than exposure size alone. While outstanding balance reflects the level of exposure, factors such as days_in_arrears, DPD bucket movement, utilization trends, repayment consistency, and historical payment behavior provide deeper insight into a customer’s likelihood of default. For example, a customer who maintains timely repayments and low arrears despite a high balance would typically be classified as lower risk, whereas another customer with the same balance but showing early delinquency or deteriorating repayment patterns would be assigned to a higher risk band.

Question 5

To minimize defaults, I would monitor a set of forward-looking behavioral indicators that signal early deterioration in repayment capacity. Key daily metrics would include days_in_arrears and migration across DPD buckets, as these provide the earliest warning of emerging delinquency. I would also track utilization trends, since sustained high utilization reduces a customer’s repayment buffer and often precedes stress. In addition, monitoring the day-over-day change in cumulative_paid helps identify slowing repayment momentum, while trends in outstanding_balance highlight customers whose exposure is not reducing as expected. At the portfolio level, I would closely watch the daily delinquency rate and the share of customers moving into higher risk bands. Together, these indicators provide an early warning framework that enables proactive collections, credit limit adjustments, and targeted customer engagement to prevent accounts from rolling into default.
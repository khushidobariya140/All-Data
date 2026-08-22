# Statistical Analysis of Transaction Data (Spread Locator Dataset)

## Project Overview :-

This project focuses on analyzing transaction data using statistical distributions and hypothesis-based techniques.
The goal is to understand the behavior of transaction occurrences, frequency, and amount patterns using Python.

----------------------------------------------------------------------------------------------------------------------
#  Part A – Theoretical Foundation

## 1. Statistical Distribution

A statistical distribution describes how data values are spread across different ranges.

* Helps understand patterns and trends in data
* Can be discrete or continuous
* Used in modeling real-world phenomena

----------------------------------------------------------------------------------------------------------------------
## 2. Q-Q Plot

A Quantile-Quantile (Q-Q) plot compares sample data with a theoretical distribution.

* Straight line → data is normally distributed
* Curved pattern → deviation from normality
* Helps validate assumptions for statistical tests

----------------------------------------------------------------------------------------------------------------------

## 3. Discrete vs Continuous Distribution

| Discrete                        | Continuous                  |
| ------------------------------- | --------------------------- |
| Countable values                | Infinite values             |
| Uses PMF                        | Uses PDF                    |
| Example: Number of transactions | Example: Transaction amount |

----------------------------------------------------------------------------------------------------------------------

## 4. Bernoulli Distribution

* Models binary outcomes (0 or 1)
* Used for single trial experiments
* Example: Transaction occurred or not

----------------------------------------------------------------------------------------------------------------------

## 5. Binomial Distribution

* Extension of Bernoulli for multiple trials
* Models number of successes
* Example: Weekly transaction counts

----------------------------------------------------------------------------------------------------------------------
## 6. Log-Normal Distribution

* Data whose logarithm is normally distributed
* Right-skewed distribution
* Common in financial data like transaction amounts

----------------------------------------------------------------------------------------------------------------------

## 7. Power Law Distribution

* Heavy-tailed distribution
* Few large values dominate
* Used in risk and financial modeling

---------------------------------------------------------------------------------------------------------------------

## 8. Box-Cox Transform

* Stabilizes variance
* Converts non-normal data into normal-like data
* Improves model performance

---------------------------------------------------------------------------------------------------------------------

## 9. Poisson Distribution

* Models number of events in fixed interval
* Used for daily transaction counts
* Parameter: λ (average rate)

----------------------------------------------------------------------------------------------------------------------

## 10. Z-Score Probability

* Measures distance from mean in standard deviations
* Used to detect outliers and probabilities

-----------------------------------------------------------------------------------------------------------------------

## 11. PDF vs CDF

* PDF → Probability at a specific value
* CDF → Cumulative probability up to a value

------------------------------------------------------------------------------------------------------------------------

#  Part B – Data Analysis & Interpretation

## Bernoulli & Binomial Distribution

* Probability of transaction occurrence remains consistent
* Weekly transaction counts follow a binomial pattern
* Useful for predicting transaction activity

-----------------------------------------------------------------------------------------------------------------------

##  Poisson Distribution (Daily Transactions)

* Daily transactions follow Poisson distribution
* Indicates events occur randomly but with a fixed average rate
* Suitable for modeling transaction frequency

-----------------------------------------------------------------------------------------------------------------------

##  Log-Normal Distribution (Transaction Amounts)

* Transaction amounts are right-skewed
* Log-normal provides the best fit
* Indicates most transactions are small, few are very large

------------------------------------------------------------------------------------------------------------------------

##  Power Law Distribution

* Confirms presence of heavy-tail behavior
* Large transactions are rare but impactful

------------------------------------------------------------------------------------------------------------------------

## Q-Q Plot Interpretation

* Data deviates from normal distribution
* Indicates skewness in transaction amounts

------------------------------------------------------------------------------------------------------------------------

## Box-Cox Transformation

* Improves normality of data
* Reduces skewness
* Makes data suitable for statistical modeling

-------------------------------------------------------------------------------------------------------------------------

## Z-Score & Probability (> ₹5000)

* High-value transactions are rare
* Probability of amount exceeding ₹5000 is low
* Helps identify unusual transactions

--------------------------------------------------------------------------------------------------------------------------

## PDF & CDF Analysis

* PDF shows distribution shape of transaction amounts
* CDF shows cumulative probability
* Helps in understanding thresholds and risk levels

-------------------------------------------------------------------------------------------------------------------------

->->-> Final Conclusion

* Transaction frequency is best modeled using **Poisson distribution**
* Transaction amounts follow **Log-Normal distribution**
* Data is **not normally distributed**, confirmed by Q-Q plot
* **Box-Cox transformation** improves data quality
* High-value transactions are **rare but significant**
* These insights help in **fraud detection, risk analysis, and decision-making**

-------------------------------------------------------------------------------------------------------------------------


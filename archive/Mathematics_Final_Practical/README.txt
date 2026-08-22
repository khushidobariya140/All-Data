#  Student Performance Analysis Project (Detailed Report)

##  Project Overview  ##

This project is a **mini research analysis** combining both
**theoretical concepts** and **practical implementation** using Python.
The dataset (`students_scores.csv`) contains approximately 5000 student
records and is used to analyze academic performance, study behavior, and
statistical patterns.

------------------------------------------------------------------------

## Dataset Description

The dataset includes the following attributes:

  Feature Name    Description
  --------------- ------------------------------------
  Student_ID      Unique identifier for each student
  Age             Age of the student
  Math_Score      Marks in Mathematics
  Science_Score   Marks in Science
  English_Score   Marks in English
  Hours_Studied   Number of hours studied
  Pass_Fail       1 = Pass, 0 = Fail

------------------------------------------------------------------------

##  Part A -- Theory Concepts

### 1. Mean, Median, Mode

-   **Mean** is the average value of data.
-   **Median** is the middle value when data is sorted.
-   **Mode** is the most frequently occurring value.
-   Example: If marks are \[50, 60, 70, 70, 80\], Mean = 66, Median =
    70, Mode = 70.

### 2. Variance vs Standard Deviation

-   **Variance** measures spread of data from mean.
-   **Standard Deviation** is square root of variance.
-   SD is easier to interpret because it is in same units.

### 3. Normal Distribution

-   A bell-shaped curve where most values cluster around the mean.
-   Used in exam scores, heights, etc.

### 4. Skewness & Kurtosis

-   **Skewness** shows data symmetry (left/right tilt).
-   **Kurtosis** shows how peaked or flat distribution is.

### 5. Probability

-   **Probability** = chance of an event happening.
-   **Empirical**: Based on data (observed).
-   **Theoretical**: Based on formula.

### 6. Independent vs Dependent Events

-   Independent: No effect on each other (e.g., coin toss).
-   Dependent: One affects the other (e.g., drawing cards).

### 7. Bayes Theorem

-   Helps update probability based on new information.
-   Used in spam filtering, medical diagnosis.

### 8. Eigenvalues & Eigenvectors

-   Used in matrix transformations.
-   Important in ML, PCA, data compression.

------------------------------------------------------------------------

##  Part B -- Practical Implementation

###  Step 1: Measures of Central Tendency & Dispersion

#### Tasks:

-   Calculate Mean, Median, Mode of `Math_Score`
-   Calculate Range, Variance, Standard Deviation of `Science_Score`

#### Sample Code:

import pandas as pd

df = pd.read_csv("students_scores.csv")

print(df['Math_Score'].mean())
print(df['Math_Score'].median())
print(df['Math_Score'].mode())

print(df['Science_Score'].var())
print(df['Science_Score'].std())


------------------------------------------------------------------------

###  Step 2: Probability Basics

#### Tasks:

-   Probability of passing
-   Contingency table
-   Conditional probability

#### Sample Code:


# Probability of passing
pass_prob = df['Pass_Fail'].mean()

# Contingency table
table = pd.crosstab(df['Pass_Fail'], df['Hours_Studied'] > 5)

# Conditional probability
cond_prob = table.loc[1, True] / table[True].sum()


------------------------------------------------------------------------

###  Step 3: Distribution & Visualization

#### Tasks:

-   Histogram + Normal Curve
-   Skewness & Kurtosis
-   Q-Q Plot

#### Sample Code:

 python
import matplotlib.pyplot as plt
import seaborn as sns
import scipy.stats as stats

# Histogram
sns.histplot(df['Math_Score'], kde=True)
plt.show()

# Skewness & Kurtosis
print(df['Science_Score'].skew())
print(df['Science_Score'].kurt())

# Q-Q Plot
stats.probplot(df['English_Score'], dist="norm", plot=plt)
plt.show()

------------------------------------------------------------------------

###  Step 4: Linear Algebra Mini Task

#### Tasks:

-   Represent vectors
-   Dot product
-   Norms
-   Angle between vectors

#### Sample Code:


import numpy as np

math_vec = df['Math_Score'].head(5).values
science_vec = df['Science_Score'].head(5).values

# Dot product
dot = np.dot(math_vec, science_vec)

# Norms
norm1 = np.linalg.norm(math_vec, 1)
norm2 = np.linalg.norm(math_vec)

# Angle
angle = np.arccos(dot / (np.linalg.norm(math_vec) * np.linalg.norm(science_vec)))


------------------------------------------------------------------------

##  Key Insights (Example)

-   Students studying more than 5 hours have higher probability of
    passing.
-   Math scores tend to follow a near normal distribution.
-   Science scores show moderate variability.
-   Strong correlation between study hours and performance.

------------------------------------------------------------------------


##  Conclusion

This project helps understand real-world application of statistics and
data analysis. It demonstrates how theoretical concepts are applied
using Python to extract meaningful insights from data.

------------------------------------------------------------------------

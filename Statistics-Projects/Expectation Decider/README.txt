-> Integrated Probability Analysis on Student Performance Dataset <-

:- Project Description -:

This project demonstrates the application of probability and statistical analysis using a student performance dataset. The analysis is implemented using Python in a Jupyter Notebook environment.

The goal of this project is to understand how different academic factors such as study hours, attendance, and participation in group discussions influence the probability of students passing the final examination.

The project applies multiple statistical concepts including probability calculations, probability distributions, contingency tables, conditional probability, and Bayes theorem.

->  Dataset Information

The dataset contains information about students and their academic behavior.

Key Variables in the Dataset

StudyHours
Number of hours a student studies per week.

Attendance
Attendance percentage of the student.

group_discussion
Indicates whether the student participates in group discussions.
Values: Yes / No

final_exam_pass
Indicates the final exam result of the student.
Values: Pass / Fail

This dataset helps analyze the relationship between academic behavior and exam outcomes.

::: Project Objectives :::

The main objectives of this project are:

• To understand the fundamental concepts of probability
• To calculate empirical and theoretical probabilities
• To analyze relationships between different student behaviors
• To visualize overlapping conditions using a Venn diagram
• To apply conditional probability and Bayes theorem
• To interpret statistical results in a real-world context

-> Section 1: Understanding the Basics :-

This section introduces the basic concepts of probability.

Probability measures the likelihood that an event will occur. The probability value ranges from 0 to 1.

Key terms explained in this section include:

Experiment

Sample Space

Event

Empirical Probability

Theoretical Probability

Example events from the dataset include:

• Students studying more than 10 hours per week
• Students with attendance greater than 80%
• Students who passed the final exam

-> Section 2: Types of Probability Events :-

Two types of probability are calculated in this project.

Empirical Probability

Empirical probability is calculated using actual observed data from the dataset.

Example:
Probability that a student passes the final exam based on dataset results.

Theoretical Probability

Theoretical probability is calculated using mathematical probability formulas.

In this project, the Binomial Distribution is used to calculate probabilities when three students are randomly selected from the dataset.

-> Section 3: Random Variable & Probability Distribution :-

A random variable (X) is defined as the number of students passing the exam out of three randomly selected students.

Possible values of X:

0 students pass
1 student passes
2 students pass
3 students pass

A probability distribution table is created using the binomial probability formula.

Statistical measures calculated:

• Mean (Expected Value)
• Variance

These measures help understand the average expected number of students passing.

-> Section 4: Venn Diagram Analysis :-

A Venn diagram is used to visualize the relationship between two events:

• Students studying more than 10 hours per week
• Students with attendance greater than 80%

The diagram shows:

• Students satisfying both conditions
• Students satisfying only one condition
• Students satisfying neither condition

This visualization helps understand the overlap between study behavior and attendance.

-> Section 5: Contingency Table & Probability Calculations :-

A contingency table is created using:

group_discussion vs final_exam_pass

From this table, three probabilities are calculated:

Joint Probability

Probability that a student participates in group discussion AND passes the exam.

Marginal Probability

Overall probability that a student passes the final exam.

Conditional Probability

Probability that a student passes the exam given that the student participated in group discussions.

-> Section 6: Understanding Relationships :-

This section interprets the calculated probabilities to analyze the relationship between events.

It determines whether the events are:

Independent Events
When one event does not affect the probability of another event.

Dependent Events
When one event influences the probability of another event.

Mutually Exclusive Events
Events that cannot occur at the same time.

In this dataset, a student can both participate in discussions and pass the exam, so the events are not mutually exclusive.

-> Section 7: Bayes Theorem Application :-

Bayes theorem is used to update probability when new information is available.

In this project, Bayes theorem calculates the probability that:

A student passed the exam given that the student has high attendance (>80%).

Using given probabilities:

• Probability of passing with high attendance
• Probability of failing with high attendance
• Probability of high attendance in the dataset

The final probability is calculated using the Bayes theorem formula.
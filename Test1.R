# Load the required libraries
library(tidyverse)

# Load your dataset from the CSV file
data <- read.csv("homework.csv")

# Display the first few rows of your dataset
head(data)

# Perform a t-test for a single group
t_test_result <- t.test(data$latitude, mu = 51.51)  # Testing against a population mean of 51.51

# Perform an F-test (variance test) for a single group
f_test_result <- var.test(data$latitude)

# Display the t-test and F-test results
cat("T-Test:\n")
print(t_test_result)
cat("\n")

cat("F-Test (Variance Test):\n")
print(f_test_result)

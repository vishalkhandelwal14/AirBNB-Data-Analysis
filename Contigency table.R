# Load required libraries
library(readr)
library(dplyr)
library(tidyr)
library(stats)

# Loading my the dataset
dataset <- read_csv("homework.csv")

# Checking the structure of the dataset
str(dataset)

# Analyzing two proportions using z or p tests
# Let's compare the proportions of two room types, e.g., "Entire home/apt" and "Private room"

# Create a contingency table
contingency_table <- table(dataset$room_type)

# Extract the counts for the two categories you want to compare
count_category1 <- contingency_table["Entire home/apt"]
count_category2 <- contingency_table["Private room"]

# Total number of observations
total_obs <- sum(contingency_table)

# Perform z or p test for two proportions
test_result <- prop.test(c(count_category1, count_category2), n = c(total_obs, total_obs))

# Print the results
cat("Proportion of Entire home/apt:", count_category1 / total_obs, "\n")
cat("Proportion of Private room:", count_category2 / total_obs, "\n")
print(test_result)

# Analyze categorical variables using χ2 independence test
#analyzing the relationship between "room_type" and another categorical variable "name"

# Create a contingency table
contingency_table <- table(dataset$room_type, dataset$name)

# Perform χ2 independence test
chi2_test_result <- chisq.test(contingency_table)

# Print the results
print(chi2_test_result)

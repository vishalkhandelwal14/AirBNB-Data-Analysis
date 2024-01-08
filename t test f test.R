# Load the required libraries
library(tidyverse)

# Loading dataset from the CSV file
data <- read.csv("homework.csv")

# Displaying the first few rows of my dataset
head(data)

# Creating a new grouping variable based on latitude threshold
data$grouping_variable_lat <- ifelse(data$latitude < 51.5, "Group1", "Group2")

# Creating a new grouping variable based on longitude threshold
data$grouping_variable_lon <- ifelse(data$longitude < 500, "Group3", "Group4")

# Performing t-test and F-test for latitude with latitude-based grouping
t_test_result_lat <- t.test(data$latitude ~ data$grouping_variable_lat)
f_test_result_lat <- var.test(data$latitude ~ data$grouping_variable_lat)

# Performing t-test and F-test for longitude with longitude-based grouping
t_test_result_lon <- t.test(data$longitude ~ data$grouping_variable_lon)
f_test_result_lon <- var.test(data$longitude ~ data$grouping_variable_lon)

# Display the t-test and F-test results for latitude
cat("T-Test for Latitude:\n")
print(t_test_result_lat)
cat("\nF-Test for Latitude:\n")
print(f_test_result_lat)

# Display the t-test and F-test results for longitude
cat("\nT-Test for Longitude:\n")
print(t_test_result_lon)
cat("\nF-Test for Longitude:\n")
print(f_test_result_lon)

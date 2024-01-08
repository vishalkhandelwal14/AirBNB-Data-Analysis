library(readr)
library(dplyr)
library(tidyverse)

# Load the data
data <- read.csv("homework.csv")

# choosing 'room_type' as my  categorical variable
category_column <- 'room_type'

# Table of counts for each room type
room_type_counts <- table(data[[category_column]])

# Calculating the total number of observations
total_obs <- length(data[[category_column]])

# Sample proportions for each room type
sample_proportions <- room_type_counts / total_obs

# Constructing confidence intervals for each room type
conf_intervals <- lapply(room_type_counts, function(x) prop.test(x, total_obs)$conf.int)

# Printing the results for confidence intervals
for (i in seq_along(room_type_counts)) {
  cat("Room Type:", names(room_type_counts)[i], "\n")
  cat("Sample Proportion:", formatC(sample_proportions[i], digits = 4), "\n")
  cat("Confidence Interval: [", formatC(conf_intervals[[i]][1], digits = 4), ", ", formatC(conf_intervals[[i]][2], digits = 4), "]\n\n")
}

# Expected proportion (null hypothesis)
expected_proportion <- 0.5

# Perform hypothesis test for each room type
test_results <- lapply(room_type_counts, function(x) prop.test(x, total_obs, p = expected_proportion))

# Printing the results for hypothesis tests
for (i in seq_along(room_type_counts)) {
  cat("Room Type:", names(room_type_counts)[i], "\n")
  cat("Test Statistic:", formatC(test_results[[i]]$statistic, digits = 4), "\n")
  cat("P-value:", formatC(test_results[[i]]$p.value, digits = 4), "\n\n")
}

library(tidyverse)
library(dplyr)
library(ggplot2)

getwd()
install.packages("tidyverse")
install.packages("dplyr")
# Load necessary libraries

df <- read.csv("homework.csv")
View(df)

# Calculate the mean, median, and mode of the numerical variables
mean_price <- mean(df$price)
median_price <- median(df$price)
mode_price <- mode(df$price)



mean_minimum_nights <- mean(df$minimum_nights)
median_minimum_nights <- median(df$minimum_nights)
mode_minimum_nights <- mode(df$minimum_nights)

# Calculate the range, variance, and standard deviation of the numerical variables
range_price <- max(df$price) - min(df$price)
variance_price <- var(df$calculated_host_listings_count)
standard_deviation_price <- sd(df$price)

range_minimum_nights <- max(df$minimum_nights) - min(df$minimum_nights)
variance_minimum_nights <- var(df$minimum_nights)
standard_deviation_minimum_nights <- sd(df$minimum_nights)


#calculate mode of categorical data
mode_type <- mode(df$room_type)

#printing the output
mode_price
median_price
mean_price
mode_minimum_nights
median_minimum_nights
mean_minimum_nights
standard_deviation_price
variance_price
range_price
standard_deviation_minimum_nights
variance_minimum_nights
range_minimum_nights
mode_type



# Select categorical variables for analysis
categorical_variables <- c("room_type", "name")

# Calculate the frequency of each category for categorical variables
category_frequencies <- lapply(df[categorical_variables], table)

# Calculate the mode (most common category) for categorical variables
modes <- lapply(category_frequencies, function(x) as.character(names(x)[which.max(x)]))

# Display the results
cat("Frequency of Categories for Categorical Variables:\n")
print(category_frequencies)

cat("\nMode (Most Common Category) for Categorical Variables:\n")
print(modes)



# Create a histogram of the numerical variables
ggplot(df, aes(x = price)) + geom_histogram()
ggplot(df, aes(x = minimum_nights)) + geom_histogram()

# Create a boxplot of the numerical variables
ggplot(df, aes(x = price)) + geom_boxplot()
ggplot(df, aes(x = minimum_nights)) + geom_boxplot()
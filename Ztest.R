# Load the necessary library
library(dplyr)

# Loading the dataset
dataset <- read.csv("homework.csv")

# Extracting the 'latitude' column
latitude_data <- dataset$latitude

# Calculating the mean and standard deviation of 'latitude'
mean_latitude <- mean(latitude_data)
sd_latitude <- sd(latitude_data)

# Set the confidence level (e.g., 95% confidence interval)
confidence_level <- 0.95

# Calculating the standard error
standard_error <- sd_latitude / sqrt(length(latitude_data))

# Calculating the margin of error
margin_of_error <- qnorm((1 + confidence_level) / 2) * standard_error

# Calculate the confidence interval
confidence_interval <- c(mean_latitude - margin_of_error, mean_latitude + margin_of_error)

# Printing the Z Confidence Interval
cat("Z Confidence Interval for Latitude (95% Confidence Level): [", confidence_interval[1], ", ", confidence_interval[2], "]\n")

# Assuming a hypothetical population mean (mu_0)
mu_0 <- 30

# Perform a Z test
z_stat <- (mean_latitude - mu_0) / (sd_latitude / sqrt(length(latitude_data)))

# Set the significance level (e.g., 0.05)
alpha <- 0.05

# Calculating the critical Z value
critical_z <- qnorm(1 - alpha/2)

# Compare the Z statistic with the critical value
if (abs(z_stat) > critical_z) {
  cat("Reject the null hypothesis. There is a significant difference.\n")
} else {
  cat("Fail to reject the null hypothesis. There is not enough evidence to claim a significant difference.\n")
}

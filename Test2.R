# Loading my dataset 
data <- read.csv("homework.csv")

# Extracting the "latitude" column
latitude <- data$latitude

# Calculating the mean and standard deviation of latitude
mean_latitude <- mean(latitude)
std_dev_latitude <- sd(latitude)

# Specifying the hypothesized population mean for the t-test
population_mean_hypothesis <- 0  

# Performing a one-sample t-test
t_test_result <- t.test(latitude, mu = population_mean_hypothesis)

# Set your desired confidence level( using 95% as in class we have read it is most commonly used)
confidence_level <- 0.95

# Calculating the confidence interval
alpha <- 1 - confidence_level
n <- length(latitude)
t_critical <- qt(1 - alpha / 2, df = n - 1)
standard_error_latitude <- std_dev_latitude / sqrt(n)
margin_of_error_latitude <- t_critical * standard_error_latitude
lower_bound_latitude <- mean_latitude - margin_of_error_latitude
upper_bound_latitude <- mean_latitude + margin_of_error_latitude

# Printing the results
cat("One-Sample T-Test for Latitude:\n")
cat("Sample Mean: ", round(mean_latitude, 2), "\n")
cat("Hypothesized Population Mean: ", population_mean_hypothesis, "\n")
cat("t-Statistic: ", round(t_test_result$statistic, 2), "\n")
cat("P-Value: ", format.pval(t_test_result$p.value, digits = 3), "\n")

# Determine the conclusion
alpha <- 0.05  # Setting  significance level
if (t_test_result$p.value < alpha) {
  cat("Conclusion: Reject the null hypothesis\n")
} else {
  cat("Conclusion: Fail to reject the null hypothesis\n")
}

cat("\nConfidence Interval (", confidence_level * 100, "%) for Latitude: (", round(lower_bound_latitude, 2), ", ", round(upper_bound_latitude, 2), ")\n")

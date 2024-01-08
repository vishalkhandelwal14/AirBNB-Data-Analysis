# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the necessary library
library(ggplot2)

# Load the CSV file
data <- read.csv("homework.csv")

#checking which column is numeric
column_data_types <- sapply(data, class)
print(column_data_types)



# Construct the discrete probability distribution for latitude
latitude_unique <- unique(data$latitude)
latitude_prob <- rep(1, length(latitude_unique))

# Create a data frame to store the discrete probability distribution
latitude_distribution <- data.frame(
  latitude = latitude_unique,
  probability = latitude_prob
)

# Print the discrete probability distribution for latitude
print(latitude_distribution)

# Construct the discrete probability distribution for longitude
longitude_unique <- unique(data$longitude)
longitude_prob <- rep(1, length(longitude_unique))

# Create a data frame to store the discrete probability distribution
longitude_distribution <- data.frame(
  longitude = longitude_unique,
  probability = longitude_prob
)

# Print the discrete probability distribution for longitude
print(longitude_distribution)




#or We can do it with second method as well by ploting graphs

# Load necessary libraries
library(dplyr)
library(ggplot2)

# Read the CSV file into a data frame
data <- read.csv("homework.csv")

# Create a discrete probability distribution for latitude
latitude_dist <- data %>%
  group_by(latitude) %>%
  summarise(count = n()) %>%
  mutate(probability = count / sum(count))

# Create a discrete probability distribution for longitude
longitude_dist <- data %>%
  group_by(longitude) %>%
  summarise(count = n()) %>%
  mutate(probability = count / sum(count))

# Create a histogram for latitude
ggplot(latitude_dist, aes(x = latitude, y = probability)) +
  geom_bar(stat = "identity") +
  labs(x = "Latitude", y = "Probability") +
  ggtitle("Discrete Probability Distribution for Latitude")

# Create a histogram for longitude
ggplot(longitude_dist, aes(x = longitude, y = probability)) +
  geom_bar(stat = "identity") +
  labs(x = "Longitude", y = "Probability") +
  ggtitle("Discrete Probability Distribution for Longitude")


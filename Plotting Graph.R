library(tidyverse)
library(dplyr)

getwd()
install.packages("tidyverse")
install.packages("dplyr")
# Load necessary libraries

df <- read.csv("homework.csv")
column_types <- sapply(df, class)
print(column_types)

library(ggplot2)
install.packages("ggplot2")

#Graphs for Numerical variables
# Scatter Plot: reviews_per_month vs. longitude
ggplot(df, aes(x = reviews_per_month, y = longitude)) +
  geom_point() +
  labs(title = "Scatter Plot: reviews_per_month vs. longitude")

# Box Plot: reviews_per_month
ggplot(df, aes(y = reviews_per_month)) +
  geom_boxplot() +
  labs(title = "Box Plot: reviews_per_month")

# Histogram: latitude
ggplot(df, aes(x = latitude)) +
  geom_histogram(binwidth = 0.1, fill = "blue", color = "black") +
  labs(title = "Histogram: latitude")


##Graphs for Categorical variables like "name," "host_name," and "neighbourhood"

# Bar Plot: Analysis of 'neighbourhood' variable
neighbourhood_counts <- df %>% 
  group_by(neighbourhood) %>% 
  summarise(count = n()) %>% 
  arrange(desc(count))

ggplot(neighbourhood_counts, aes(x = reorder(neighbourhood, -count), y = count)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Bar Plot: Neighbourhood Counts") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Bar Plot: Analysis of 'name' variable
name_counts <- df %>% 
  group_by(name) %>% 
  summarise(count = n()) %>% 
  arrange(desc(count)) %>%
  top_n(10, wt = count)

ggplot(name_counts, aes(x = reorder(name, -count), y = count)) +
  geom_bar(stat = "identity", fill = "green") +
  labs(title = "Bar Plot: Top 10 Names") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Segmented Bar Plot: Analysis of 'host_name' variable
host_name_counts <- df %>% 
  group_by(host_name, neighbourhood) %>% 
  summarise(count = n()) %>% 
  top_n(10, wt = count)

ggplot(host_name_counts, aes(x = reorder(host_name, -count), y = count, fill = neighbourhood)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(title = "Segmented Bar Plot: Top 10 Host Names by Neighbourhood") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Pie Chart: Analysis of 'neighbourhood' variable
neighbourhood_pie_data <- df %>%
  group_by(neighbourhood) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  top_n(10, wt = count)

neighbourhood_pie_data$neighbourhood <- factor(neighbourhood_pie_data$neighbourhood,
                                               levels = neighbourhood_pie_data$neighbourhood)

ggplot(neighbourhood_pie_data, aes(x = "", y = count, fill = neighbourhood)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  labs(title = "Pie Chart: Top 10 Neighbourhoods")
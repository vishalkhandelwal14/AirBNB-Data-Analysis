getwd()
library(tidyr)
library(utils)
library(dplyr)
library(tidyverse)
install.packages("tidyverse")

install.packages("tidyr")
install.packages("dplyr")
vishal <- read.csv("homework.csv", TRUE, ",")
class(vishal)
str(vishal)
glimpse(vishal)
#cleanup data
vishal$id <- as.factor(vishal$id)
unique(vishal$id)
str(vishal)
dim(vishal)

#binary classifier
x <- mean(vishal$host_id)
#create new variable, "pure" where if host_id > mean, pure = "bad", if not  pure = "good"
vishal$pure <- as.factor(ifelse(vishal$host_id>x, "bad", "good"))
library(dplyr)
View(vishal)

#select variables
vishal %>% select(name, neighbourhood_group, ends_with("id") )
#removing column with no data in it
vishal <- vishal[, colSums(is.na(vishal)) != nrow(vishal)]
#removing row with no data in it
vishal <- na.omit(vishal)
str(vishal)
#removing column langitude and latitude as they are not useful
vishal <- vishal[, !names(vishal) %in% c("longitude", "latitude")]
#Checking dataset contain any empty value or not
has_missing_values <- any(is.na(vishal))

if (has_missing_values) {
  print("The dataset contains empty cells (missing values).")
} else {
  print("The dataset does not contain empty cells (missing values).")
}
#saving my dataset
write.csv(vishal, file = "vishal_data.csv", row.names = FALSE)








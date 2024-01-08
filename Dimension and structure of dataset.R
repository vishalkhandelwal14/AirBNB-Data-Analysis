getwd()
my_data <- read.csv("homework.csv")
head(my_data)
#structure
str(my_data)
#Print out the first 10 rows and the last 10 rows of your dataset. 
head(my_data, n = 10)
tail(my_data, n = 10)
#the dimensions of the dataset and the types, structures, and attributes of the variables in your dataset
dim(my_data)
summary(my_data)
variables <- names(my_data)
data_types <- sapply(my_data, class)
variables <- colnames(my_data)
variable_summary <- summary(my_data)
variable_type <- class(my_data$host_name)
variable_attributes <- attributes(my_data$host_name)
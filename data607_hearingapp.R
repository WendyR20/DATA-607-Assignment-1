library(tidyverse)
library(stringr)
library(openintro)

#reading in data
data <- read_csv("Hearing_well-being_Survey_Report.csv")

#exploring data
glimpse(data)

unique_answers <- unique(data$Interest_in_Hearing_App)
print(unique_answers)

unique_answers2 <- unique(data$Paid_App_Test_Interest)
print(unique_answers2)

#creating a data frame with columns only having to do with app questions

appdata <- data[, c("Interest_in_Hearing_App", 
                      "Desired_App_Features", 
                      "Paid_App_Test_Interest")]
glimpse(appdata)

# Count occurrences of 'Yes' answers within 'Interest in Hearing app' column
# This will return a vector where each element is the count for the corresponding row
counts_per_row <- str_count(appdata$Interest_in_Hearing_App, "Yes")
# To get the total count across the entire column:
total_count <- sum(counts_per_row)

print(total_count)

# Count occurrences of 'Yes' answers within 'Paid App Test Interest' column
counts_per_row2 <- str_count(appdata$Paid_App_Test_Interest, "Yes")
total_count2 <- sum(counts_per_row2)
print(total_count2)

#Ratio of interest in app to interest in paid app
total_count2/total_count

#Ratio of interest in paid app to overall responses

num_rows <- nrow(appdata)

print(total_count2/num_rows)



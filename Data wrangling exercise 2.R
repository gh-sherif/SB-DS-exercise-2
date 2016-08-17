# Load list
titanic_df = read.csv("/Users/Sherif/Documents/Springboard - Data science/Exercise 2/titanic_original.csv", header = TRUE)
str(titanic_df)  # data frame

getwd()

library(dplyr)
glimpse(titanic_df)
View(titanic_df)

# Replace missing values in embarked column with S
titanic_df$embarked[titanic_df$embarked==""]<-"S"
# Check if there is still missing values
titanic_df[is.null(titanic_df$embarked) == TRUE]
titanic_df[titanic_df$embarked == ""]
titanic_df %>% select(embarked) %>% filter(is.null(titanic_df[embarked]) == TRUE)

# Replace missing values in age column with the mean
titanic_df$age
mean(titanic_df$age, na.rm = TRUE) # 29.88113
titanic_df$age[is.na(titanic_df$age)==TRUE] <- mean(titanic_df$age, na.rm = TRUE)
titanic_df[titanic_df$age == 29.88113] # why doesn't this return values ?
titanic_df[round(titanic_df$age) == 30.0] # why does this give error ?

# Replace missing values in boat column with NA

titanic_df$boat[titanic_df$boat==""] <- NA # how to make the changes to new df not the original ?

# Add a new column to state if the cabin value is blank or not

titanic_df <- mutate(titanic_df, has_cabin_number = ifelse(titanic_df$cabin == "", 0, 1))

# Write CSV
write.csv(titanic_df, file = "/Users/Sherif/Documents/Springboard - Data science/Exercise 2/titanic_clean.csv")

# All files in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# are stored in "UCI HAR Dataset" and its subfolders "test" and "train".

# the working directory is set to "UCI HAR Dataset"
setwd("~/Desktop/Coursera/Getting and Cleaning Data/UCI HAR Dataset") 

# load dplyr
library(dplyr)

# read test data files
test.x <- read.table("test/X_test.txt")
test.y <- read.table("test/y_test.txt")
test.s <- read.table("test/subject_test.txt")

# bind activities, subjects, and test data
test.xys <- cbind(test.s, test.y, test.x)

# read train data files
train.x <- read.table("train/X_train.txt")
train.y <- read.table("train/y_train.txt")
train.s <- read.table("train/subject_train.txt")

# bind activities, subjects, and train data
train.xys <- cbind(train.s, train.y, train.x)

# merge test and train data [TASK 1]
test.train.xys <- rbind(test.xys, train.xys)

# rename colnames for y and subject
colnames(test.train.xys)[1] <- "subject"
colnames(test.train.xys)[2] <- "activity"

# examine features.txt to specify variables for mean() and std()
features <- read.table("features.txt")
features.df <- tbl_df(features)
features.flagged <- mutate(features.df, selectMean = grepl("mean()", V2))
features.flagged <- mutate(features.flagged, selectStd = grepl("std()", V2))
features.MeanStd <- subset(features.flagged, selectMean == TRUE | selectStd == TRUE)
features.MeanStd <- mutate(features.MeanStd, fname = paste("V", V1, sep = ""))

# extract required columns from text.train.xys [TASK2]
fname <- c("subject", "activity", features.MeanStd$fname)
test.train.xys.MeanStd <- test.train.xys[, fname]

# use descriptive names for activities [TASK3]
## prepare a table for activities
activities <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
activities.df <- tbl_df(activities)
colnames(activities.df)[1] <- "activityID"
colnames(activities.df)[2] <- "activityDesc" 

## attach descriptive names of activities to test.train.xys.MeanStd 
test.train.xys.MeanStdAct <- merge(test.train.xys.MeanStd, activities.df, by.x = "activity", by.y = "activityID")

## reorder columns to show "subjects", "activityID" and all means() and std()
test.train.xys.MeanStdActReOrd <- test.train.xys.MeanStdAct[, c(2, 82, 3:81)]

# appropriately lable the data set with descriptive variable names [TASK4]
## convert variable names as factor to character
features.MeanStd[] <- lapply(features.MeanStd, as.character)

## loop through the columns to rename them to be descriptive and rename the resulting data set
for(i in 3:81) {colnames(test.train.xys.MeanStdActReOrd)[i] <- features.MeanStd[i-2, 2]}
detail_df <- test.train.xys.MeanStdActReOrd

# create a second tidy data set with the average of each variable for each activity and each subject [TASK5]
group_df <- group_by(detail_df, subject, activityDesc)
summ_df <- summarise_all(group_df, mean)

# view detail_df and sum_df as the final data set products
View(detail_df)
View(summ_df)

# write the resulting data sets to the working directory
write.table(summ_df, "detail_df.txt", row.names = FALSE)
write.table(summ_df, "summ_df.txt", row.names = FALSE)



# end

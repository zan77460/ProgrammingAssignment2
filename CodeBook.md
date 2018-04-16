---
title: "CodeBook"
author: "Go Ezaki"
date: "4/16/2018"
output: html_document
---

# **Purpose**
## This describes (1) the data sets produced, including (2) their variables and (3) the work performed to clean up the data.

# **Data Sets Produced**
## There are two data sets produced:
- "detail_df.txt": A data set that combines the test and training data for all subjects and all activities for variables that repreent measurements on the mean and standard deviation on each measurement.
- "summ_df.txt": A data set with the average of each variable for each activity and each subject.

# **Variables**
## "detail_df.txt" and "summ_df.txt" share the identical 81 variables as below: For further explanations on the variables, "features_info.txt" should be referred.

- subject
- activityDesc
- tBodyAcc-mean()-X
- tBodyAcc-mean()-Y
- tBodyAcc-mean()-Z
- tBodyAcc-std()-X
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z
- tGravityAcc-mean()-X
- tGravityAcc-mean()-Y
- tGravityAcc-mean()-Z
- tGravityAcc-std()-X
- tGravityAcc-std()-Y
- tGravityAcc-std()-Z
- tBodyAccJerk-mean()-X
- tBodyAccJerk-mean()-Y
- tBodyAccJerk-mean()-Z
- tBodyAccJerk-std()-X
- tBodyAccJerk-std()-Y
- tBodyAccJerk-std()-Z
- tBodyGyro-mean()-X
- tBodyGyro-mean()-Y
- tBodyGyro-mean()-Z
- tBodyGyro-std()-X
- tBodyGyro-std()-Y
- tBodyGyro-std()-Z
- tBodyGyroJerk-mean()-X
- tBodyGyroJerk-mean()-Y
- tBodyGyroJerk-mean()-Z
- tBodyGyroJerk-std()-X
- tBodyGyroJerk-std()-Y
- tBodyGyroJerk-std()-Z
- tBodyAccMag-mean()
- tBodyAccMag-std()
- tGravityAccMag-mean()
- tGravityAccMag-std()
- tBodyAccJerkMag-mean()
- tBodyAccJerkMag-std()
- tBodyGyroMag-mean()
- tBodyGyroMag-std()
- tBodyGyroJerkMag-mean()
- tBodyGyroJerkMag-std()
- fBodyAcc-mean()-X
- fBodyAcc-mean()-Y
- fBodyAcc-mean()-Z
- fBodyAcc-std()-X
- fBodyAcc-std()-Y
- fBodyAcc-std()-Z
- fBodyAcc-meanFreq()-X
- fBodyAcc-meanFreq()-Y
- fBodyAcc-meanFreq()-Z
- fBodyAccJerk-mean()-X
- fBodyAccJerk-mean()-Y
- fBodyAccJerk-mean()-Z
- fBodyAccJerk-std()-X
- fBodyAccJerk-std()-Y
- fBodyAccJerk-std()-Z
- fBodyAccJerk-meanFreq()-X
- fBodyAccJerk-meanFreq()-Y
- fBodyAccJerk-meanFreq()-Z
- fBodyGyro-mean()-X
- fBodyGyro-mean()-Y
- fBodyGyro-mean()-Z
- fBodyGyro-std()-X
- fBodyGyro-std()-Y
- fBodyGyro-std()-Z
- fBodyGyro-meanFreq()-X
- fBodyGyro-meanFreq()-Y
- fBodyGyro-meanFreq()-Z
- fBodyAccMag-mean()
- fBodyAccMag-std()
- fBodyAccMag-meanFreq()
- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-std()
- fBodyBodyAccJerkMag-meanFreq()
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroMag-std()
- fBodyBodyGyroMag-meanFreq()
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-std()
- fBodyBodyGyroJerkMag-meanFreq()


# **Work performed to produce the data sets**
## How "detail_df.txt" is produced

The test data (i.e. 'X_test.txt', 'y_test.txt', 'subject_test.txt') are combined by using 'cbind'. Similary, the training data is processed accordingly. The combined test data and train data are merged by using 'rbind'. (Line 10 - 31)

Secondly, 'features.txt' is examined to identify variables that represent mean and standard deviation of the measurements. Where names of features include 'mean()' and 'std()' are assumed to represent the mean and standard deviation of the measurements. (Line 33 - 39)

From the merged test and train data obtained above, the only features, of which names include 'mean()' and 'std()' are extracted. (Line 41 - 43) Subsequently, column names of the merged data are replaced by the names of features in 'features.txt' for them to be more descriptive. (Line 45 - 64). The resulting data set is 'detail_df' and it is saved as a text file (Line 75)

## How "summ_df.txt" is produced
Lastly, to summarize the data set, 'detail_df' created above by the subject and their activites, 'group_by' and 'summerise_all' are used to calculate mean for each measurements. (Line 74 - 76). This produces the data set 'summ_df'. It is saved as a text file (Line 76)

'detail_df' and 'summ_df' are displayed by 'View()' as well on the console. (Line 70 - 72)

End

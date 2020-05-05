rm(list=ls()) ### Clear the environment
library(dplyr) ### Load the dplyr package

### Preparation
### Download and store data

filename <- "Coursera_DS3_Final.zip" ### Create a file (blank) with the desired name

if (!file.exists(filename)){ ### Check if the file exists
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" ### Assign the desired url
        download.file(fileURL, filename, method="curl") ### If "filename" exists, download the data from the url into "filename"
}  

if (!file.exists("UCI HAR Dataset")) { ### Check if the folder exists
        unzip(filename) ### If the folder exists, unzip the files within
}



### Part 1: Merge the training and the test sets to create one data set.

### Assign the data in the text files of the Dataset folder to data frames and give the columns appropriate names

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

### Merge the data into one dataset

X <- rbind(x_train, x_test) ### Merges the x datasets
Y <- rbind(y_train, y_test) ### Merges the y datasets
Subject <- rbind(subject_train, subject_test) ### Merges the subject datasets
Merged_Data <- cbind(Subject, Y, X) ### Merges all three datasets into a final dataset

str(Merged_Data) ### Inspect result



### Part 2: Extract only the measurements on the mean and standard deviation for each measurement.

TidyData <- Merged_Data %>% ### Use the newly created master dataset 
        select(subject, code, contains("mean"), contains("std")) %>% ### select subject, code and the mean and sd for each measurement
        print ### Check results

str(TidyData) ### Inspect result
View(TidyData) ### Inspect result



### Part 3: Use descriptive activity names to name the activities in the data set and replaces the column header with a descriptive name

TidyData <- Merged_Data %>% ### Use the newly created master dataset 
        select(subject, code, contains("mean"), contains("std")) %>% ### select subject, code and the measurements on the mean and sd for each measurement
        print ### Check results

str(TidyData)
View(TidyData)



### Part 3: Use descriptive activity names to name the activities in the data set

TidyData$code <- activities[TidyData$code, 2] 

names(TidyData)[2] = "activity" ### Renames the second column to "activities"



### Part 4: Appropriately labels the data set with descriptive variable names.
### Rename the abbreviations to more descriptive variable names

names(TidyData)<-gsub("Acc", "accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "body", names(TidyData))
names(TidyData)<-gsub("Mag", "magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "time", names(TidyData))
names(TidyData)<-gsub("^f", "frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "timebody", names(TidyData))
names(TidyData)<-gsub("-mean()", "mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "standarddeviation", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "angle", names(TidyData))
names(TidyData)<-gsub("gravity", "gravity", names(TidyData))

### Rename the abbreviations to more descriptive variable names

names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

str(TidyData) ### Inspect the data



### Part 5: From the data set in step 4, creates a second, 
### independent tidy data set with the average of each variable for each activity and each subject.

FinalDataSet <- TidyData %>% ### Create a new tidy data set
        group_by(subject, activity) %>% ### Group by the desired subject and activity
        summarize_all(funs(mean)) ### Summarize the mean of each varialbe for each activity and subject

View(FinalDataSet) ### Inspect the data

write.table(FinalDataSet, "FinalDataSet.txt", row.name=FALSE) ### Create a new file for this data frame

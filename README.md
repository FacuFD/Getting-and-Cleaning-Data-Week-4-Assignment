# This is the repository for the final assignment of the Getting and Cleaning Data course.

To get started, load the dplyr package in R studio, download and unzip the files from the link below.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Afterwards, running the code in run_analysis.R should produce the desired data set, a tidy data set of the experiments conducted by Samsung.

# Files

CodeBook.md: a code book that describes the variables, the data, and any transformations or work that were performed to clean up the data.

run_analysis.R: the desired code to transform the raw data from the zip file to a tidy data set. This code was written based on the course instructions and should accomplish the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

FinalDataSet.txt: This is the final product of the project.

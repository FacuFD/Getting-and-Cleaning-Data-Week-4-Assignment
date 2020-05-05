
Description of the data:
        
The data used in this assignment was from an experiment run by Samsung using their smartphones. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person collected data by performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone (Samsung Galaxy S II) on the waist. 

        
The data sets were downloaded from the following url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

       
Part 1 

Each of the data sets were assigned to corresponding variables and merged together using read.table(), rbind() and cbind(), respectively. 


Part 2

Using this unified data set, a new data set is created (called TidyData) by subsetting the merged data and only selecting: the subject, code, mean measurements, and standard deviation (hereafter "sd") measurements


Part 3


The codes (in column 2) denoting the activities are replaced with the corresponding activity and the column header is renamed.

Part 4

The column headers are replaced with more descriptive variable names.
For example: "Acc" is replaced by "Accelerometer", "Gyro" by "Gyroscope", and "^f" by "Frequency".

Part 5

The final summarized data set (FinalDataSet: 180 rows and 88 columns) is created by grouping by subject and activity and then taking the mean of each activity and subject.
This file is then converted to a text file and exported.

Initial Variables:

"subject"
"code"
"tBodyAcc.mean...X"
"tBodyAcc.mean...Y"
"tBodyAcc.mean...Z"
"tGravityAcc.mean...X"
"tGravityAcc.mean...Y"
"tGravityAcc.mean...Z"
"tBodyAccJerk.mean...X"               
"tBodyAccJerk.mean...Y"
"tBodyAccJerk.mean...Z"
"tBodyGyro.mean...X"                  
"tBodyGyro.mean...Y"
"tBodyGyro.mean...Z"
"tBodyGyroJerk.mean...X"              
"tBodyGyroJerk.mean...Y"
"tBodyGyroJerk.mean...Z"
"tBodyAccMag.mean.."                  
"tGravityAccMag.mean.."
"tBodyAccJerkMag.mean.."
"tBodyGyroMag.mean.."                 
"tBodyGyroJerkMag.mean.."
"fBodyAcc.mean...X"
"fBodyAcc.mean...Y"                   
"fBodyAcc.mean...Z"
"fBodyAcc.meanFreq...X"
"fBodyAcc.meanFreq...Y"               
"fBodyAcc.meanFreq...Z"
"fBodyAccJerk.mean...X"
"fBodyAccJerk.mean...Y"               
"fBodyAccJerk.mean...Z"
"fBodyAccJerk.meanFreq...X"
"fBodyAccJerk.meanFreq...Y"           
"fBodyAccJerk.meanFreq...Z"
"fBodyGyro.mean...X"
"fBodyGyro.mean...Y"                  
"fBodyGyro.mean...Z"
"fBodyGyro.meanFreq...X"
"fBodyGyro.meanFreq...Y"              
"fBodyGyro.meanFreq...Z"
"fBodyAccMag.mean.."
"fBodyAccMag.meanFreq.."              
"fBodyBodyAccJerkMag.mean.."
"fBodyBodyAccJerkMag.meanFreq.."
"fBodyBodyGyroMag.mean.."             
"fBodyBodyGyroMag.meanFreq.."
"fBodyBodyGyroJerkMag.mean.."
"fBodyBodyGyroJerkMag.meanFreq.."     
"angle.tBodyAccMean.gravity."
"angle.tBodyAccJerkMean..gravityMean."
"angle.tBodyGyroMean.gravityMean."    
"angle.tBodyGyroJerkMean.gravityMean."
"angle.X.gravityMean."
"angle.Y.gravityMean."                
"angle.Z.gravityMean."
"tBodyAcc.std...X"
"tBodyAcc.std...Y"                    
"tBodyAcc.std...Z"
"tGravityAcc.std...X"
"tGravityAcc.std...Y"                 
"tGravityAcc.std...Z"
"tBodyAccJerk.std...X"   
"tBodyAccJerk.std...Y"                
"tBodyAccJerk.std...Z"
"tBodyGyro.std...X"
"tBodyGyro.std...Y"                   
"tBodyGyro.std...Z"
"tBodyGyroJerk.std...X"
"tBodyGyroJerk.std...Y"               
"tBodyGyroJerk.std...Z"
"tBodyAccMag.std.."
"tGravityAccMag.std.."                
"tBodyAccJerkMag.std.."
"tBodyGyroMag.std.."
"tBodyGyroJerkMag.std.."              
"fBodyAcc.std...X"
"fBodyAcc.std...Y"
"fBodyAcc.std...Z"                    
"fBodyAccJerk.std...X"
"fBodyAccJerk.std...Y"
"fBodyAccJerk.std...Z"                
"fBodyGyro.std...X"
"fBodyGyro.std...Y"
"fBodyGyro.std...Z"                   
"fBodyAccMag.std.."
"fBodyBodyAccJerkMag.std.."
"fBodyBodyGyroMag.std.."              
"fBodyBodyGyroJerkMag.std.."

Finalized variable names can be seen on the FinalDataSet text file.

Tidy Data Set Description:

The data set contains 180 rows and 88 columns. The data set contains only the mean and standard deviation values for each activity and subject. The 30 subjects were maintained and numbered sequentially. The six activities were also maintained and called: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.



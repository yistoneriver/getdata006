# CodeBook
This code book shows how run_analysis.R script transforms the orginal data (Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors.) into tidy data set and describes each variable of the tidy data set. 

The original data set is available from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

## run_analysis.R scrpt
run_analysis.R scripts perform the five step analysis.

### Input
The following files in the original data used as inputs:

* activity_label.txt 
* features.txt
* train/subject.txt
* train/X_train.txt
* train/y_train.txt
* test/subject.txt
* test/X_test.txt
* test/y_test.txt

### Output
Tidy data set file "tidydata.xt" with the average of each measurement variable (only on mean and standard deviation) for each activity and each subject. This file is a comma-separated file without a quotation mark.

### How this script works
##### Step0. preparation
* Download the original data set file and unzip the downloaded file. 
* Change the working directory to the base directory of the extracted folders.

##### Step1 Merges the training and the test sets to create one data set
* Read train/X_train.txt and test/X_test.txt into data frame
* merge the data frame using rbind(x,y) function.

##### Step2 Extracts only the measurements on the mean and standard deviation for each measurement
* Read features.txt into a data frame(V1:  row number, V2: meaturement)
* Find row number of the data frame such that measurement(V2) include the string mean() or std(). Each row number is corresponding to the column number of the data frame in Step1.
* Extract the collums from the data from obtained in Step1.

##### Step3 Uses descriptive activity names to name the activities in the data set
* Read activity_labels.txt into a data frame (V1: row number, V2: activity name) to  use each label as an activity name
* Read "train/y_train.txt" and "test/y_tain.txt and merge them into a single data frame. Each row shows 
an activity ID (1 to 6) for the corresponding row of the data frame obtained in Step1.
* Replace activity IDs of the first data frame with activity labels, using mapvalues function in the plyr package.

##### Step4 Appropriately labels the data set with descriptive variable names
* Replaces illegal characters of each feature with "." and then eliminates consective appearance of "." and trailing ".".
* Eliminates second "Body" from some variables (believes this is a typo)
* Use the modified feature strings as the descriptive names of the data frame obtained in Step1

##### Step5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject
* Read train/subject_train.txt and test/subject_test.txt (subject data) into a data frame.
* Create a data fram for activity names from the vector obtained in Step3
* Bind these two data frame to the data frame in Step4 to add subject and activity columns.
* Using melting and casting (reshape2 package), calculate the mean of each measurement variables for each subject and activity.
* Store the resulting data set (tidy data set) into a file.

## Variables in the tidy data set
There are two type of variables: 1) ID variables and 2) measurement variables (measured in gravity)
averaged over each subject and activity pair.

### subject
The number identifies the subject

* ID variable
* Integer
* ranging from 1 to 30

##activity
Activities

* ID variable

One of the follwing string:
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

## tBodyAcc.mean.X
Estimated mean value of the body acceleration signals (time domain) in the X direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyAcc.mean.Y
Estimated mean value of the body acceleration signals (time domain) in the Y direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyAcc.mean.Z
Estimated mean value of the body acceleration signals (time domain) in the Z direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyAcc.std.X
Estimated standard deviation of the body acceleration signals (time domain) in the X direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyAcc.std.Y
Estimated standard deviation of the body acceleration signals (time domain) in the Y direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyAcc.std.Z
Estimated standard deviation of the body acceleration signals (time domain) in the Z direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tGravityAcc.mean.X
Estimated mean of the gravity acceleration signals (time domain) in the X direction.

* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tGravityAcc.mean.Y
Estimated mean of the gravity acceleration signals (time domain) in the Y direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tGravityAcc.mean.Z
Estimated mean of the gravity acceleration signals (time domain) in the Z direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tGravityAcc.std.X
Estimated standard deviation of the gravity acceleration signals (time domain) in the X direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tGravityAcc.std.Y
Estimated standard deviation of the gravity acceleration signals (time domain) in the Y direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tGravityAcc.std.Z
Estimated standard deviation of the gravity acceleration signals (time domain) in the Z direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyAccJerk.mean.X
Estimated mean value of the body acceleration jerk signals (time domain) in the X direction.

* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyAccJerk.mean.Y
Estimated mean value of the body acceleration jerk signals (time domain) in the Y direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyAccJerk.mean.Z
Estimated mean value of the body acceleration jerk signals (time domain) in the Z direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyAccJerk.std.X
Estimated standard deviation of the body acceleration jerk signals (time domain) in the X direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyAccJerk.std.Y
Estimated standard deviation of the body acceleration jerk signals (time domain) in the Y direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyAccJerk.std.Z
Estimated standard deviation of the body acceleration jerk signals (time domain) in the Z direction.

* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyGyro.mean.X
Estimated mean value of the gyroscope 3-axial raw signals (time domain) in the X direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyGyro.mean.Y
Estimated mean value of the gyroscope 3-axial raw signals (time domain) in the Y direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyGyro.mean.Z
Estimated mean value of the gyroscope 3-axial raw signals (time domain) in the Z direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyGyro.std.X
Estimated standard deviation of the gyroscope 3-axial raw signals (time domain) in the X direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyGyro.std.Y
Estimated standard deviation of the gyroscope 3-axial raw signals (time domain) in the Y direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyGyro.std.Z
Estimated standard deviation of the gyroscope 3-axial raw signals (time domain) in the Z direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyGyroJerk.mean.X
Estimated mean value of the gyroscope 3-axial raw jerk signals (time domain) in the X direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyGyroJerk.mean.Y
Estimated mean value of the gyroscope 3-axial raw jerk signals (time domain) in the Y direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyGyroJerk.mean.Z
Estimated mean value of the gyroscope 3-axial raw jerk signals (time domain) in the Z direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyGyroJerk.std.X
Estimated standard deviation of the gyroscope 3-axial raw jerk signals (time domain) in the X direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyGyroJerk.std.Y
Estimated stadnard deviation of the gyroscope 3-axial raw jerk signals (time domain) in the Y direction.

* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyGyroJerk.std.Z
Estimated standard deviation of the gyroscope 3-axial raw jerk signals (time domain) in the Z direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyAccMag.mean
Estimated mean value of the magnitude of the body acceleration signals (time domain).	

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyAccMag.std
Estimated standard deviation of the magnitude of the body acceleration signals (time domain).

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tGravityAccMag.mean
Estimated mean value of the magnitude of the gravity acceleration signals (time domain).

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tGravityAccMag.std
Estimated standard deviation  of the magnitude of the gravity acceleration signals (time domain).

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyAccJerkMag.mean
Estimated mean value of the magnitude of the body acceleration jerk signals (time domain).	
* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyAccJerkMag.std
Estimated standard deviation of the magnitude of the body acceleration jerk signals (time domain).

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyGyroMag.mean
Estimated mean value of the magnitude of the gyroscope 3-axial raw signals (time domain).

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyGyroMag.std
Estimated standard deviation of the magnitude of the gyroscope 3-axial raw signals (time domain).

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyGyroJerkMag.mean
Estimated mean value of the magnitude of the gyroscope 3-axial raw jerk signals (time domain).

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## tBodyGyroJerkMag.std
Estimated standard deviation of the magnitude of the gyroscope 3-axial raw jerk signals (time domain).

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyAcc.mean.X
Estimated mean value of the body acceleration signals (frequency domain) in the X direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyAcc.mean.Y
Estimated mean value of the body acceleration signals (frequency domain) in the Y direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyAcc.mean.Z
Estimated mean value of the body acceleration signals (frequency domain) in the Z direction.
        
* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyAcc.std.X
Estimated standard deviation of the body acceleration signals (frequency domain) in the X direction.
        
* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyAcc.std.Y
Estimate standard deviation of the body acceleration signals (frequency domain) in the Y direction.
        
* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyAcc.std.Z
Estimated standard deviation of the body acceleration signals (frequency domain) in the Z direction.
        
* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyAccJerk.mean.X
Estimated mean value of the body acceleration jerk signals (frequency domain) in the X direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyAccJerk.mean.Y
Estimated mean value of the body acceleration jerk signals (frequency domain) in the Y direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

fBodyAccJerk.mean.Z
Estimated mean value of the body acceleration jerk signals (frequency domain) in the Z direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyAccJerk.std.X
Estimated standard deviation of the body acceleration jerk signals (frequency domain) in the X direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyAccJerk.std.Y
Estimated standard deviation of the body acceleration jerk signals (frequency domain) in the Y direction.

* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyAccJerk.std.Z
Estimated standard deviation of the body acceleration jerk signals (frequency domain) in the Z direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyGyro.mean.X
Estimated mean value of the gyroscope 3-axial raw signals (frequency domain) in the X direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyGyro.mean.Y
Estimated mean value of the gyroscope 3-axial raw signals (frequency domain) in the Y direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyGyro.mean.Z
Estimated mean value of the gyroscope 3-axial raw signals (frequency domain) in the Z direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyGyro.std.X
Estimated standard deviation of the gyroscope 3-axial raw signals (frequency domain) in the X direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyGyro.std.Y
Estimated standard deviation of the gyroscope 3-axial raw signals (frequency domain) in the Y direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyGyro.std.Z
Estimated standard deviation of the gyroscope 3-axial raw signals (frequency domain) in the Z direction.

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyAccMag.mean
Estimated mean value of the magnitude of the body acceleration signals (frequency domain).	
* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyAccMag.std
Estimated standard deviation of the magnitude of the body acceleration signals (frequency domain).	

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyAccJerkMag.mean
Estimated mean value of the magnitude of the body acceleration jerk signals (frequency domain).	

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyAccJerkMag.std
Estimated standard deviation of the magnitude of the body acceleration jerk signals (frequency domain).	

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyGyroMag.mean
Estimated mean value of the magnitude of the gyroscope 3-axial raw signals (frequency domain).

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyGyroMag.std
Estimated standard deviation of the magnitude of the gyroscope 3-axial raw signals (frequency domain).

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

## fBodyGyroJerkMag.mean
Estimated mean value of the magnitude of the gyroscope 3-axial raw jerk signals (frequency domain).

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

##fBodyGyroJerkMag.std
Estimated mean value of the magnitude of the gyroscope 3-axial raw signals (frequency domain).

* measurement variable
* Number
* Exponetial form with 6 decimal digits and 2 exponential digits

##
## run_anaysis.R
## - yistoneriver

library(plyr)
library(reshape2)

## Download the original data set files
setInternet2(TRUE)
download.file(
  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
  destfile="dataset.zip",method="internal",mode="wb"
  )
unzip("dataset.zip")
setwd("UCI HAR Dataset")

## Merges the training and the test sets to create one data set.
mdata <- rbind(
            read.csv("train\\X_train.txt",sep="",header=FALSE),
            read.csv("test\\X_test.txt",sep="",header=FALSE)
        )

## Extracts only the measurements on the mean and standard deviation 
## for each measurement. 
##
features <- read.csv("features.txt",sep="",header=FALSE)$V2
mdata <- mdata[grep("std\\(\\)|mean\\(\\)",features)]

## Uses descriptive activity names to name the activities in the data set.
##
## The activity labels (defined in activity_labels.txt) is used as the
## corresponding activity names.
activityLabels <- read.csv("activity_labels.txt", header=FALSE,sep="")
activityNames <-  mapvalues(rbind(read.csv("train\\y_train.txt",header=FALSE),
                                  read.csv("test\\y_test.txt",header=FALSE))$V1,
                            as.numeric(activityLabels$V1),
                            as.character(activityLabels$V2))

## Appropriately labels the data set with descriptive variable names. 
##
## Replaces illegal characters with "." and then eliminates consective appearance
## of "." and trailing ".".
## Elimnates second "Body" from some variables (believes this is a typo)

names(mdata) <- gsub("\\.$","", 
                     gsub("\\.\\.+",".",
                        gsub("^fBodyBody","fBody",
                          make.names(grep("std\\(\\)|mean\\(\\)",
                                          features,
                                          value=TRUE)))))
                     
## Creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject. 
##
## Creates a temporal data frame adding Subject and Activities columns.
subjects <-rbind(read.csv("train\\subject_train.txt", 
                          header=FALSE, col.names=c("subject")),
                 read.csv("test\\subject_test.txt",
                          header=FALSE, col.names=c("subject")))
activities <- data.frame(activity=activityNames)
mdata2 <- cbind(subjects,cbind(activities,mdata))

## Calculating the avarage of each variable for each subject/activity pair.
dmelt <-  melt(mdata2, id=c("subject","activity"),
               measure.vars=names(mdata2)[3:length(mdata2)])
tidydata <- dcast(dmelt,
                  subject+activity ~ variable,
                  function(x){sprintf("%e",mean(x))})

## Write resulting tidy data to a comma-separated file.
write.table(tidydata, "tidydata.txt",sep=",",quote=FALSE,row.names=FALSE)

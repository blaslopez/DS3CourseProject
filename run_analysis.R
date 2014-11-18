#
# 17/11/2014 blg Coursera's 
#       
#       This is the script for performing the analysis for then
#       "Getting and Cleaning Data" Project 
#
#       The script suposes the data set is loaded and the
#       path to needed files are in 
#
# 

library(dplyr,quietly=FALSE)
library(reshape2,quietly=FALSE)

# Path to data 


# get the base dir and download data if needed
source("base_dir.R")
bd <- base_dir()

if (bd =="") stop()

# Paht to files
path2features <- paste(file.path(bd,.Platform$file.sep),"features.txt",sep="")
path2activities <- paste(file.path(bd,.Platform$file.sep),"activity_labels.txt",sep="")

path2test <- paste(file.path(bd,"test",.Platform$file.sep),"X_test.txt",sep="")
path2testactivities <- paste(file.path(bd,"test",.Platform$file.sep),"Y_test.txt",sep="")
path2testsubject <- paste(file.path(bd,"test",.Platform$file.sep),"subject_test.txt",sep="")

path2train <- paste(file.path(bd,"train",.Platform$file.sep),"X_train.txt",sep="")
path2trainactivities <- paste(file.path(bd,"train",.Platform$file.sep),"y_train.txt",sep="")
path2trainsubject <- paste(file.path(bd,"train",.Platform$file.sep),"subject_train.txt",sep="")

# Final file
savedfile <- "courseproject.txt"

# ###################################################################
#
# 1. Merge the training an test sets to create one data set
#    Read the two files and join in one data, then read the
#    features and put as colum names but changing names in order
#    to get uniques names
# 

cat("\n1.  Merge the training an test sets ... ")

# ... read each file
test <- read.table(path2test,header=FALSE)
train <- read.table(path2train,header=FALSE)

# the dataset (ds) is the union of test and train in ds data.frame
ds <- rbind(test,train)

# set the column names from features file
colnames<- as.vector(read.table(path2features,header = FALSE)[,2])

# ... but there are some duplicate colname ...
# ... make.names is used to get uniques names for ds
names(ds) <- make.names(colnames,unique=TRUE)


# ... at end remove unnecessary working data
rm(test,train,colnames)

cat("done")


# ###################################################################
#
# 2. Extracts only the measuraments on the mean and standard deviation
#    Thats means select only columns with "mean" or "std" in column name
#
cat("\n2. Extracts only the measuraments on the mean and standard deviation ...")

ds <- select(ds,contains("mean..",ignore.case=TRUE),contains("std..",ignore.case=TRUE))

cat("done")

# ###################################################################
#
# 3. Uses descriptive activity names in the dataset
#    Read the label files and add a new column to the
#    dataset with the new column

cat("\n3. Working cols, ")

# ... activity description in alabels with cols "id" and "activity"
alabels <- read.table(path2activities,header=FALSE)
names(alabels)<-c("id","activity")

# ...atrain and atest contains the activities for each data set
atrain <- read.table(path2trainactivities,header=FALSE)
atest <- read.table(path2testactivities,header=FALSE)

# ...aTestTrain is the union of the two activities datasets
aTestTrain<-rbind(atest,atrain)
names(aTestTrain) <- c("id")

# ...activities is "a column" with an activity descriptive
# name for each row in the global data set (ds)
cat(" Merge activies label ...")
activities <- merge(alabels,aTestTrain,by=c("id","id")) [,2]


# remove working vars
rm (alabels, atrain, atest,aTestTrain)

cat("done")

# ###################################################################
#
# 4. Appropiately labels the data in the data set
#    The new column is added to ds

cat("\n4. Appropiately labels the data in the data set...")
ds <- cbind(activities,ds)
names(ds)[1] <- "activity"

# Names of variables should be
# - All lower case when possible *
# - Descriptive (Diagnosis versus Dx)
# - Not duplicated
# - Not have underscores or dots or white spaces
# https://class.coursera.org/getdata-009/forum/thread?thread_id=179
#   * In compound names let CamelCase for human readiability

names(ds) <- gsub(".","",names(ds),fixed=TRUE)

# remove working vars
rm (activities)

cat("done")

# ###################################################################
#
# 5. From the data set in (4) creates a second... with the average
# of eache variable for each activity and subject

cat("\n5. From the previous dataset, add subject column... ")
# ...strain and stest contains subject datasets
strain <- read.table(path2trainsubject,header=FALSE)
stest <- read.table(path2testsubject,header=FALSE)
# ... and the union
sTestTrain <- rbind(stest,strain)
names(sTestTrain) <- c("subject")

# subjectds is the ds with new subject col
subjectds <- cbind(sTestTrain,ds)

# in average ds the previous ds is melt and group by
# activity, subject and each variable...
# ... when dcast using mean we get the data set with
# the mean of each variable
cat("\n   ... and calculate average of each variable aggreted by Subject and Activity...")
averageds <- melt(subjectds,id=c("subject","activity")) %>%
        group_by(subject,activity,variable) %>%
        dcast(subject+activity ~variable,mean)

# remove working vars
rm(strain,stest,sTestTrain,subjectds)

cat("done \n")

# ###################################################################
#
# Finally the averageds is saved

write.table(averageds,savedfile, row.name=FALSE)

cat("The file has been saved as ",savedfile)

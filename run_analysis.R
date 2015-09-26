#Setting the path and getting the Data

setwd("E:/Data Science/Getting and Cleaning Data")
if(!file.exists("./CourseProject")){dir.create("./CourseProject")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./CourseProject/RawData.zip",method="curl")

unzip(zipfile="./CourseProject/RawData.zip",exdir="./CourseProject")

files_path <- file.path("./CourseProject" , "UCI HAR Dataset")

#Checking the files
files <- list.files(files_path, recursive=TRUE)
files

#########################################################################
# STEP-1 : Reading and Merging the Training and Testing data

# Reading the Features data, Activity data and Subject data
# Y - Activity file, X - Features file
ActivityTrain  <- read.table(file.path(files_path, "train" , "Y_train.txt" ),header = FALSE)
ActivityTest  <- read.table(file.path(files_path, "test" , "Y_test.txt" ),header = FALSE)

SubjectTrain <- read.table(file.path(files_path, "train", "subject_train.txt"),header = FALSE)
SubjectTest <- read.table(file.path(files_path, "test", "subject_test.txt"),header = FALSE)

FeaturesTrain <- read.table(file.path(files_path, "train", "X_train.txt"),header = FALSE)
FeaturesTest  <- read.table(file.path(files_path, "test" , "X_test.txt" ),header = FALSE)

# Basic Exploration
# Check which subjects were in Training and Testing data
table(SubjectTrain)
table(SubjectTest)

# Similarly use can use head(), str(), dim() and table()
# Merging the data
Activity <- rbind(ActivityTrain, ActivityTest)
Subject <- rbind(SubjectTrain, SubjectTest)
Features <- rbind(FeaturesTrain, FeaturesTest)

# Labelling the data tables
names(Subject) <- c("subject")
names(Activity) <- c("activity")
FeaturesNames <- read.table(file.path(files_path, "features.txt"),head=FALSE)
names(Features)<- FeaturesNames$V2

# Combining all the variables and fully merged data
CombinedData <- cbind(Subject, Activity, Features)

############################################################
# STEP-2 : Extracting the measurements of mean and standard deviation

meanSdFeaturesNames <- FeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", FeaturesNames$V2)]

meanSdFeaturesNames #Check the extracted feature variables

# Subsetting the data using the above extracted feature varaibles
CombinedData <- subset(CombinedData,select=c(as.character(meanSdFeaturesNames),"subject","activity"))
str(CombinedData)

############################################################
# STEP-3 : Using descriptive activity names using factors and activity labels

activityLabels <- read.table(file.path(files_path, "activity_labels.txt"),header = FALSE)
activityLabels

CombinedData$activity <- factor(CombinedData$activity, levels = c(1,2,3,4,5,6),labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

head(CombinedData$activity,10) #Checking the data

############################################################
# STEP-4 : Descriptive variable names

names(CombinedData) <- gsub("^t", "Time", names(CombinedData))
names(CombinedData) <- gsub("^f", "Frequency", names(CombinedData))
names(CombinedData)<-gsub("Acc", "Accelerometer", names(CombinedData))
names(CombinedData)<-gsub("Gyro", "Gyroscope", names(CombinedData))
names(CombinedData)<-gsub("Mag", "Magnitude", names(CombinedData))
names(CombinedData)<-gsub("BodyBody", "Body", names(CombinedData))
names(CombinedData)<-gsub("\\()", "", names(CombinedData))

names(CombinedData) # Check

############################################################
# STEP-5 : Second tidy data set with averaging the variables grouped by subject and activity

library(plyr)

GroupedData <- aggregate(. ~subject + activity, CombinedData, mean)
GroupedData<-GroupedData[order(GroupedData$subject,GroupedData$activity),]

write.table(GroupedData, file = "tidydata.txt",row.name=FALSE)

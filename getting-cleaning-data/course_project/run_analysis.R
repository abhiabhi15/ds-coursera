## Course Project Script : Getting and Cleaning Data

## Part 1
#  Merges the training and the test sets to create one data set.

# Loading Data
x_train <- getData("train/X_train.txt")
subject_train <- getData("train/subject_train.txt", colClasses = "character", lineSep = "\n")
activity_train <- getData("train/y_train.txt", lineSep = "\n")
data_train <- cbind(x_train, subject_train, activity_train)

x_test <- getData("test/X_test.txt")
subject_test <- getData("test/subject_test.txt", lineSep = "\n")
activity_test <- getData("test/y_test.txt", lineSep = "\n")
data_test <- cbind(x_test, subject_test, activity_test)

data <- rbind(data_train, data_test)
features <- getData("features.txt", "character")[,2]
names(data) <- c(features, "subject", "activity")

## Part 2
#  Extracts only the measurements on the mean and standard deviation for each measurement. 

newCols <- c( "subject", "activity" )
newCols <- c( newCols,  grep("(mean\\(\\)|std\\(\\))", features, value = T))
data <- data[, (colnames(data) %in% newCols)]


## Part 3
#  Uses descriptive activity names to name the activities in the data set

activity_labels <- getData("activity_labels.txt", colClasses="character")
data <- merge(data, activity_labels, by.x ="activity", by.y = "V1")
data <- data[, !(colnames(data) %in% "activity") ]
names(data)[names(data) == "V2"] <- "activity"

## Part 4
#  Appropriately labels the data set with descriptive activity names.

names(data) <- gsub("([a-z])([A-Z])", "\\1.\\L\\2", names(data), perl = TRUE)
names(data) <- gsub("-" ,".", names(data))
names(data) <- gsub("\\(\\)" ,"", names(data))

## Part 5
#  Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
library(reshape2)
tidy_data <- melt(data, id.vars = c("subject", "activity"))
tidy_data <- dcast(tidy_data, subject + activity ~ variable, mean)
write.table(tidy_data, "tidy_data.csv", sep = ",")


## Helper Function

getData <- function(fileName, colClasses = "numeric", lineSep = ""){
  relFolder <- "./data/dataset/"
  fileName <- paste(relFolder, fileName, sep="/")
  if(lineSep == "") {
    read.table(fileName, colClasses = colClasses)  
  }else{
    read.table( fileName, colClasses = colClasses, sep = lineSep)
  }
}
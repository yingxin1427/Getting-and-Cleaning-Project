#1.merge data
features <- read.table("UCI HAR Dataset/features.txt", col.names = (c("n", "signals")))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.name = c("code","activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.name = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.name = features$signals)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.name = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.name = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.name = features$signals)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.name = "code")
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
mixdata <- cbind(subject,y,x)
#2.extract data
targetdata <- select(mixdata, subject, code, contains("mean"), contains("std"))
#3.name the activities
targetdata$code <- activities[targetdata$code, 2]
#4.name appropriately
names(targetdata) <- gsub("Acc", "Accelerometer", names(targetdata))
names(targetdata) <- gsub("Gyro", "Gyroscope", names(targetdata))
names(targetdata) <- gsub("Mag", "Magnitude", names(targetdata))
names(targetdata) <- gsub("BodyBody", "Body", names(targetdata))
names(targetdata) <- gsub("^t", "Time", names(targetdata))
names(targetdata) <- gsub("^f", "Frequency", names(targetdata))
#5.average data
avgdata <- targetdata %>% group_by(subject, code) %>% summarise_all(funs(mean))
write.table(avgdata, "avgdata.txt", row.name = FALSE)





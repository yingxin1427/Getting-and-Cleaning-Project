#1.merge data
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





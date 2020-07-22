1. The data we used in this project are as follow:
   UCI HAR Dataset/activity_labels.txt
   UCI HAR Dataset/features.txt
   UCI HAR Dataset/test/subject_test.txt
   UCI HAR Dataset/test/X_test.txt
   UCI HAR Dataset/test/y_test.txt
   UCI HAR Dataset/train/subject_train.txt
   UCI HAR Dataset/train/X_train.txt
   UCI HAR Dataset/train/y_train.txt
2. Merge these data together, the colunm name should be the values in features.txt
3. Use dplyr package to select the measurements on the mean and standard deviation
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names
   "Acc" is replaced by "Accelerometer"
   "Gyro" is replaced by "Gyroscope"
   "Mag" is replaced by "Magnitude"
   "BodyBody" is replaced by "Body"
   "^t" is replaced by "Time
   "^f" is replaced by "Frequency"
6. Using the data set in step 4, we group the data by "subject" colunm and "code" colunm, 
   then use summarize_all to calculate the mean of each variable for each activity and each subject
7. Finally we write out the data set as txt file using write.table

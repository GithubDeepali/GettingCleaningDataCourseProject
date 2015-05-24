# GettingCleaningDataCourseProject
Getting and Cleaning Data Course Project- Tidy Dataset

The purpose of the project was to produce a tidy data set from the files provided. The commands which were used to produce the tidy set, as well as corresponding comments, are stored in "run_analysis.R" file.



Steps
 
•merge the training and the test sets to create one data set
•extract only the measurements on the mean and standard deviation for each measurement. 
•use descriptive activity names to name the activities in the data set
•appropriately label the data set with descriptive activity names. 
•create a second, independent tidy data set with the average of each variable for each activity and each subject


Steps taken for creating R script called run_analysis.R that does the following:

Step 1:

Read all the Xtest, Xtrain, Ytest, Ytrain, Subjecttest, Subjecttrain, ActivityLabel and Features txt files.

Function used : read.table()

checked the dimensions of each function

dim(Xtrain) 		7352 561

dim(Xtest)  		2947 561

dim(Subjecttrain)  	7325  1

dim(Subjecttest)	2947  1

dim(Ytrain)		7325  1

dim(Ytest)		2947  1

read the second column of featues table having the names of 561 variables

dim(Activitylabel)       6 2


Step 2:

1 Merge the training and the test data of Xtrain and Xtest as dataset1

dim(dataset1) 10299 561


2 Merge the training and the test data of Subjecttrain and Subjecttest as dataset2

dim(dataset2) 10299 1


3 Merge the training and the test data of Ytrain and Ytest as dataset3

dim(dataset3)  10299 1


Function used : rbind



Step 3:

Set the names of dataset1 variables using feature file : renamed all the 561 variables

Set the column name of dataset2 as Subject

Set the column name of dataset3 as Activity


Step 4:

Merge dataset1, dataset2, dataset3 as one dataset that is merged the training and test sets to create on data set.

Function used: cbind


Step 5:

Extract the columns that contains mean and standard deviation from the merged dataset that is filtered the mean and standard deviation columns and discarded the rest

Function used :  grepl



Step 6:

Rename the numbers 1, 2,3,4,5,6 in the activity column of the data set by descriptive activity name "Walking", "Walking_Upstairs" etc 

Function used : factor

factor labels the activity column by descriptive activity name


Step 7:

From the data set in step 4, created a second, independent tidy data set with the average of each variable for each activity and each subject.

Installed the Reshape2 package using library function

Function Used : melt

Melt function reshaped the data with respect to id variable Subject and Activity 

Function used: dcast

dcast function aggregate the data into 180 rows and 81 columns according to subject and activity, and computed their means and stord it in tidydata

Converted the tidy dataset as txt file using the write.function() as tidydataset

The txt file can be read using the read.function() syntax.


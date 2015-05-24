#Reading all the test, train, feature and activity files
Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
Ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
Ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Subjecttrain <- read.table("./UCI HAR Dataset/train/Subject_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
Activitylabel <- read.table("./UCI HAR Dataset/activity_labels.txt")

#Join the training and test data sets
dataset1 <- rbind(Xtrain, Xtest)
dataset2 <- rbind(Subjecttrain, Subjecttest)
dataset3 <- rbind(Ytrain, Ytest)

#Set names to variables using features file
names(dataset1) <- features
names(dataset2) <- c("Subject")
names(dataset3) <- c("Activity")

#Merge the datasets in single data file
dataset <- cbind(dataset1,dataset2,dataset3)

#Extracts the mean and standard deviation for each measurement
dataset_mean_std <- dataset[ ,grepl("mean|std|Subject|Activity", names(dataset))]

#Name the activities in the data set using the descriptive activity name using factor function by value labels
dataset_mean_std$Activity <- factor(dataset_mean_std$Activity, labels = Activitylabel[, 2])

#Creation of independent data set
library(reshape2)

#melt the data according to subject and activity in order to obtain atomic data
tidy1 <- melt(dataset_mean_std, id = c("Subject" , "Activity"))

#aggregate the data according to subject and activity, computing their means
tidydataset <- dcast(tidy1, Subject + Activity ~ variable, mean)

#converted the data set as a txt file using write.table() function
write.table(tidydataset, "tidydataset.txt", row.names = FALSE)

#Please read the txt file using the read.table() function

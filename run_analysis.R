#Importing datasets
activitiesDS <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, stringsAsFactors=FALSE)
featuresDS <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, stringsAsFactors=FALSE)

#Merging test data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt", header=FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
#Create a dataframe with one column named activityLabel that contains the activity that each observation was doing.
#The factor function, takes a vector of data (y_test$V1) and change each one of it values for the one in the same
#index of the second vector of values (activitiesDS$V2)
activityLabelTemp <- data.frame(activityLabel = factor(y_test$V1, labels = activitiesDS$V2))
testDS <- cbind(activityLabelTemp, subject_test, x_test) #Bind the subject, the activity being performed and the values for said activity.

#Merging training data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
activityLabelTemp <- data.frame(activityLabel = factor(y_train$V1, labels = activitiesDS$V2))
trainDS <- cbind(activityLabelTemp, subject_train, x_train)

#Extract the mean and std and label the columns.
tidyDS <- rbind(testDS, trainDS) #Row bind
names(tidyDS) <- c("Activity", "Subject", featuresDS[,2]) #Change the names of the columns.
regexTmp <- featuresDS$V2[grep("mean\\(\\)|std\\(\\)", featuresDS$V2)] #Find mean and std features using regex
tidyDS <- tidyDS[c("Activity", "Subject", regexTmp)]
write.table(tidyDS, file="./tidyDS.txt", row.names=FALSE) #Save the tidy data set to disk.

#Find the average of each variable for each activity and each subject.
tidyDSMelt <- melt(tidyDS, id=c("Activity", "Subject"), measure.vars=regexTmp)
tidyDSMean <- dcast(tidyDSMelt, Activity + Subject ~ variable, mean)
write.table(tidyDSMean, file="./tidyDSMean.txt", row.names=FALSE)
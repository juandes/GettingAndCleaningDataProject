Codebook
=============================
Explanation of the variables and transformations performed in the script.

activitiesDS: Table with the activity labels. Links the class labels with their activity name.

featuresDS: Table containing the different 561 features from the data set.

subject_test: Table with all the subjects on the testing data set.

x_test: Test set.

y_test: Test labels.

activityLabelTemp: One column data frame that contains the activity that each subject was performing.

testDS: The tidy, merged, dataset with data from activityLabelTest, subject_test and x_test.

subject_train: Table with all the subjects from the training data set.

x_train: Training set.

y_train: Training labels.

trainDS: The tidy, merged, dataset with data from activityLabelTest, subject_train and x_train.

tidyDS: The tidy data set with the corresponding labels and names. It is made of a row binding from testDS and trainDS.

regexTmp: A vector with all the features with the words mean or std.

tidyDSMelt: Data frame obtained after melting tidyDS. After a melt operation each row is an unique id-variable combination.

tidyDSMean: Tidy data set with the average of each variable for each activity and each subject.

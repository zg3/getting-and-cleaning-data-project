## CodeBook
This codebook provides an overview of the source data, the transformations applied to the data,
and a summary of the resulting data fields in tidyHARdata.txt.

####Source Data Overview
Human Activity Recognition Using Smartphones Dataset
Version 1.0

* Data Set Characteristics: Multivariate, Time-Series
* Number of observations: 10299
* Number of attributes: 561

#####Data Collection
Per the UCI website:
* Human Activity Recognition dataset was built from the recordings of 30 subjects performing activities while carrying a waist-mounted smartphone with embedded inertial sensors.
* Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
* Using the embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz.
* The experiments were video-recorded to label the data manually.
* The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.

#####Attribute Information
For each record in the dataset the following is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

####Transormations/Work done to 'Clean' the data
The R script, run_analysis.R performs the following steps to generate the tidy data.
* Downloads the source (zip) file and unzips it into the working directory.
* Directory “UCI HAR Dataset” is created with all the files needed to run the script.
* The files are:
  Codebook and label/lookup files:
  * README.txt
  * features_info.txt: Shows information about the variables used on the feature vector.
  * features.txt: List of all 561 features that will be used to map to the measurments/variables in the test and training datasets. 
  * activity_labels.txt: Links the activity labels (values 1 - 6) with their activity name.
  Training set:
  * train/X_train.txt: Training set. (measurements) 
  * train/y_train.txt: Training labels. (activities)
  * train/subject_train.txt: Identifies the subject who performed the training activity.
  Test set:
  * test/X_test.txt: Test set. (measurements)
  * test/y_test.txt: Test labels. (activities)
  * test/subject_test.txt: Identifies the subject who performed the test activity.
  Raw data files - not used in the analysis
  * files stored in the Inertial Signals folders.
  
* Loads the features and activity labels, the test files, and training files
* Merges the training and test sets into one data frame.  To ensure the integrity of the data, the merge is done in such a way that the order of the observations accross the composite files is maintained.
* Extracts only the variables that have to do with mean or standard deviation.  This is done based on the column names mapped from the features list.  Only those variables with the text 'mean()' or 'std()' in the variable name have been included.
* Lables the dataset with descriptive names corresponding to the variables measured, and edited to remove hyphens / parentheses.
* Uses descriptive activity names to name the activities in the dataset.
* From the dataset generated with the above steps, it creates a second independent tidy data set (tidyHARdata.txt) with the average of each variable for each activity and subject pair.  This tidy dataset is in the wide form.

##### Layout of the Tidy data 
The generated tidy data, tidyHARdata.txt has the following structure:

* Number of observations: 180
* Number of attributes: 68 

The first two columns are ID columns used to summarize the data, the remaining 


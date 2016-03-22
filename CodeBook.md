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

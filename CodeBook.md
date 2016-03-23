## CodeBook
This codebook provides an overview of the source data, the transformations applied to the data,
and a summary of the resulting file, tidyHARdata.txt.

####Source Data Overview
Human Activity Recognition Using Smartphones Dataset - Version 1.0
* Data Set Characteristics: Multivariate, Time-Series
* Number of observations: 10299
* Number of attributes: 561

#####Data Collection
Per the UCI website:
* The Human Activity Recognition dataset was built from the recordings of 30 subjects performing activities while carrying a waist-mounted smartphone with embedded inertial sensors.
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

#####Source Data Layout
The source data is stored in a zip file segmented as follows:
* Codebook and label/lookup files:
 * README.txt.
 * features_info.txt: Shows information about the variables used on the feature vector.
 * features.txt: List of all 561 features that will be used to map to the measurments/variables in the test and training datasets. 
 * activity_labels.txt: Links the activity labels (values 1 - 6) with their activity name.
* Training set:
 * train/X_train.txt: Training set. (measurements) 
 * train/y_train.txt: Training labels. (activities)
 * train/subject_train.txt: Identifies the subject who performed the training activity.
* Test set:
 * test/X_test.txt: Test set. (measurements)
 * test/y_test.txt: Test labels. (activities)
 * test/subject_test.txt: Identifies the subject who performed the test activity.
* Raw data files - not used in the analysis
 * files stored in the Inertial Signals folders.


####Transormations/Work done to 'Clean' the data
The R script, run_analysis.R performs the following steps to generate the tidy data.
* Downloads the source (zip) file and unzips it into the working directory.
* Directory “UCI HAR Dataset” is created with all the files needed to run the script.
* Loads the features, activity labels, test files, and training files
* Merges the training and test sets into one data frame.  To ensure the integrity of the data, the merge is done in such a way that the order of the observations accross the composite files is maintained.
* Extracts only the variables that have to do with mean or standard deviation.  This is done based on the column names mapped from the features list.  Only those variables with the text 'mean()' or 'std()' in the variable name have been included.
* Labels the dataset with descriptive names corresponding to the variables measured, and edited to remove hyphens / parentheses.
* Uses descriptive activity names to name the activities in the dataset.
* From the dataset generated with the above steps, it creates a second independent tidy data set (tidyHARdata.txt) with the average of each variable for each activity and subject pair.

####Tidy Data Overview  
* Dataset Name: tidyHARdata.txt
* Number of observations: 180
* Number of attributes: 68 

The data is in the wide form.  The first two columns, 'subject' and 'activity', are ID columns used to summarize the data.  The remaining 66 columns represent the variables which are independent measurements of subject-activity actions.
There are 30 subjects and 6 activities.  Each subject performed each activity.  30 subjects * 6 activities = 180 rows in the tidy dataset.

#####ID Columns
* subject
  * description: the ID of the subject who performed the activity
  * data type: integer
  * values: (1 - 30)
* activity
  * description: the type of activity performed when the corresponding measurements were taken
  * data type: factor with 6 levels
  * values: (1 = WALKING, 2 = WALKING_UPSTAIRS, 3 = WALKING_DOWNSTAIRS, 4 = SITTING, 5 = STANDING, 6 = LAYING)

#####Measurements
Columns 3 to 68 correspond to the following measures.  
* tbodyaccmeanx           
* tbodyaccmeany           
* tbodyaccmeanz           
* tbodyaccstdx            
* tbodyaccstdy            
* tbodyaccstdz            
* tgravityaccmeanx        
* tgravityaccmeany        
* tgravityaccmeanz        
* tgravityaccstdx         
* tgravityaccstdy         
* tgravityaccstdz         
* tbodyaccjerkmeanx      
* tbodyaccjerkmeany       
* tbodyaccjerkmeanz       
* tbodyaccjerkstdx        
* tbodyaccjerkstdy        
* tbodyaccjerkstdz        
* tbodygyromeanx         
* tbodygyromeany          
* tbodygyromeanz          
* tbodygyrostdx           
* tbodygyrostdy           
* tbodygyrostdz           
* tbodygyrojerkmeanx      
* tbodygyrojerkmeany      
* tbodygyrojerkmeanz      
* tbodygyrojerkstdx       
* tbodygyrojerkstdy       
* tbodygyrojerkstdz       
* tbodyaccmagmean         
* tbodyaccmagstd          
* tgravityaccmagmean      
* tgravityaccmagstd       
* tbodyaccjerkmagmean     
* tbodyaccjerkmagstd      
* tbodygyromagmean        
* tbodygyromagstd         
* tbodygyrojerkmagmean    
* tbodygyrojerkmagstd     
* fbodyaccmeanx           
* fbodyaccmeany           
* fbodyaccmeanz           
* fbodyaccstdx            
* fbodyaccstdy            
* fbodyaccstdz            
* fbodyaccjerkmeanx       
* fbodyaccjerkmeany       
* fbodyaccjerkmeanz       
* fbodyaccjerkstdx        
* fbodyaccjerkstdy        
* fbodyaccjerkstdz        
* fbodygyromeanx          
* fbodygyromeany          
* fbodygyromeanz          
* fbodygyrostdx           
* fbodygyrostdy           
* fbodygyrostdz           
* fbodyaccmagmean         
* fbodyaccmagstd          
* fbodybodyaccjerkmagmean 
* fbodybodyaccjerkmagstd  
* fbodybodygyromagmean    
* fbodybodygyromagstd     
* fbodybodygyrojerkmagmean
* fbodybodygyrojerkmagstd 

The measurements are all numeric variables.  The description/naming conventon follows the following pattern:
* Prefix t - denotes measurements related to time domain signals
* Prefix f - denotes measurements related to frequenncy domain signals
* 'body' - the body mottion component of the sensor acceleration signal
* 'gravity' - the gravitational component of the sensor accelaration signal
* 'acc' - acceleration from the accelerator
* 'gyro' - angular velocity form the gyroscope
* 'mean' - mean measurement
* 'std' - standard deviation measurement
* 'x/y/z' - is used to denote 3-axial signal in the X / Y / Z direction.

Further description can be found in the features_info dataset. 

#####Note:
tidyHARdata.txt can be loaded into R with the following command.
* read.table("tidyHARdata.txt", header = TRUE)

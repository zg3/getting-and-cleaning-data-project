##Getting and Cleaning Data - Course Project
This repository hosts course-project files submitted for the Getting and Cleaning Data course on Coursera.
The purpose of the project is to demonstrate the student's ability to collect, work with, and clean a dataset.

####Source data used for the project:
Human Activity Recognition Using Smartphones Dataset form the UCI Machine Learning Repository.  The dataset was built from the recording of 30 subjects performing activities while wearing a smart phone with embeded sensors.  Further details about the dataset can be found at the website where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

####Repo contents:
* README.md : Provides an overview of the repository contents
* run_analysis.R : An R script used to prepare tidy data from the source dataset.
* CodeBook.md: A code book that describes the variables, the data, and any transformations performed to clean up the data.
* tidyHARdata.txt : Output file (tidy data) created by running the R script, run_analysis.R.

####Overview of the R script
The script, run_analysis.R, does the following:
* Downloads the source dataset from the UCI website and unzips it into the working directory
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set.
* Labels the data set with descriptive variable names.
* Genetates a tidy data set with the average of each variable for each activity and subject pair. 

The output file (tidyHARdata.txt) can be read into R with read.table("tidyHARdata.txt", header = TRUE).

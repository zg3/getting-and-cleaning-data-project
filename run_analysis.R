library(dplyr)

## Download and unzip the dataset
if (!file.exists("./projdata")){dir.create("./projdata")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./projdata/source_dataset.zip")
unzip("./projdata/source_dataset.zip")
## files unzipped into "UCI HAR Dataset" folder in current working directory

## load features and activity labels
features <- read.table("UCI HAR Dataset/features.txt")
act_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

## load the test files
x_test  <- read.table("UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subj_test  <- read.table("UCI HAR Dataset/test/subject_test.txt")

## load the training files
x_train  <- read.table("UCI HAR Dataset/train/x_train.txt")
y_train  <- read.table("UCI HAR Dataset/train/y_train.txt")
subj_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

## merge test and training data
measures <- rbind(x_test, x_train)
activities <- rbind(y_test, y_train)
subjects <- rbind(subj_test, subj_train)

## extract only the measurments on mean and standard deviation 
mean_measures <- grep("mean()",features$V2, fixed = TRUE)
std_measures <- grep("std()",features$V2, fixed = TRUE)
column_index <- sort(c(mean_measures, std_measures))
wanted_measures <- measures[,column_index]

## edit the variable names corresponding to the wanted features.
##varnames <- tolower(sub("()","",features[column_index,2], fixed=TRUE))
varnames <- gsub("()","",features[column_index,2], fixed=TRUE) 
varnames <- gsub("-","",varnames, fixed=TRUE) %>% tolower

## combine the data sets and add column labels
df <- cbind(subjects, activities, wanted_measures)
names(df) <- c("subject", "activity", varnames)

# create a second tidy dataset with the average of each variable for each activity and each subject
tidy_df <-aggregate(df, by=list(df$subject,df$activity), FUN=mean, na.rm=TRUE)

## tidy further.  Remove work columns, turn activities and subjects into factors, use descriptive activity names
tidy_df <- select(tidy_df, -(Group.1:Group.2))
tidy_df$activity <- factor(tidy_df$activity, labels = act_labels$V2)
tidy_df$subject <- factor(tidy_df$subject)

write.table(tidy_df, "tidyHARdata.txt", quote = FALSE, row.names = FALSE)


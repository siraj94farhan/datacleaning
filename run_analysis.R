library(plyr)
library(dplyr)
library(stringr)
library(readr)
library(data.table)

datasetPath <- "UCI HAR Dataset"

## Returns character[]
# Reads the features and cleans it
get_features <- function() {

  # Reads the features from features.txt
  features_text <- read_file(paste(datasetPath, "features.txt", sep = "/"))

  ## Cleans the feature vector
  # Excludes serial numbers from each feature
  features <- str_extract_all(features_text, " .*")
  # Trims extra spaces
  features <- trimws(features[[1]])

  # returns the features
  features
}

# Returns numeric[]
# Coverts character[] to numeric[]
convert_to_numeric <- function(x) {

  # Remove fisrt item, which is empty string
  x <- x[[1]][c(-1)]

  # Converts the character[] into numeric[]
  x <- as.numeric(x)
  x
}

## Returns data frame
# Given a filePath reads X data, does partial cleaning, converts it into data frame, assigns column names
# and extracts measurements for mean and standard deviation
get_X <- function(filePath) {

  # Read the data as character[] for each line
  X_text <- read_lines(paste(datasetPath, filePath, sep = "/"))

  # Split each line into it's value separated by space
  X_list <- lapply(X_text, strsplit, " +")

  # Convert the values from character[] to numeric[]
  X <- lapply(X_list, convert_to_numeric)

  # Creates a data frame by binding a list of vectors
  X <- data.frame(do.call(rbind ,X))

  # Assign column names obtained from get_features()
  colnames(X) <- get_features()

  ## No. 2 from the instruction
  # Extracts only the measurements on the mean and standard deviation for each measurement.
  X <- X[,names(X) %like% "mean[/(/)]" | names(X) %like% "std[/(/)]"]

  X
}

## Returns character[]
# Reads Y data, coverts it into factor and renames factors levels with descriptive activity names
get_Y <- function(filePath) {

  # Read the data as character[] for each line
  y <- read_lines(paste(datasetPath, filePath, sep = "/"))

  # Converts the  character[] into factor
  y <- as.factor(y)

  # No. 3 from the instruction
  # Uses descriptive activity names to name the activities in the data set
  y <- mapvalues(y, from=c("1","2","3","4","5","6"), to=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
  y
}

## Returns character[]
# Reads subjects data and converts it into factor
get_subjects <-  function(filePath) {

  # Read the data as character[] for each line
  subjects <- read_lines(paste(datasetPath, filePath, sep = "/"))

  # Converts character[] into factors
  subjects <- as.factor(subjects)
  subjects
}

## Returns data frame of entire dataset
# Performs additional cleaning process, renames variable names into descriptive ones
get_clean_data <- function() {

  ## Reads all train dataset
  X_train <- get_X("train/X_train.txt")
  Y_train <- get_Y("train/y_train.txt")
  subjects_train <- get_subjects("train/subject_train.txt")

  ## Reads all test dataset
  X_test <- get_X("test/X_test.txt")
  Y_test <- get_Y("test/y_test.txt")
  subjects_test <- get_subjects("test/subject_test.txt")

  ## Adds activity and subjects as new columns
  X_train <- mutate(X_train, activity = Y_train, subject = subjects_train)
  X_test <- mutate(X_test, activity = Y_test, subject = subjects_test)

  ## No. 1 from the instruction
  # Merges the training and the test sets to create one data set.
  data <- rbind(X_train, X_test)

  ##  No. 4 from the instruction
  # Appropriately labels the data set with descriptive variable names.
  data <- rename(data,
                        time_body_accelerometer_signal_mean_x = `tBodyAcc-mean()-X`,
                        time_body_accelerometer_signal_mean_y = `tBodyAcc-mean()-Y`,
                        time_body_accelerometer_signal_mean_z = `tBodyAcc-mean()-Z`,
                        frequency_body_accelerometer_signal_mean_x = `fBodyAcc-mean()-X`,
                        frequency_body_accelerometer_signal_mean_y = `fBodyAcc-mean()-Y`,
                        frequency_body_accelerometer_signal_mean_z = `fBodyAcc-mean()-Z`,
                        time_body_accelerometer_signal_std_x = `tBodyAcc-std()-X`,
                        time_body_accelerometer_signal_std_y = `tBodyAcc-std()-Y`,
                        time_body_accelerometer_signal_std_z = `tBodyAcc-std()-Z`,
                        frequency_body_accelerometer_signal_std_x = `fBodyAcc-std()-X`,
                        frequency_body_accelerometer_signal_std_y = `fBodyAcc-std()-Y`,
                        frequency_body_accelerometer_signal_std_z = `fBodyAcc-std()-Z`,

                        time_gravity_accelerometer_signal_mean_x = `tGravityAcc-mean()-X`,
                        time_gravity_accelerometer_signal_mean_y = `tGravityAcc-mean()-Y`,
                        time_gravity_accelerometer_signal_mean_z = `tGravityAcc-mean()-Z`,
                        time_gravity_accelerometer_signal_std_x = `tGravityAcc-std()-X`,
                        time_gravity_accelerometer_signal_std_y = `tGravityAcc-std()-Y`,
                        time_gravity_accelerometer_signal_std_z = `tGravityAcc-std()-Z`,

                        time_body_accelerometer_jerk_signal_mean_x = `tBodyAccJerk-mean()-X`,
                        time_body_accelerometer_jerk_signal_mean_y = `tBodyAccJerk-mean()-Y`,
                        time_body_accelerometer_jerk_signal_mean_z = `tBodyAccJerk-mean()-Z`,
                        frequency_body_accelerometer_jerk_signal_mean_x = `fBodyAccJerk-mean()-X`,
                        frequency_body_accelerometer_jerk_signal_mean_y = `fBodyAccJerk-mean()-Y`,
                        frequency_body_accelerometer_jerk_signal_mean_z = `fBodyAccJerk-mean()-Z`,
                        time_body_accelerometer_jerk_signal_std_x = `tBodyAccJerk-std()-X`,
                        time_body_accelerometer_jerk_signal_std_y = `tBodyAccJerk-std()-Y`,
                        time_body_accelerometer_jerk_signal_std_z = `tBodyAccJerk-std()-Z`,
                        frequency_body_accelerometer_jerk_signal_std_x = `fBodyAccJerk-std()-X`,
                        frequency_body_accelerometer_jerk_signal_std_y = `fBodyAccJerk-std()-Y`,
                        frequency_body_accelerometer_jerk_signal_std_z = `fBodyAccJerk-std()-Z`,

                        time_body_gyroscope_signal_mean_x = `tBodyGyro-mean()-X`,
                        time_body_gyroscope_signal_mean_y = `tBodyGyro-mean()-Y`,
                        time_body_gyroscope_signal_mean_z = `tBodyGyro-mean()-Z`,
                        frequency_body_gyroscope_signal_mean_x = `fBodyGyro-mean()-X`,
                        frequency_body_gyroscope_signal_mean_y = `fBodyGyro-mean()-Y`,
                        frequency_body_gyroscope_signal_mean_z = `fBodyGyro-mean()-Z`,
                        time_body_gyroscope_signal_std_x = `tBodyGyro-std()-X`,
                        time_body_gyroscope_signal_std_y = `tBodyGyro-std()-Y`,
                        time_body_gyroscope_signal_std_z = `tBodyGyro-std()-Z`,
                        frequency_body_gyroscope_signal_std_x = `fBodyGyro-std()-X`,
                        frequency_body_gyroscope_signal_std_y = `fBodyGyro-std()-Y`,
                        frequency_body_gyroscope_signal_std_z = `fBodyGyro-std()-Z`,

                        time_body_gyroscope_jerk_signal_mean_x = `tBodyGyroJerk-mean()-X`,
                        time_body_gyroscope_jerk_signal_mean_y = `tBodyGyroJerk-mean()-Y`,
                        time_body_gyroscope_jerk_signal_mean_z = `tBodyGyroJerk-mean()-Z`,
                        time_body_gyroscope_jerk_signal_std_x = `tBodyGyroJerk-std()-X`,
                        time_body_gyroscope_jerk_signal_std_y = `tBodyGyroJerk-std()-Y`,
                        time_body_gyroscope_jerk_signal_std_z = `tBodyGyroJerk-std()-Z`,

                        time_body_accelerometer_magnitude_signal_mean = `tBodyAccMag-mean()`,
                        time_body_accelerometer_magnitude_signal_std = `tBodyAccMag-std()`,
                        frequency_body_accelerometer_magnitude_signal_mean = `fBodyAccMag-mean()`,
                        frequency_body_accelerometer_magnitude_signal_std = `fBodyAccMag-std()`,
                        time_gravity_accelerometer_magnitude_signal_mean = `tGravityAccMag-mean()`,
                        time_gravity_accelerometer_magnitude_signal_std = `tGravityAccMag-std()`,

                        time_body_accelerometer_jerk_magnitude_signal_mean = `tBodyAccJerkMag-mean()`,
                        time_body_accelerometer_jerk_magnitude_signal_std = `tBodyAccJerkMag-std()`,
                        frequency_body_accelerometer_jerk_magnitude_signal_mean = `fBodyBodyAccJerkMag-mean()`,
                        frequency_body_accelerometer_jerk_magnitude_signal_std = `fBodyBodyAccJerkMag-std()`,

                        time_body_gyroscope_magnitude_signal_mean = `tBodyGyroMag-mean()`,
                        time_body_gyroscope_magnitude_signal_std = `tBodyGyroMag-std()`,
                        frequency_body_gyroscope_magnitude_signal_mean = `fBodyBodyGyroMag-mean()`,
                        frequency_body_gyroscope_magnitude_signal_std = `fBodyBodyGyroMag-std()`,

                        time_body_gyroscope_jerk_magnitude_signal_mean = `tBodyGyroJerkMag-mean()`,
                        time_body_gyroscope_jerk_magnitude_signal_std = `tBodyGyroJerkMag-std()`,
                        frequency_body_gyroscope_jerk_magnitude_signal_mean = `fBodyBodyGyroJerkMag-mean()`,
                        frequency_body_gyroscope_jerk_magnitude_signal_std = `fBodyBodyGyroJerkMag-std()`
  )
  data
}

## Returns tbl_df
# Transforms data into more tidyer form
get_tidyer_data <- function() {
  # Gets the cleaner data
  data <- get_clean_data()

  # Groups the data by subjects and activity
  grouped_data <- group_by(data, subject, activity)

  # Summarizes all the variables names with mean
  tidyer_data <- summarize_all(grouped_data, mean)
  tidyer_data
}

## The main function
run_analysis <- function() {

  ## No. 4 from the instruction
  # From the data set in step 4, creates a second, independent tidy data set
  # with the average of each variable for each activity and each subject.

  # Gets the tidyer data
  tidyer_data <- get_tidyer_data()

  # Writes the tidyer data into tidyer_data.txt
  write.table(tidyer_data, "tidyer_data.txt", row.names = FALSE)
}

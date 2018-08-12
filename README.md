# Getting and Cleaning Data Course Project

### Required R packages
- plyr
- dplyr
- stringr
- readr
- data.table

### Steps to run the script
1. Install the packages given above.
2. In line 7, Change the datasetPath to the path where dataset is located if it's different from the directory where you run the script.
3. Load the file using `source('run_analysis.R')` command, please ignore the warnings.
4. Run the function `run_analysis()`
5. After few seconds as the funtion completes `tidyer_data.txt` file will be created, which contains tidyer data
6. Please codebook in [codebook.md](https://github.com/siraj94farhan/datacleaning/blob/master/codebook.md)

###### As given in the instruction these 5 tasks need to be completed

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Here, I'll mention which line each one of them are solved

##### 1. Merges the training and the test sets to create one data set.
This is solved inside the function, `get_clean_data` at line 113

##### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
This is solved inside the function, `get_X` at line 60

##### 3. Uses descriptive activity names to name the activities in the data set
This is solved inside the function, `get_Y` at line 77

##### 4. Appropriately labels the data set with descriptive variable names.
This is solved inside the function, `get_clean_data` from line 117 to 192

##### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
This is solved inside the function, `get_tidyer_data` from line 203 to 206

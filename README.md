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

## Code book

1. *subjects*
        It identifies the subject who performed the activity for each window sample. Values range from 1 to 30.
2. *activity*
        It identifies the activity each subject was performing for each window sample.
        Values are one of these
        - WALKING
        - WALKING_UPSTAIRS
        - WALKING_DOWNSTAIRS
        - SITTING
        - STANDING
        - LAYING

3. *time_body_accelerometer_signal_mean_x*
        Mean of time domain body acceleration signal in x axis
4. *time_body_accelerometer_signal_mean_y*
        Mean of time domain body acceleration signal in y axis
5. *time_body_accelerometer_signal_mean_z*
        Mean of time domain body acceleration signal in z axis
6. *time_body_accelerometer_signal_std_x*
        Standard deviation of time domain body acceleration signal in x axis
7. *time_body_accelerometer_signal_std_y*
        Standard deviation of time domain body acceleration signal in y axis
8. *time_body_accelerometer_signal_std_z*
        Standard deviation of time domain body acceleration signal in z axis
9. *time_gravity_accelerometer_signal_mean_x*
        Mean of time domain gravity acceleration signal in x axis
10. *time_gravity_accelerometer_signal_mean_y*
        Mean of time domain gravity acceleration signal in y axis
11. *time_gravity_accelerometer_signal_mean_z*
        Mean of time domain gravity acceleration signal in z axis
12. *time_gravity_accelerometer_signal_std_x*
        Standard deviation of time domain gravity acceleration signal in x axis
13. *time_gravity_accelerometer_signal_std_y*
        Standard deviation of time domain gravity acceleration signal in y axis
14. *time_gravity_accelerometer_signal_std_z*
        Standard deviation of time domain gravity acceleration signal in z axis
15. *time_body_accelerometer_jerk_signal_mean_x*
        Mean of time domain body acceleration jerk signal in x axis
16. *time_body_accelerometer_jerk_signal_mean_y*
        Mean of time domain body acceleration jerk signal in y axis
17. *time_body_accelerometer_jerk_signal_mean_z*
        Mean of time domain body acceleration jerk signal in z axis
18. *time_body_accelerometer_jerk_signal_std_x*
        Standard deviation of time domain body acceleration jerk signal in x axis
19. *time_body_accelerometer_jerk_signal_std_y*
        Standard deviation of time domain body acceleration jerk signal in y axis
20. *time_body_accelerometer_jerk_signal_std_z*
        Standard deviation of time domain body acceleration jerk signal in z axis
21. *time_body_gyroscope_signal_mean_x*
        Mean of time domain body gyroscope signal in x axis
22. *time_body_gyroscope_signal_mean_y*
        Mean of time domain body gyroscope signal in y axis
23. *time_body_gyroscope_signal_mean_z*
        Mean of time domain body gyroscope signal in z axis
24. *time_body_gyroscope_signal_std_x*
        Standard deviation of time domain body gyroscope signal in x axis
25. *time_body_gyroscope_signal_std_y*
        Standard deviation of time domain body gyroscope signal in x axis
26. *time_body_gyroscope_signal_std_z*
        Standard deviation of time domain body gyroscope signal in x axis
27. *time_body_gyroscope_jerk_signal_mean_x*
        Mean of time domain body gyroscope jerk signal in x axis
28. *time_body_gyroscope_jerk_signal_mean_y*
        Mean of time domain body gyroscope jerk signal in y axis
29. *time_body_gyroscope_jerk_signal_mean_z*
        Mean of time domain body gyroscope jerk signal in z axis
30. *time_body_gyroscope_jerk_signal_std_x*
        Standard deviation of time domain body gyroscope jerk signal in x axis
31. *time_body_gyroscope_jerk_signal_std_y*
        Standard deviation of time domain body gyroscope jerk signal in y axis
32. *time_body_gyroscope_jerk_signal_std_z*
        Standard deviation of time domain body gyroscope jerk signal in z axis
33. *time_body_accelerometer_magnitude_signal_mean*
        Mean of magnitude of time domain body acceleration signal
34. *time_body_accelerometer_magnitude_signal_std*
        Standard deviation of magnitude of time domain body acceleration signal
35. *time_gravity_accelerometer_magnitude_signal_mean*
        Mean of magnitude of time domain gravity acceleration signal
36. *time_gravity_accelerometer_magnitude_signal_std*
        Standard deviation of magnitude of time domain gravity acceleration signal
37. *time_body_accelerometer_jerk_magnitude_signal_mean*
        Mean of magnitude of time domain body acceleration jerk signal
38. *time_body_accelerometer_jerk_magnitude_signal_std*
        Standard deviation of magnitude of time domain body acceleration jerk signal
39. *time_body_gyroscope_magnitude_signal_mean*
        Mean of magnitude of time domain body gyroscope signal
40. *time_body_gyroscope_magnitude_signal_std*
        Standard deviation of magnitude of time domain body gyroscope signal
41. *time_body_gyroscope_jerk_magnitude_signal_mean*
        Mean of magnitude of time domain body gyroscope jerk signal
42. *time_body_gyroscope_jerk_magnitude_signal_std*
        Standard deviation of magnitude of time domain body gyroscope jerk signal
43. *frequency_body_accelerometer_signal_mean_x*
        Mean of frequency domain body acceleration signal in x axis
44. *frequency_body_accelerometer_signal_mean_y*
        Mean of frequency domain body acceleration signal in y axis
45. *frequency_body_accelerometer_signal_mean_z*
        Mean of frequency domain body acceleration signal in z axis
46. *frequency_body_accelerometer_signal_std_x*
        Standard deviation of frequency domain body acceleration signal in x axis
47. *frequency_body_accelerometer_signal_std_y*
        Standard deviation of frequency domain body acceleration signal in y axis
48. *frequency_body_accelerometer_signal_std_z*
        Standard deviation of frequency domain body acceleration signal in z axis
49. *frequency_body_accelerometer_jerk_signal_mean_x*
        Mean of frequency domain body acceleration jerk signal in x axis
50. *frequency_body_accelerometer_jerk_signal_mean_y*
        Mean of frequency domain body acceleration jerk signal in y axis
51. *frequency_body_accelerometer_jerk_signal_mean_z*
        Mean of frequency domain body acceleration jerk signal in z axis
52. *frequency_body_accelerometer_jerk_signal_std_x*
        Standard deviation of frequency domain body acceleration jerk signal in x axis
53. *frequency_body_accelerometer_jerk_signal_std_y*
        Standard deviation of frequency domain body acceleration jerk signal in y axis
54. *frequency_body_accelerometer_jerk_signal_std_z*
        Standard deviation of frequency domain body acceleration jerk signal in z axis
55. *frequency_body_gyroscope_signal_mean_x*
        Mean of frequency domain body gyroscope signal in x axis
56. *frequency_body_gyroscope_signal_mean_y*
        Mean of frequency domain body gyroscope signal in y axis
57. *frequency_body_gyroscope_signal_mean_z*
        Mean of frequency domain body gyroscope signal in z axis
58. *frequency_body_gyroscope_signal_std_x*
        Standard deviation of frequency domain body gyroscope signal in x axis
59. *frequency_body_gyroscope_signal_std_y*
        Standard deviation of frequency domain body gyroscope signal in y axis
60. *frequency_body_gyroscope_signal_std_z*
        Standard deviation of frequency domain body gyroscope signal in z axis
61. *frequency_body_accelerometer_magnitude_signal_mean*
        Mean of magnitude of frequency domain body acceleration signal
62. *frequency_body_accelerometer_magnitude_signal_std*
        Standard deviation of magnitude of frequency domain body acceleration signal
63. *frequency_body_accelerometer_jerk_magnitude_signal_mean*
        Mean of magnitude of frequency domain body acceleration jerk signal
64. *frequency_body_accelerometer_jerk_magnitude_signal_std*
        Standard deviation of magnitude of frequency domain body acceleration jerk signal
65. *frequency_body_gyroscope_magnitude_signal_mean*
        Mean of magnitude of frequency domain body gyroscope signal
66. *frequency_body_gyroscope_magnitude_signal_std*
        Standard deviation of magnitude of frequency domain body gyroscope signal
67. *frequency_body_gyroscope_jerk_magnitude_signal_mean*
        Mean of magnitude of frequency domain body gyroscope jerk signal
68. *frequency_body_gyroscope_jerk_magnitude_signal_std*
        Standar deviation of magnitude of frequency domain body gyroscope signal

##Data

Data set with the average of each variable for each activity and each subject from the 
*Human Activity Recognition Using Smartphones Dataset* (Version 1.0)

###Original dataset credits

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Università degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

http://www.smartlab.ws

###Original dataset url
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Transformations

- The original dataset cames in two different sets: one for *test* and the second for *train*. The two files are merged (added as union).
- The *activity labels* and *subject id*, originally are in two separated files (for each set) and are joined to the final dataset as two new columns
-- subject
-- activity
- The *activity* variable is reworked and contains the description of the activity
- The final dataset contains the mean of all mean and standard deviation from the original dataset agregated by subject and activity

##Variables

### About variable naming
For variables 3 to 69 contains the mean of the values indicated in the column name using the convention specified in the original "features_info.txt" file


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

+ tBodyAcc-XYZ
+ tGravityAcc-XYZ
+ tBodyAccJerk-XYZ
+ tBodyGyro-XYZ
+ tBodyGyroJerk-XYZ
+ tBodyAccMag
+ tGravityAccMag
+ tBodyAccJerkMag
+ tBodyGyroMag
+ tBodyGyroJerkMag
+ fBodyAcc-XYZ
+ fBodyAccJerk-XYZ
+ fBodyGyro-XYZ
+ fBodyAccMag
+ fBodyAccJerkMag
+ fBodyGyroMag
+ fBodyGyroJerkMag

Finally, the "std" or "mean" substring in the column name denotes that is a "mean of standard deviation" or a "mean of mean".

### Variables order

1. **subject** Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
2. **activity** Can be: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
3. **tBodyAccmeanX**
4. **tBodyAccmeanY**
5. **tBodyAccmeanZ**
6. **tGravityAccmeanX**
7. **tGravityAccmeanY**
8. **tGravityAccmeanZ**
9. **tBodyAccJerkmeanX**
10. **tBodyAccJerkmeanY**
11. **tBodyAccJerkmeanZ**
12. **tBodyGyromeanX**
13. **tBodyGyromeanY**
14. **tBodyGyromeanZ**
15. **tBodyGyroJerkmeanX**
16. **tBodyGyroJerkmeanY**
17. **tBodyGyroJerkmeanZ**
18. **tBodyAccMagmean**
19. **tGravityAccMagmean**
20. **tBodyAccJerkMagmean**
21. **tBodyGyroMagmean**
22. **tBodyGyroJerkMagmean**
23. **fBodyAccmeanX**
24. **fBodyAccmeanY**
25. **fBodyAccmeanZ**
26. **fBodyAccJerkmeanX**
27. **fBodyAccJerkmeanY**
28. **fBodyAccJerkmeanZ**
29. **fBodyGyromeanX**
30. **fBodyGyromeanY**
31. **fBodyGyromeanZ**
32. **fBodyAccMagmean**
33. **fBodyBodyAccJerkMagmean**
34. **fBodyBodyGyroMagmean**
35. **fBodyBodyGyroJerkMagmean**
36. **angletBodyAccJerkMeangravityMean**
37. **tBodyAccstdX**
38. **tBodyAccstdY**
39. **tBodyAccstdZ**
40. **tGravityAccstdX**
41. **tGravityAccstdY**
42. **tGravityAccstdZ**
43. **tBodyAccJerkstdX**
44. **tBodyAccJerkstdY**
45. **tBodyAccJerkstdZ**
46. **tBodyGyrostdX**
47. **tBodyGyrostdY**
48. **tBodyGyrostdZ**
49. **tBodyGyroJerkstdX**
50. **tBodyGyroJerkstdY**
51. **tBodyGyroJerkstdZ**
52. **tBodyAccMagstd**
53. **tGravityAccMagstd**
54. **tBodyAccJerkMagstd**
55. **tBodyGyroMagstd**
56. **tBodyGyroJerkMagstd**
57. **fBodyAccstdX**
58. **fBodyAccstdY**
59. **fBodyAccstdZ**
60. **fBodyAccJerkstdX**
61. **fBodyAccJerkstdY**
62. **fBodyAccJerkstdZ**
63. **fBodyGyrostdX**
64. **fBodyGyrostdY**
65. **fBodyGyrostdZ**
66. **fBodyAccMagstd**
67. **fBodyBodyAccJerkMagstd**
68. **fBodyBodyGyroMagstd**
69. **fBodyBodyGyroJerkMagstd**




# Code Book
This code book consists of two sections.

Section 1 contains a description of the processing steps performed to create a tidy state for the Coursera class "Getting and Cleaning Data." Further information about the raw data set may be found in Readme.md.

Section 2 contains the Data Dictionary, which provides definitions of the variables and their units.


## Processing Steps




### Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean: Mean value
std: Standard deviation
angle: Angle between two vectors.


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

## DATA DICTIONARY

The complete list of variables of each feature vector is available in the list below, wherein:
* Subject is an integer from 1-30
* Activity is a string representings one of the following: 1: WALKING, 2: WALKING_UPSTAIRS, 3: WALKING_DOWNSTAIRS, 4: SITTING, 5: STANDING, 6: LAYING
* Features (columns 3-68) are numeric values which are normalized and bounded within [-1,1]

Column|Variable
--------|---------
1|Subject
2|Activity
3|tBodyAcc_mean_X
4|tBodyAcc_mean_Y
5|tBodyAcc_mean_Z
6|tBodyAcc_std_X
7|tBodyAcc_std_Y
8|tBodyAcc_std_Z
9|tGravityAcc_mean_X
10|tGravityAcc_mean_Y
11|tGravityAcc_mean_Z
12|tGravityAcc_std_X
13|tGravityAcc_std_Y
14|tGravityAcc_std_Z
15|tBodyAccJerk_mean_X
16|tBodyAccJerk_mean_Y
17|tBodyAccJerk_mean_Z
18|tBodyAccJerk_std_X
19|tBodyAccJerk_std_Y
20|tBodyAccJerk_std_Z
21|tBodyGyro_mean_X
22|tBodyGyro_mean_Y
23|tBodyGyro_mean_Z
24|tBodyGyro_std_X
25|tBodyGyro_std_Y
26|tBodyGyro_std_Z
27|tBodyGyroJerk_mean_X
28|tBodyGyroJerk_mean_Y
29|tBodyGyroJerk_mean_Z
30|tBodyGyroJerk_std_X
31|tBodyGyroJerk_std_Y
32|tBodyGyroJerk_std_Z
33|tBodyAccMag_mean
34|tBodyAccMag_std
35|tGravityAccMag_mean
36|tGravityAccMag_std
37|tBodyAccJerkMag_mean
38|tBodyAccJerkMag_std
39|tBodyGyroMag_mean
40|tBodyGyroMag_std
41|tBodyGyroJerkMag_mean
42|tBodyGyroJerkMag_std
43|fBodyAcc_mean_X
44|fBodyAcc_mean_Y
45|fBodyAcc_mean_Z
46|fBodyAcc_std_X
47|fBodyAcc_std_Y
48|fBodyAcc_std_Z
49|fBodyAccJerk_mean_X
50|fBodyAccJerk_mean_Y
51|fBodyAccJerk_mean_Z
52|fBodyAccJerk_std_X
53|fBodyAccJerk_std_Y
54|fBodyAccJerk_std_Z
55|fBodyGyro_mean_X
56|fBodyGyro_mean_Y
57|fBodyGyro_mean_Z
58|fBodyGyro_std_X
59|fBodyGyro_std_Y
60|fBodyGyro_std_Z
61|fBodyAccMag_mean
62|fBodyAccMag_std
63|fBodyBodyAccJerkMag_mean
64|fBodyBodyAccJerkMag_std
65|fBodyBodyGyroMag_mean
66|fBodyBodyGyroMag_std
67|fBodyBodyGyroJerkMag_mean
68|fBodyBodyGyroJerkMag_std


License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones 
using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). 
Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions 
for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

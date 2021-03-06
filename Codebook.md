# Codebook to accompany the `run_analysis.R` script

This is a code book to accompany the run_analysis.R script. After reading in the 'subject', 'X', and 'y' files for the 'test' and 'train' measurements, the data is combined into one table only containing the mean and standard deviation of certain measurements.

**Basic variables in the new table are as follows:**

- subject: id of the participating subject (int)
- activity: the activity performed during that experiment (char)
- data_set: specifies data set: train or test (char)

**Measurements in new table:**

Taken from "UCI HAR Dataset/features_info.txt" 

```
The features selected for this database come from the accelerometer and
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain
signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.
Then they were filtered using a median filter and a 3rd order low pass
Butterworth filter with a corner frequency of 20 Hz to remove noise.
Similarly, the acceleration signal was then separated into body and gravity
acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass
Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived
in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ. (Note the 'f' to
indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each
pattern: 

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
```

- tBodyAcc-XYZ (dble)
- tGravityAcc-XYZ (dble)
- tBodyAccJerk-XYZ (dble)
- tBodyGyro-XYZ (dble)
- tBodyGyroJerk-XYZ (dble)
- fBodyAcc-XYZ (dble)
- fBodyAccJerk-XYZ (dble)
- fBodyGyro-XYZ (dble)

**This set of variable estimates are:**

- mean(): Mean value
- std(): Standard deviation

**Note:**

- In the table written to file ("mean_std_summary_table"), every mean and standard deviation measurement variable is prefixed with "meanOf_" to indicate that the variable in that column is an average of a measurement's means or measurement's standard deviations, i.e. `meanOf_tBodyAcc_mean()_X` or `meanOf_tBodyAcc_std()_X`.
# get_clean_data_assignment

This is a data set which takes the existing "Human Activity Recognition Using Smartphones - Version 1.0" data set and manipulates it to contain only the mean and standard deviations of measurements taken. These measurements are expressed in two separate domains: spatial and frequency.

The manipulation of the original data is performed in the "run_analysis.R" script. The script reads in the necessary files from the "UCI HAR Dataset" directory to create one table of the 'train' and 'test' experiments. This table is then trimmed to only contain the means and standard deviations of measurements taken in the spatial and frequency domains. Finally, the script writes to a file ("mean_std_summary_table.txt") a summary table: each row in the table writen to file contains the averages of the 'mean' and 'standard deviation' measurements for each subject's activity experiments, test or train data set.


**In this modified data set contains the following information for each subject in the study:**

- the subject id #
- a description of the subject's activity
- a variable to determine the subject's group: 'test' or 'train'
- 66 variables containing the mean or standard deviation for measurements in the spatial or frequency domain


**This data set contains the following:**

- "README.md"
- "Codebook.md": shows information on variables contained in the final data table after running run_analysis.R script
- "run_analysis.R": script that reads in the necessary files from the "UCI HAR Dataset".
- "UCI HAR Dataset" - directory containing Version 1.0 Human Activity Recognition Using Smartphones data files and description files ("README.txt", "features_info.txt", "features.txt", "activity_labels.txt")


**Notes:    **

- Use `read.table(file_path, header = TRUE)` when reading "mean_std_summary_table.txt" into R.
- Features are normalized and bounded within [-1,1].
- 'acc' measurements are in units of the gravitational constant, g.
- 'gyro' measurements are in units of radians/second.


For more information about the original data set, see "UCI HAR Dataset/README.txt"
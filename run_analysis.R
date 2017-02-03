## Loading libraries
library(dplyr)
library(reshape2)

##################################
## reading in data files
top_dir <- "UCI HAR Dataset"
data_set <- c("test","train")
data_set2 <- c("subject_","X_","y_")
inertial_set <- c("body_acc_","body_gyro_","total_acc_")

for(i in data_set) {
      for(j in data_set2) {
            assign(paste0(j,i),
                   tbl_df(read.table(paste0(top_dir,"/",i,"/",j,i,".txt"))))
      }
      
#      for(ii in inertial_set) {
#            for(jj in c("x","y","z")) {
#                  assign(paste0(ii,jj,"_",i),
#                         tbl_df(read.table(paste0(top_dir,"/",i,"/Inertial Signals/",ii,jj,"_",i,".txt"))))
#            }
#      }

}
##################################

## create columns to describe data set type: 'test' or 'train'
test_type <- as.character(rep("test",nrow(subject_test)))
train_type <- as.character(rep("train",nrow(subject_train)))

## Combine 'test' & 'train' data & set column names
test <- cbind.data.frame(subject_test,y_test,"data_set" = test_type,X_test,
                         stringsAsFactors = FALSE)
train <- cbind.data.frame(subject_train,y_train,"data_set" = train_type,X_train,
                          stringsAsFactors = FALSE)
full_set <- rbind.data.frame(test,train)

features <- read.table(paste0(top_dir,"/features.txt"),stringsAsFactors = FALSE)
labels <- c("subject","activity","data_set",features[,2])
colnames(full_set) <- gsub("-","_",labels)

## keeping only variables involving the 
## mean or standard deviation of measurements
cols_to_keep <- c(1,2,3,grep("mean\\(\\)|std\\(\\)",labels))
full_set <- full_set[,cols_to_keep]

## rename activity #'s to descriptions (WALKING, etc.)
activities <- read.table(paste0(top_dir,"/activity_labels.txt"),stringsAsFactors = FALSE)
activities <- activities[,2]

for(i in 1:length(activities)) {
      full_set$activity[full_set$activity == i] = activities[i]
}

## create table of averages of means and standard deviations of 
## motion measurements for each subject and a given activity
tbl_to_write <- aggregate(full_set[,-(1:3)],by = full_set[,1:3], mean)
tbl_to_write <- arrange(tbl_to_write, subject, activity)

colnames(tbl_to_write) <- c(colnames(tbl_to_write)[1:3],
                            paste0("meanOf_", colnames(tbl_to_write)[-(1:3)]))

write.table(tbl_to_write,"mean_std_summary_table.txt",row.name=FALSE)

## The purpose of this project is to demonstrate the ability to collect, 
## work with, and clean a data set. The source material for this is 
## data collected from the accelerometers of the Samsung Galaxy S smartphone.

# Clear the workspace
rm(list=ls())

#Assume the required data is within the current working directory


#load libraries
library("plyr")


# Step 1 - Merge the training and the test sets to create one data set
training_set      <- read.table("UCI HAR Dataset/train/X_train.txt")
training_labels   <- read.table("UCI HAR Dataset/train/y_train.txt")
training_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
test_set          <- read.table("UCI HAR Dataset/test/X_test.txt")
test_labels       <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subjects     <- read.table("UCI HAR Dataset/test/subject_test.txt")
features          <- read.table("UCI HAR Dataset/features.txt")
features          <- as.character(features[,2])

# Now combine all into one data_frame and give descriptive column names
df1 <- as.data.frame(c(training_subjects, training_labels, training_set))
df2 <- as.data.frame(c(test_subjects, test_labels, test_set))
full_df <- rbind(df1, df2)
colnames(full_df) <- c("Subject", "Activity", features)
full_df$Subject <- factor(full_df$Subject)
full_df$Activity <- factor(full_df$Activity)

# Step 2 - Extracts only the measurements on the mean and standard deviation for
#          each measurement. 
# The command for mean is "mean" and for standard deviation is "std".  We can 
# match these partial strings to the feature names
 
# for mean, select only those files with "mean()" which will exclude 'meanfreq'
# 'Meanfreq' does not have an associated standard deviation.
# Using fixed=TRUE in the grep command only returns exact matches
mean_indices <- grep("mean()", colnames(full_df), fixed=TRUE)
std_indices  <- grep("std()", colnames(full_df), fixed=TRUE)
combined_indices <- sort(c(mean_indices, std_indices))

# Create a new frame with subject (col1), activity label (col2), and all of the
#  mean and standard deviation columns (combined_indices)
DFmeanstd <- full_df[ , c(1,2, combined_indices)]

# Step 3 - Uses descriptive activity names to name the activities in the data set
# The Activity labels are numeric but they can be converted to character strings
# Mapping is provided in the activity_labels.txt file
# We can use "sapply" and "match" to match the numeric value with the string

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
DFmeanstd[,2] <- sapply(DFmeanstd[ ,2], 
                        function(x) activity_labels[match(x, activity_labels[,1]),2])


# Step 4 - Appropriately labels the data set with descriptive variable names. 

# Now clean up the feature names in the header (variable labels) by taking out  
# '-' and '()'.  Using fixed = TRUE in the gsub command ensures the parentheses 
# are treated as characters. This is now a tidy data set

names(DFmeanstd) <- gsub("-", "_", names(DFmeanstd), fixed=TRUE)
names(DFmeanstd) <- gsub("()", "", names(DFmeanstd), fixed=TRUE)


# Step 5 - From the data set in step 4, creates a second, independent tidy data
#          set with the average of each variable for each activity and each subject.


# utilize the dplyr commands to make it each to calculate the means
final <- DFmeanstd %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))


#Now write out the results to a table
write.table(final, "final_result.txt", row.names = FALSE)

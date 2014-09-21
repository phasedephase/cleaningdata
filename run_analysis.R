## merge the training and test sets

actv_labels_df <- read.table('activity_labels.txt')  
varnames <- read.table('features.txt')

stt_df <- read.table('subject_test.txt')  
ytt_df <- read.table('y_test.txt')    
xtt_df <- read.table('X_test.txt')
xtt_df <- cbind(ytt_df, xtt_df)
xtt_df <- cbind(stt_df, xtt_df)

cnames <- c('subjectID', 'activityID', as.character(varnames[, 2]))
colnames(xtt_df) <- cnames
 
stn_df <- read.table('subject_train.txt')
ytn_df <- read.table('y_train.txt')   
xtn_df <- read.table('X_train.txt')
xtn_df <- cbind(ytn_df, xtn_df)
xtn_df <- cbind(stn_df, xtn_df)

colnames(xtn_df) <- cnames
final_df <- rbind(xtt_df, xtn_df)

## Extract only the measurements on the mean and standard deviation for each measurement

meanv <- subset(cnames, grepl('-mean[^Freq]()', cnames))
stdv <- subset(cnames, grepl('-std()', cnames))
mean_std_df <- final_df[, c('subjectID', 'activityID', meanv, stdv)]

## Use descriptive activity names to name the activities in the data set

mean_std_df <- actv_labels_df[mean_std_df$activityID, 'V2']

## Appropriately labels the data set with descriptive variable names
## no need as this is an engineer's domain and all the var are clearly self-explanatory already

## From the data set in step 4, creates a second, independent tidy data set with 
## the average of each variable for each activity and each subject

mean_only_df <- final_df[, c('subjectID', 'activityID', meanv)]  # only the mean of all vars across all subject and activities
write.table(mean_only_df, file = 'tidy.txt', row.names = FALSE)
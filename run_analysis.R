## load necessary package
library(dplyr)
## read and merge data
x_test <- read.table('./UCI HAR Dataset/test/x_test.txt')
y_test <- read.table('./UCI HAR Dataset/test/y_test.txt', col.names = 'activity')
subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt', col.names = 'identifier')

x_train <- read.table('./UCI HAR Dataset/train/x_train.txt')
y_train <- read.table('./UCI HAR Dataset/train/y_train.txt', col.names = 'activity')
subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt', col.names = 'identifier')

test_data <- cbind(x_test, y_test, subject_test)
train_data <- cbind(x_train, y_train, subject_train)
data <- rbind(test_data, train_data)

## extracts mean and sd cols 
features <- read.table('./UCI HAR Dataset/features.txt')
mean_or_std <- grep('(mean\\(\\))|(std\\(\\))', features[,2])  
mean_or_std_Names <- features[mean_or_std,2]
mean_or_std_Data <- data[mean_or_std]
colnames(mean_or_std_Data) <- mean_or_std_Names

## merge data
data <- cbind(data[,c('activity','identifier')], mean_or_std_Data)

## apply descriptive name to variable  
data_activity <- read.table('./UCI HAR Dataset/activity_labels.txt', 
                            col.names = c('activity', 'activity_labels'))
merge_data <- merge(data, data_activity)

## create second data set 
data_group <- merge_data %>% select(!activity) %>%  group_by(activity_labels, identifier) %>% summarize_all(mean)
data_2 <- data.frame(data_group)


## export data set
write.table(data_2, 'dataset_2.txt',row.names = FALSE, quote = FALSE)

## read and merge data
x_test <- read.table('./data/UCI HAR Dataset/test/x_test.txt')
y_test <- read.table('./data/UCI HAR Dataset/test/y_test.txt', col.names = 'activity')
subject_test <- read.table('./data/UCI HAR Dataset/test/subject_test.txt', col.names = 'identifier')

x_train <- read.table('./data/UCI HAR Dataset/train/x_train.txt')
y_train <- read.table('./data/UCI HAR Dataset/train/y_train.txt', col.names = 'activity')
subject_train <- read.table('./data/UCI HAR Dataset/train/subject_train.txt', col.names = 'identifier')

test_data <- cbind(x_test, y_test, subject_test)
train_data <- cbind(x_train, y_train, subject_train)
data <- rbind(test_data, train_data)

## extracts mean and sd
col_mean <- sapply(data, mean)
col_sd <- sapply(data, sd)


## apply descriptive name to variable  
data_activity <- read.table('./data/UCI HAR Dataset/activity_labels.txt', col.names = c('activity', 'activity_labels'))
merge_data <- merge(data, data_activity)

## create second data set 
data_group <- merge_data %>% select(!activity) %>%  group_by(activity_labels, identifier) %>% summarize_all(mean)
data_2 <- data.frame(data_group)


## export data set
write.table(data_2, './data/dataset_2.txt', row.names = FALSE)

## Getting and Cleaning Data - Course Project
---
### 1 data source
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### 2 codes explanation
1. read and merge data
2. only selects mean() and std() cols
3. group by activity & identifier then apply mean func to get final dataset


### results explanation

These Extracts only the measurements on the mean and standard deviation for each measurement

- activity_labels: shows the ongoing activity
- indentifier: indicate the user's id
- others are features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

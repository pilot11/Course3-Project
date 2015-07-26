## Merges the training and the test sets to create one data set.

1. Use read.table() function to read train and test data from X_train.txt and X_test.txt .
2. Then use merge() function to merges train and test data,the param "sort" of merge function set to "FALSE".

## Extracts only the measurements on the mean and standard deviation for each measurement. 
1. First,write a function call "containstring" find whether a string contains a given substring,return "TRUE" or "FALSE".
2. Use read.table() to read "features.txt".The second column is the step1 merged data column names.
3. Use function "containstring" to find these column names contain "mean()" or "std()",they are the mean and standard deviation for each measurement.
4. Use the return logic vector from function "containstring" to select the mean and standard deviation column.


## Uses descriptive activity names to name the activities in the data set.
1. Read "activity_labels.txt" in R.
2. Change column names to "activity_code" and "activity".
3. Read activity file "y_train.txt" and "y_test.txt" in R.
4. Concat these activity data to vector and use cbind() fuction to add this vector to step2 result as a new colmn.Set the new column name "activity_code".
5. Merge the labels data and the data after cbind.


## Appropriately labels the data set with descriptive variable names. 
1. Step2 select the mean and standard deviation column num and column names.
2. Add these column names to the step3 result by using colnames() <- .


## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
1. Select step4 data's numerical column to create a matrix.
2. The first column of matrix is the activity code.
3. Then conpute the mean of other column by using "sapply()" and "split()" function.
4. Use "cbind()" function to bind these columns mean data.
5. Save result by "write.table()" function.


# Download Data

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



# Variables

- Subject
- Activity: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- TimeBodyAccelerometerMeanX
- TimeBodyAccelerometerMeanY
- TimeBodyAccelerometerMeanZ
- TimeBodyAccelerometerStdX
- TimeBodyAccelerometerStdY
- TimeBodyAccelerometerStdZ
- TimeGravityAccelerometerMeanX
- TimeGravityAccelerometerMeanY
- TimeGravityAccelerometerMeanZ
- TimeGravityAccelerometerStdX
- TimeGravityAccelerometerStdY
- TimeGravityAccelerometerStdZ
- TimeBodyAccelerometerJerkMeanX
- TimeBodyAccelerometerJerkMeanY
- TimeBodyAccelerometerJerkMeanZ
- TimeBodyAccelerometerJerkStdX
- TimeBodyAccelerometerJerkStdY
- TimeBodyAccelerometerJerkStdZ
- TimeBodyGyroMeanX
- TimeBodyGyroMeanY
- TimeBodyGyroMeanZ
- TimeBodyGyroStdX
- TimeBodyGyroStdY
- TimeBodyGyroStdZ
- TimeBodyGyroJerkMeanX
- TimeBodyGyroJerkMeanY
- TimeBodyGyroJerkMeanZ
- TimeBodyGyroJerkStdX
- TimeBodyGyroJerkStdY
- TimeBodyGyroJerkStdZ
- TimeBodyAccelerometerMagMean
- TimeBodyAccelerometerMagStd
- TimeGravityAccelerometerMagMean
- TimeGravityAccelerometerMagStd
- TimeBodyAccelerometerJerkMagMean
- TimeBodyAccelerometerJerkMagStd
- TimeBodyGyroMagMean
- TimeBodyGyroMagStd
- TimeBodyGyroJerkMagMean
- TimeBodyGyroJerkMagStd
- FrequencyBodyAccelerometerMeanX
- FrequencyBodyAccelerometerMeanY
- FrequencyBodyAccelerometerMeanZ
- FrequencyBodyAccelerometerStdX
- FrequencyBodyAccelerometerStdY
- FrequencyBodyAccelerometerStdZ
- FrequencyBodyAccelerometerJerkMeanX
- FrequencyBodyAccelerometerJerkMeanY
- FrequencyBodyAccelerometerJerkMeanZ
- FrequencyBodyAccelerometerJerkStdX
- FrequencyBodyAccelerometerJerkStdY
- FrequencyBodyAccelerometerJerkStdZ
- FrequencyBodyGyroMeanX
- FrequencyBodyGyroMeanY
- FrequencyBodyGyroMeanZ
- FrequencyBodyGyroStdX
- FrequencyBodyGyroStdY
- FrequencyBodyGyroStdZ
- FrequencyBodyAccelerometerMagMean
- FrequencyBodyAccelerometerMagStd
- FrequencyBodyBodyAccelerometerJerkMagMean
- FrequencyBodyBodyAccelerometerJerkMagStd
- FrequencyBodyBodyGyroMagMean
- FrequencyBodyBodyGyroMagStd
- FrequencyBodyBodyGyroJerkMagMean
- FrequencyBodyBodyGyroJerkMagStd
- angle(tBodyAccelerometerMean,gravity)
- angle(tBodyAccelerometerJerkMean),gravityMean)
- angle(tBodyGyroMean,gravityMean)
- angle(tBodyGyroJerkMean,gravityMean)
- angle(X,gravityMean)



# Clean Data

1. Read file `features.txt`, get feature names, and handle variable names: 

   replace "Acc" with "Accelerometer"

   replace "mean()" with "Mean"

   replace "std()" with "Std"

   replace "-" with ""

   replace first character "t" with "Time"

   replace first character "f" with "Frequency"

2. Select feature names that contain "Mean" or "Std", and store them in the variable `selected_features`

3. Load activity labels from file `activity_label.txt`, get labels name

4. Load `X` train dataset with function `read.csv` from file `X_train.txt`, and select data with column names in variable "selected_features"

5. Load `y` train dataset with function `read.csv` from file `y_train.txt`, and transform into activity labels name

6. Load `subject` train dataset with function `read.csv` from file `subject_train.txt`

7. Merge `X` train dataset、 `y` train dataset and `subject` train dataset with function `cbind`, store in the variable `train_data`

8. Load `X` test dataset with function `read.csv` from file `X_test.txt`, and select data with column names in variable "selected_features"

9. Load `y` test dataset with function `read.csv` from file `y_test.txt`, and transform into activity labels name

10. Load `subject` test dataset with function `read.csv` from file `subject_test.txt`

11. Merge `X` test dataset、 `y` test dataset and `subject` test dataset with function `cbind`, store in the variable `test_data`

12. Merge train dataset and test dataset, store in the variable `merge_data`

13. Compute the average of each variable group by `Subject` and `Activity`

14. Write dataset to file `tidy_data.csv`

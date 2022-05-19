# Download Data

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



# Variables

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features



# Clean Data

### 

1. Read file `features.txt`, get feature names, replace "()" with ""
2. Select feature names that contain "mean" or "std", and store in the variable `selected_features`
3. Load train dataset with function read.csv, and select data with column names in variable "selected_features"
4. Load test dataset with function read.csv, and select data with column names in variable "selected_features"
5. Merge train dataset and test dataset, store merge_data_set
6. Compute the average of each variable
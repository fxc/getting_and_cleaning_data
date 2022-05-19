# getting_and_cleaning_data

### Step 1

```R
source("run_analysis.R")
```



### Step 2

call function `tidy_ucr_har_data` with the following parameters:

1. train_path: training dataset file path
2. test_path: test dataset file path
3. features_path: the features file path

function `tidy_ucr_har_data` write dataset into file

1. merge_train_test_data.csv:  datasets that merge training dataset and test dataset
2. avg_data.csv: the average of each variable in the file "merge_train_test_data.csv"

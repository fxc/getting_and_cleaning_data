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

function `tidy_ucr_har_data` return a two elements list with name "merge_train_test_data" and "avg_data_set"

1. merge_train_test_data:  datasets that merge training dataset and test dataset
2. avg_data_set: the average of each variable in merge_train_test_data

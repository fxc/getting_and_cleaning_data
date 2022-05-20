library(stringr)
library("dplyr")

name_replace <- function(name){
  new_name <- name
  first_ch <- substr(name, 1, 1)
  if (first_ch == 't'){
    new_name <- paste0('Time', substr(name, 2, str_length(name)))
  }
  
  if (first_ch == 'f'){
    new_name <- paste0('Frequency', substr(name, 2, str_length(name)))
  }
  
  new_name
}

handle_variable_names <- function(var_name){
  #vn <- gsub("\\(\\)", "", var_name)
  vn <- gsub("Acc", "Accelerometer", var_name)
  vn <- gsub("mean\\(\\)", "Mean", vn)
  vn <- gsub("std\\(\\)", "Std", vn)
  vn <- gsub("-", "", vn)
  
  sapply(vn, name_replace)
  
}

tidy_ucr_har_data <- function(data_path){
  features_path <- paste0(data_path, "/features.txt")
  all_fetures <- read.csv(features_path, sep = " ", header = FALSE, col.names = c("loc", 'name'))
  #all_fetures_names <- gsub("\\(\\)", "", all_fetures$name)
  all_fetures_names <- handle_variable_names(all_fetures$name)
  selected_features <- grep("Mean|Std", all_fetures_names, value = TRUE)
  
  activity_label_path <- paste0(data_path, "/activity_labels.txt")
  activity_labels_data <- read.csv(activity_label_path, sep = " ", header = FALSE, col.names = c("index", "name"))
  activity_labels <- activity_labels_data$name
  #print(activity_labels)
  
  train_dataset_X_path <- paste0(data_path, "/train/X_train.txt")
  train_dataset_y_path <- paste0(data_path, "/train/y_train.txt")
  train_dateset_subject_path <- paste0(data_path, "/train/subject_train.txt")
  
  train_X <- read.csv(train_dataset_X_path, sep = "", header = FALSE, col.names = all_fetures_names, check.names = FALSE)
  train_X_select <- train_X[selected_features]
  rm(train_X)
  train_y <- read.csv(train_dataset_y_path, sep = "", header = FALSE, col.names = c('label'), check.names = FALSE)
  train_y <- mutate(train_y, Activity = activity_labels[train_y$label])
  train_y_select <- train_y[c('Activity')]

  train_subject <- read.csv(train_dateset_subject_path, sep = "", header = FALSE, col.names = c('Subject'), check.names = FALSE)
  
  train_data <- cbind(train_subject, train_y_select)
  train_data <- cbind(train_data, train_X_select)
  
  test_dataset_X_path <- paste0(data_path, "/test/X_test.txt")
  test_dataset_y_path <- paste0(data_path, "/test/y_test.txt")
  test_dataset_subject_path <- paste0(data_path, "/test/subject_test.txt")
  
  test_X <- read.csv(test_dataset_X_path, sep = "", header = FALSE, col.names = all_fetures_names, check.names = FALSE)
  test_X_select <- test_X[selected_features]
  rm(test_X)
  test_y <- read.csv(test_dataset_y_path, sep = "", header = FALSE, col.names = c('label'), check.names = FALSE)
  test_y <- mutate(test_y, Activity = activity_labels[test_y$label])
  test_y_select <- test_y[c('Activity')]
  
  test_subject <- read.csv(test_dataset_subject_path, sep = "", header = FALSE, col.names = c('Subject'), check.names = FALSE)
  
  test_data <- cbind(test_subject, test_y_select)
  test_data <- cbind(test_data, test_X_select)
  
  print(nrow(train_data))
  print(nrow(test_data))
  
  merge_data <- rbind(train_data, test_data)
  print(names(merge_data))
  print(nrow(merge_data))
  avg_merge_data <- aggregate(. ~ Subject + Activity, data = merge_data, mean)
  write.table(avg_merge_data, file = "tidy_data.csv", sep = ",", row.names = FALSE)
  
  
}


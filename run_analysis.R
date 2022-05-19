
tidy_ucr_har_data <- function(train_path, test_path, features_path){
  all_fetures <- read.csv(features_path, sep = " ", header = FALSE, col.names = c("loc", 'name'))
  all_fetures_names <- gsub("\\(\\)", "", all_fetures$name)
  selected_features <- grep("mean|std", all_fetures_names, value = TRUE)
  #print(selected_features)
  train_dataset <- read.csv(train_path, sep = "", header = FALSE, col.names = all_fetures_names, check.names = FALSE)
  sel_train_dataset <- train_dataset[selected_features]

  rm(train_dataset)
  
  test_dataset <- read.csv(test_path, sep = "", header = FALSE, col.names = all_fetures_names, check.names = FALSE)
  sel_test_dataset <- test_dataset[selected_features]
  rm(test_dataset)
  
  merge_data_set <- rbind(sel_train_dataset, sel_test_dataset)
  
  avg_data <- lapply(merge_data_set, mean)
  #list('merge_train_test_data' = merge_data_set, 'avg_data_set' = avg_data)
  write.table(merge_data_set, file = "merge_train_test_data.csv", sep = ",", row.names = FALSE)
  write.table(avg_data, file = "avg_data.csv", sep = ",", row.names = FALSE)
}


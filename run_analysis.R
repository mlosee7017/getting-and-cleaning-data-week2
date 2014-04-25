# Read in all data files

activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")
subject_test <- read.table("test/subject_test.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

#Re-Label All Columns of x_test and x_train

colnames(x_test) <- features[,2]
colnames(x_train) <- features[,2]

#Merge the class labels with their activity labels

y_test_activity_labels <- merge(y_test,activity_labels,by="V1")
y_train_activity_labels <- merge(y_train,activity_labels,by="V1")

#Bind the data labels to the data sets

tidy_x_test <- cbind(Activity = y_test_activity_labels$V2,x_test)
tidy_x_train <- cbind(Activity = y_train_activity_labels$V2,x_train)
tidy_x_test <- cbind(Subject = subject_test$V1, tidy_x_test)
tidy_x_train <- cbind(Subject = subject_train$V1, tidy_x_train)

#Merge the training and test datasets

tidy_x <- rbind(tidy_x_test,tidy_x_train)

#Extract only the mean and standard deviation measurements 

s <- grep("std()",colnames(tidy_x))
m <- grep("mean()",colnames(tidy_x))
tidy_x_col_select <- tidy_x[,c(1,2,m,s)]

#Create a tidy data set with the average of each variable by activity and subject

tidy_x_final <- aggregate(. ~ Subject+Activity,tidy_x_col_select,mean)

#Export the data

write.table(tidy_x_final, file="./tidy_data.txt", sep="\t", row.names=FALSE)

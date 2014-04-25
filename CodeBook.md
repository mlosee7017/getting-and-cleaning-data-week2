Code book
=========

## Read in all data files

### The first step reads in all files separately into the following variables

	*activity_labels 
	*features 
	*subject_test 
	*x_test 
	*y_test
	*subject_train 
	*x_train
	*y_train
	
### Next I used the data in the features text file to update the column names of the x_test and x_train datasets

### Then I merged the class labels with their activity labels into new variables named
	
	* y_test_activity_labels
	* y_train_activity_labels
	
### Then using cbind() I added the activity labels to the main datasets stored in these new variables

	* tidy_x_test
	* tidy_x_train

### Then I merged these new variables into one master

	* tidy_x
	
### Next I used the grep() function to find those columns with averages and standard deviations in them

### Then aggregated the values in those columns with aggregate() into a new final variable called
	
	* tidy_x_final
	
### And exported the file



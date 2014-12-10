## Course Project For Getting and Cleaning Data

### Aim

The aim of this exercise to learn the data loading, cleaning and reshaping process on the unclean data set.

### Data
The information of the data can be found inside the data folder attach here.
The training and testing data set are the extracted version of the original data-set.
You can download the original dataset from the repository : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Script

The project scripts contains the code of five different tasks asked as part of the project assignment.

## Course Project Script : Getting and Cleaning Data

* Part 1
  Merges the training and the test sets to create one data set.

	Loaded the data with the custom made function getData() 
	It takes filename, column classes and line seperator as arguments to load files
	To load train and test data : The separate variables are created to load train, subject and activity data.
  And after the column bind using cbind() function, the row bind is performed using rbind() function to get the unite dataset.	
	Also the column names have been assigned from the data retrieved from the features.txt file
		
* Part 2
  Extracts only the measurements on the mean and standard deviation for each measurement. 
	
	Extracted the mean() and std() variables from the united dataset using grep command

* Part 3
  Uses descriptive activity names to name the activities in the data set
		
	Merge the activity actual names from activity_labels.txt file to the numeric activity variables in the united dataset.
	merge() function is used to perform the above task and then removed the numeric activity column.
  Renamed the nominal activity column with the column name = "activity"


* Part 4
  Appropriately labels the data set with descriptive activity names.
	
	Removed the camel casing from the column headers using gsub() function
	Also removed all the '-' and open brackets from the column names and replaced it with dot separators 


* Part 5
  Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
	
	Used the reshape2 library to melt the data based on id variable subject and activity labels.
	Peformed the average operation on variables by each subject and each activity using dcast() function
	Wrote the result into the "tidy_data.csv" file.


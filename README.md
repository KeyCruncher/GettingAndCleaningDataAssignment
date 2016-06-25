# Getting and Cleaning Data Assignment

This is the Cousera getting and cleaning data course project. The R script, run_analysis.R, executes the following actions:

1. Downloads the dataset if it does already exsist in the working directory
2. Loads the activity and feature information
3. Loads both the training and test datasets, while keeping only the coloumns that have a mean or standard deviation
4. Gets the activity and subject data from each dataset and merges the coloumns with the dataset
5. Merges the datasets
6. Converts the acitivity and subject columns into factors
7. Creates a tidy datasetthat consists of the average/mean value of each variable for each subject and activity pair

Finally, the results will be shown in the file called tidyDataSet.txt

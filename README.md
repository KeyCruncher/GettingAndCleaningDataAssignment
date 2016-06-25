# Getting and Cleaning Data Assignment

Data description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This is the Cousera getting and cleaning data course project. The R script, run_analysis.R, executes the following actions:

1. Installs the dependencies that might be missing for the srcipt to work
2. Downloads the dataset if it does already exsist in the working directory
3. Unzips the file 
4. Loads the activity and feature information from the files
5. Loads both the training and test datasets, while keeping only the coloumns that have a mean or standard deviation
6. Gets the activity and subject data from each dataset and merges the coloumns with the dataset
7. Merges the datasets
8. Converts the acitivity and subject columns into factors
9. Creates a tidy dataset that consists of the average/mean value of each variable for each subject and activity pair
10. Finally, the results will be saved in the file called tidyDataSet.txt

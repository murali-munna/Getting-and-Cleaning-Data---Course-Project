# Getting-and-Cleaning-Data-Course-Project

This repository contains the project for Coursera course "Getting and Cleaning Data".

The data is available at the UCI Machine Learning Repository at the following link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The codebook.md describes the variables and data used to run the analysis.

The script "run_analysis.R" will extract and perform the following analysis in the given order

1. Creates a working directory. Downloads the data and unzip the files.

2. Reads the activity, subjects and features data from both training and testing sets.

3. Merges the training and testing data of these 3 variables.

4. Extracts the column lables from features.txt and labels the features data. More information on features can be found on features_info.txt.

5. Combines the data to form a complete dataset.

6. Extract th freatures which includes only the mean and standard deviation features.

7. Converts the activity names into factors and uses descriptive activity names.

8. Uses descriptive variable names for features

9. Creates a tidy data set of averaged variables grouped by subject and activity.

10. The averaged data is uploaded as tidydata.txt

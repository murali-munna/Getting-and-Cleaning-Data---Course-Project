# CodeBook

The codebook contains the information on data and variables used for analysis.

# Overview

The database is build from the recordings of 30 subjects performing activities while carrying a smartphone with embedded inertial sensors.

Each subject performed six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

# Variables

The features are different variables measured from the 3-axial accelerometer and gyroscope. The data also containd various statistical estimates for these features such as mean, sd etc.

```X_train```, ```X_test``` : Contains data of all the feature variables

```subject_train```, ```subject_test``` : Contains the data of different subjects as numeric variables

```Y_train```, ```Y_test``` : Contains the various activities performed

# Transformed Variables

```ActivityTrain```, ```ActivityTest```, ```SubjectTrain```, ```SubjectTest```, ```FeaturesTrain```, ```FeaturesTest``` : Data from ```Y_train```, ```Y_test```, ```subject_train```, ```subject_test```, ```features_train```, ```features_test```respectively.

```Activity```, ```Subject```, ```Features``` : Contains the merged data using ```rbind()``` function.

CombinedData : Contains the final data frame build using ```cbind()``` function.

```meanSdFeaturesNames```: Extrated feature names using ```grep()```

```activityLabels``` : contains the 6 different attributes

```GroupedData``` : Second tidy data averaging the variables grouped by subject and activity using the ```aggregate()``` function.










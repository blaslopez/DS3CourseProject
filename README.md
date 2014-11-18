## Contents

The files in this package are:

+ **base_dir.R** contains the source of the *base_dir* function which is a helped to download (if needed) and locate the original dataset of *Human Activity Recognition Using Smartphones Dataset*
+ **run_analisys.R** is the script that constructs the final dataset
+ **CodeBook.md** explains how the original dataset is transformed and the variables of the result dataset
+ **courseproject.txt** a sample output file
+ **README.md** this readme file

## The script

### Dependencies
These scripts requires the packages:

+ dplyr
+ reshape2


### Installation
+ Copy the **base_dir.R** and **run_analysis.R** to any directory.

### Running
+ Execute the **run_analysis.R** script in your R environment
        source("run_analysis.R")
+ The script ask form download the original dataset from the *Human Activity Recognition Using Smartphones Dataset* URL
- Type "Y" for download. The dataset will be downloaded and unziped in a directory called "UCI HAR Dataset"
- Type "N" if you have the data set in your computer. You will be asked for the directory where you have the dataset (with the original directory structure!!!). Windows user: remember to provide the directory name with double backslash (\\)
- Type "C" for cancel the process
        
The script will be show message for each step and, finally, will print the name of the file containing the data

## From the original dataset

### License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


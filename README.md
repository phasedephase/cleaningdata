cleaningdata
============

ProjectTidy

The script should be run from a working directory that containst all the *.txt 
files with the data.  Basically, the script reads in all the required
data files, stores them in data frames and merges all the data frames into
one.  Further manipulation ensues as per the assignment's request: namely, once 
all the files have been joined with subjects and activities as the first two 
columns, the script then proceeds to subset this master table and creates 
a new table with only the subjectID, activityID, and all the *-mean()- and
*-std()* variables.  Finally, the activity numeric codes are replaced by 
their equivalent English version as per the features.txt file key. And as a last
step, all the means across all subjects and activities are selected and stored
in a new subset table.
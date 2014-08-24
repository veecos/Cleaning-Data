README

=================

Prepared by Vignesh Mani M

**NOTE:** Please ensure that your files are in the R working directory or kindly modify the code in the # Reading Data into R part for the code to work

This Readme is divided into multiple sections like the code

# Section 1: Reading Data into R

All the data files are read into R using the read.table() command. Sometimes the read data is printed and dimensions are checked for sanity using the dim() , names() and head() command. This is purely for debugging purposes only. The names of the variables and the corresponding files are given below,

Variable – FileName

train – X\_train.txt ( contains the main data set of training data )

test – X\_test.txt ( contains the main data set of test data )

train\_act – Y\_train.txt ( contains activity data )

test\_act – Y\_test.txt ( contains activity data )

feat – features.txt ( contains feature/column names )

train\_sub – subject\_train.txt ( contains subject data )

test\_sub – subject\_test.txt ( contains subject data )

act\_lab – activity\_labels.txt ( contains activity labels )

# Section 2: Merging of Train and Test Sets

Initially the training dataset is combined with the activity data as well as the subject data with the cbind command to create the variable train1. The same is done for the test set to create variable test1. Now the column names are added for the new columns added namely "Activity" and " Subject"

The two data sets have the same names and this is ensured by looking at the output of the intersect(names()) function. Then merge is done ensuring all columns are the same and the output is stored in the variable a.

Now the column names are renamed from the feat variable whose second column contains all the names. As two new columns have been added, their names are given as "Activity" and "Subject" again.

# Section 3: Selecting Relevant Features

The project asks us to select features/columns which are of mean/standard deviation measure only. For this I have gone with the method of selecting the feature if it has the word mean/std in its name.

For this the grep function has been used with the ignore.case set to TRUE to ensure it matches regardless of case. This is run on the column names used in the last step( second column of feat variable ). The column numbers are obtained in a second variable feat2. Only these columns are selected along with 562 and 563 which are the added columns containing activity and subject details. This is done via subsetting and the result is stored in the variable a2. On manual inspection it seemed to have selected columns which contained an angle between two vectors. These have been removed too ( columns 80 to 86 ). The final list of column names are printed.

# Section 4: Name Cleaning

The names of the columns have been cleaned and modified to help them describe the variables better. They have all been made to lower case by using the tolower() function. "-" has been removed.

Also the character t and f have been expanded to time and FFT wherever they appear in the beginning of the name as they represent the signal in time and Frequency domain ( I am a signals major and thought this made interpretation easier because they are both different domains though one is just a transform of another)

I have also removed brackets "()" wherever they appeared in the names. The entire step is carried out with intermediate variable (var.names) and then this is applied to the colnames() function. The final names are printed again.

# Section 5: Summarizing

Here the mean / average is calculated for all possible combinations of activity and subject. This is done by using the aggregate command and the output is stored in the variable agg. As the aggregate command would duplicate activity and subject if the entire dataset is given and also throw warnings , the columns with activity and subject have been excluded.

The columns are again created by the agg() function. This is checked by the dim() function. The column names of activity and subject are again entered as the names are different in the final output. This is for interpretation purposes only. Head() function helps us to view the final dataset.

Finally the entire dataset is outputted to a text file using the write.table() function with the row.names set to be FALSE as instructed.

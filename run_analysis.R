# Reading Data into R
train = read.table("X_train.txt")
dim(train)
names(train)
head(train,n=3)
test = read.table("X_test.txt")
names(test)
train_act = read.table("y_train.txt")
test_act = read.table("y_test.txt")
feat = read.table("features.txt")
head(feat)
train_sub = read.table("subject_train.txt")
test_sub = read.table("subject_test.txt")
act_lab = read.table("activity_labels.txt")

#Adding Activity Label and subject data to respective data sets
train1=cbind(train,train_act,train_sub)
colnames(train1)[562] = "Activity"
colnames(train1)[563] = "Subject"
test1=cbind(test,test_act,test_sub)
colnames(test1)[562] = "Activity"
colnames(test1)[563] = "Subject"

#Merging the two datasets
intersect(names(train1),names(test1))
a=merge(train1,test1,all=TRUE)

#Changing column names to meaningful ones
colnames(a)=feat$V2
colnames(a)[562] = "Activity"
colnames(a)[563] = "Subject"


#Finding which features are of Mean or Standard deviation
feat2 = feat[grep("mean|std", ignore.case=TRUE,feat$V2),]

# Selecting only relevant columns
a2= a[,c(feat2$V1,562,563)]
a2=a2[ -c(80:86) ]
names(a2)

# Changing activity numbers to names
a2$Activity=as.factor(a2$Activity)
levels(a2$Activity) = act_lab$V2

#Cleaning Names of Columns
var.names = tolower(colnames(a2))
colnames(a2) = var.names
var.names = sub("-"," ",colnames(a2))
colnames(a2) = var.names
var.names = sub("^t","time ",colnames(a2))
colnames(a2) = var.names
var.names = sub("^f","fft ",colnames(a2))
colnames(a2) = var.names
var.names = gsub("\\(\\)", "",colnames(a2))
colnames(a2) = var.names
names(a2)

#Calculating averages for each activity and subject
agg = aggregate(a2[1:79],by=list(a2$activity,a2$subject),FUN = mean)
dim(agg)
colnames(agg)[1] = " Activity "
colnames(agg)[2] = " Subject "
head(agg)

#Outputting to a table
write.table(agg,"vigout.txt",row.names=FALSE)


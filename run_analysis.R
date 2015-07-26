# download the dataset file from internet.
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","Dataset.zip","curl")
if(!file.exists("Dataset.zip")){
    stop("Download dataset file from internet failed,please check you network and try again later.")
}


# unzip the dataset file to directory "./dataset"
unzip("Dataset.zip")


# Merges the training and the test sets to create one data set
X_traintable <- read.table("UCI HAR Dataset/train/X_train.txt")
X_testtable <- read.table("UCI HAR Dataset/test/X_test.txt")
mergedtable <- merge(X_traintable,X_testtable,sort = FALSE,all = TRUE)


## function to find whether string contains substring
containstring <- function(string,substring){
    length(grep(substring,string,fixed = TRUE)) != 0
}

# Extracts only the measurements on the mean and standard deviation for each measurement
featurestable <- read.table("UCI HAR Dataset/features.txt")
featureslogic <- vector("logical",nrow(featurestable))
features <- featurestable$V2
for(i in 1:nrow(featurestable)){
    featureslogic[i] <- containstring(features[i],"mean()") | containstring(features[i],"std()")
}
extractfeatures <- featurestable[(featureslogic),]
extractdata <- mergedtable[,extractfeatures[,1]]


# Uses descriptive activity names to name the activities in the data set
activitytable <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activitytable) <- c("activity_code","activity")

Y_traintable <- read.table("UCI HAR Dataset/train/y_train.txt")
Y_testtable <- read.table("UCI HAR Dataset/test/y_test.txt")
Y <- c(Y_traintable[,1],Y_testtable[,1])
activitydata <- cbind("activity_code"=Y,extractdata)
activity <- merge(activitytable,activitydata)


# Appropriately labels the data set with descriptive variable names. 
featurenames <- as.vector(extractfeatures[,2])
colnames(activity) <- c("activity_code","activity",featurenames)


# the average of each variable for each activity and each subject
matrixdata <- as.matrix(activity[,c(1,3:ncol(activity))])
meandata <- NULL
for(i in 2:ncol(matrixdata)){
    colmeandata <- sapply(split(matrixdata[,i],matrixdata[,1]),mean)
    meandata <- cbind(meandata,colmeandata)
}

write.table(meandata,"averageresult.txt",row.names=FALSE,col.names = FALSE)









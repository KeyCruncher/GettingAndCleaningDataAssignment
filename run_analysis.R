# Loads the needed libraries
library(reshape2)

# Sets the file name
fileName <- "getdata_dataset.zip"

# Downloads and unzips the dataset, if it does not exsist
if (!file.exists(fileName))
{
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, fileName, method="curl")
}

if (!file.exists("UCI HAR Dataset")) 
{ 
  unzip(fileName) 
}

# Loads activity labels and features from the files
actLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
actLabels[,2] <- as.character(actLabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Extracts the mean and standard deviation from the features data
wantedFeatures <- grep(".*mean.*|.*std.*", features[,2])
wantedFeatures.names <- features[wantedFeatures,2]
wantedFeatures.names = gsub('-mean', 'Mean', wantedFeatures.names)
wantedFeatures.names = gsub('-std', 'Std', wantedFeatures.names)
wantedFeatures.names <- gsub('[-()]', '', wantedFeatures.names)


# Loads the datasets into memory
train <- read.table("UCI HAR Dataset/train/X_train.txt")[wantedFeatures]
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)
test <- read.table("UCI HAR Dataset/test/X_test.txt")[wantedFeatures]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

# Merges datasets and adds labels
all <- rbind(train, test)
colnames(allData) <- c("subject", "activity", wantedFeatures.names)

# Turns activities and subjects into factors
all$activity <- factor(all$activity, levels = actLabels[,1], labels = actLabels[,2])
all$subject <- as.factor(all$subject)
all.melted <- melt(all, id = c("subject", "activity"))
all.mean <- dcast(all.melted, subject + activity ~ variable, mean)

# Saves the data to the tidyDataSet file
write.table(all.mean, "tidyDataSet.txt", row.names = FALSE, quote = FALSE)

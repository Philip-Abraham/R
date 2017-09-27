if(!file.exists("./data")){dir.create("./cam")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./cam/cameras.csv")
cameraData <- read.csv("./cam/cameras.csv")
names(cameraData)

# Fixing character vectors - tolower()
tolower(names(cameraData))

# Fixing character vectors - strsplit()
# Good for automatically splitting variable names
# Important parameters: x, split
splitNames = strsplit(names(cameraData),"\\.")
splitNames[[6]]

# Fixing character vectors - sapply()
# Applies a function to each element in a vector or list
# Important parameters: X,FUN
firstElement <- function(x){x[1]}
sapply(splitNames,firstElement)

# Fixing character vectors - sub()
names(reviews)
head(reviews,2)
# remove "_" character
sub("_","",names(reviews))

testName <- "this_is_a_test"
sub("_","",testName) ## removes one character "_"

# Fixing character vectors - gsub() - Removes multiple characters
gsub("_","",testName)

fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile="./reviews.csv")
download.file(fileUrl2,destfile="./solutions.csv")
reviews <- read.csv("./reviews.csv"); solutions <- read.csv("./solutions.csv")

# Finding values - grep(),grepl() - Searching for values in variable names
grep("Alameda",cameraData$intersection) ## find all instances of "Alameda"

table(grepl("Alameda",cameraData$intersection)) # ## make table of all instances of "Alameda" -True or False

cameraData2 <- cameraData[!grepl("Alameda",cameraData$intersection),] # subsetting to find where "Alameda does not appear

# More on grep() - to see if a particular value appears
grep("Alameda",cameraData$intersection,value=TRUE)
grep("JeffStreet",cameraData$intersection)
length(grep("JeffStreet",cameraData$intersection))

# More useful string functions
library(stringr)
nchar("Jeffrey Leek") # counts number of characters in string
substr("Jeffrey Leek",1,7) # extracts 1st to the 7th characters of the string
paste("Jeffrey","Leek") # combines the two strings
paste0("Jeffrey","Leek") # combines the two strings with no space
str_trim("Jeff      ")

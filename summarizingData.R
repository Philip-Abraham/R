# Getting the data from the web
if(!file.exists("./rest")){dir.create("./rest")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./rest/restaurants.csv")
restData <- read.csv("./rest/restaurants.csv")
summary(restData)
str(restData)

#Quantiles of quantitative variables
quantile(restData$councilDistrict,na.rm=TRUE)
quantile(restData$councilDistrict,probs=c(0.5,0.75,0.9))

#Make table
table(restData$zipCode,useNA="ifany")

# Make two dimensional table
table(restData$councilDistrict,restData$zipCode)

# Many ways to check for missing values
sum(is.na(restData$councilDistrict))

any(is.na(restData$councilDistrict))

all(restData$zipCode > 0)

# Row and column sums
colSums(is.na(restData))

all(colSums(is.na(restData))==0)

# Values with specific characteristics
restData[restData$zipCode %in% c("21212","21213"),]

# Cross tabs
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs(Freq ~ Gender + Admit,data=DF)
xt

# Flat tables
warpbreaks$replicate <- rep(1:9, len = 54)
xt = xtabs(breaks ~.,data=warpbreaks)
xt

# Flat tables
ftable(xt)

# Size of a data set
fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData),units="Mb")
## CSV File - Download ACS data from web
if(!file.exists("ACS")){dir.create("ACS")}

fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurl, destfile= "ACS/ss06hid.csv")
dateDownloaded <- date()

acs<-read.csv("./ACS/ss06hid.csv")

# Apply strsplit() to split all the names of the data frame on the characters "wgtp". 
# What is the value of the 123 element of the resulting list?
splitNames_wgtp = strsplit(names(acs),"wgtp")
splitNames_wgtp[123]

############################################################################
# Load the Gross Domestic Product data for the 190 ranked countries

library(dplyr)
if(!file.exists("./country")){dir.create("./country")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl,destfile="./country/getdata%2Fdata%2FGDP.csv")
countryData <- read.csv("./country/getdata%2Fdata%2FGDP.csv", header = FALSE, stringsAsFactors = FALSE)
summary(countryData)
str(countryData)

# Clean Data to select for 190 ranked countries
countryData_clean1<-countryData[6:195,c("V1","V2","V4","V5")]
names(countryData_clean1) <- c("CountryCode", "GDPrank","countryNames","GDP")
countryData_clean1<-tbl_df(countryData_clean1) ## using the dplyr function command tbl_df

# Remove the commas from the GDP numbers in millions of dollars and average them. What is the average?
library(eeptools)
GDP_Avg <-decomma(countryData_clean1$GDP)
# Convert GDP_Avg to dataframe
GDP_Avg_df<-data.frame(GDP_Avg)
GDP_Avg_df<-tbl_df(GDP_Avg_df)
colnames(GDP_Avg_df)<-"GDPnum"

# Merge the GDP_Avg_df to countryData_clean1 and remove original GDP column with comma from data frame
countryData_clean1_m <-cbind(countryData_clean1, GDP_Avg_df)
countryData_clean1_m <- countryData_clean1_m[,c(1,2,3,5)]

# Average of GDP
Average_GDP<-mean(countryData_clean1_m$GDPnum)
Average_GDP

# What is a regular expression that would allow you to count the number of countries whose 
# name begins with "United"?
united_begin<-countryData_clean1_m[grep("^United", countryData_clean1_m$countryNames),]

# Load the educational data from this data set:
# Load the educational data from this data set
if(!file.exists("./edu")){dir.create("./edu")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl,destfile="./edu/getdata%2Fdata%2FEDSTATS_Country.csv")
eduData <- read.csv("./edu/getdata%2Fdata%2FEDSTATS_Country.csv")
summary(eduData)
str(eduData)
eduData<-tbl_df(eduData) ## using the dplyr function command tbl_df


### Match the data based on the country shortcode. 

# Test to see if country ID's match in both datasets
countryData_clean1_ID<-select(countryData_clean1, CountryCode, countryNames)
countryData_clean1_ID<-arrange(countryData_clean1_ID, CountryCode)
eduData_ID<-select(eduData, CountryCode, Table.Name)

zz <- merge(countryData_clean1_ID, eduData_ID)
zz[is.na(zz)] <- 0

# Merge countryData_clean1 and eduData
merged_df <- merge(x=countryData_clean1, y=eduData, by.x="CountryCode", by.y="CountryCode", all.x = FALSE)
names(merged_df)

### Of the countries for which the end of the fiscal year is available, how many end in June?
Fiscal_June <- merged_df[grep("June 30", merged_df$Special.Notes),]
count(Fiscal_June)

#############################################################################################

# You can use the quantmod (http://www.quantmod.com/) package to get historical stock prices for 
# publicly traded companies on the NASDAQ and NYSE. Use the following code to download data on 
# Amazon's stock price and get the times the data was sampled.

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

# How many values were collected in 2012? 
length(grep("^2012", sampleTimes))

# How many values were collected on Mondays in 2012?
SampleTimes_formated <- format(sampleTimes, "%A %Y")
length(grep("Monday 2012",  SampleTimes_formated))

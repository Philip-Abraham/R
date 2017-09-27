# Load the Gross Domestic Product data for the 190 ranked countries

library(dplyr)
if(!file.exists("./country")){dir.create("./country")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl,destfile="./country/getdata%2Fdata%2FGDP.csv")
countryData <- read.csv("./country/getdata%2Fdata%2FGDP.csv", header = FALSE, stringsAsFactors = FALSE)
summary(countryData)
str(countryData)

# Clean Data
countryData_clean1<-countryData[6:195,c("V1","V2","V4","V5")]
names(countryData_clean1) <- c("CountryCode", "GDPrank","Table.Name","GDP")
countryData_clean1<-tbl_df(countryData_clean1) ## using the dplyr function command tbl_df

# Load the educational data from this data set
if(!file.exists("./edu")){dir.create("./edu")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl,destfile="./edu/getdata%2Fdata%2FEDSTATS_Country.csv")
eduData <- read.csv("./edu/getdata%2Fdata%2FEDSTATS_Country.csv")
summary(eduData)
str(eduData)
eduData<-tbl_df(eduData) ## using the dplyr function command tbl_df

# Test to see if country ID's match in both datasets
countryData_clean1_ID<-select(countryData_clean1, CountryCode, Table.Name)
countryData_clean1_ID<-arrange(countryData_clean1_ID, CountryCode)
eduData_ID<-select(eduData, CountryCode, Table.Name)

zz <- merge(countryData_clean1_ID, eduData_ID)
zz[is.na(zz)] <- 0

# Merge countryData_clean1 and eduData
merged_df <- merge(x=countryData_clean1, y=eduData, by.x="CountryCode", by.y="CountryCode", all.x = FALSE)

merged_df <- transform(merged_df, GDPrank = as.numeric(GDPrank))

names(merged_df)

# Sort the data frame - merged_df= in descending order by GDP rank (so United States is last). 
# What is the 13th country in the resulting data frame?
merged_df_sort <- arrange(merged_df, desc(GDPrank))

# What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?
library(plyr); library(dplyr)
ddply(merged_df,.(Income.Group),summarize,avg_GDPRNK=mean(GDPrank))

# Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. 
# How many countries are Lower middle income but among the 38 nations with highest GDP?
library(dplyr)
merged_df_sort<-tbl_df(merged_df_sort)
top_gdp <- filter(merged_df_sort, GDPrank <= 38)
top_gdp <- transform(top_gdp, Income.Group = as.character(Income.Group))
by_income<-group_by(top_gdp,Income.Group)
table(by_income$Income.Group)

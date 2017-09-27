######Import flat files from the web

setwd("C:\\Users\\Philip Abraham\\OneDrive\\TECHNOLOGY\\Data Analysis\\Data")
if(!file.exists("datacamp_web")){dir.create("datacamp_web")}

library(readr)

# http (Unsecure) URL to the swimming_pools csv file.
url_csv <- "http://s3.amazonaws.com/assets.datacamp.com/course/importing_data_into_r/swimming_pools.csv"
download.file(url_csv, destfile= "datacamp_web/swimming_pools.csv")
dateDownloaded <- date()

pools<-read_csv("./datacamp_web/swimming_pools.csv", col_names = TRUE)

# Import the txt file: potatoes
url_delim <- "http://s3.amazonaws.com/assets.datacamp.com/course/importing_data_into_r/potatoes.txt"
download.file(url_delim, destfile= "datacamp_web/potatoes.txt")
dateDownloaded <- date()

potatoes<-read_tsv("./datacamp_web/potatoes.txt", col_names = TRUE)


# https (Secure) URL to the swimming_pools csv file.
url_csv <- "https://s3.amazonaws.com/assets.datacamp.com/course/importing_data_into_r/swimming_pools.csv"
download.file(url_csv, destfile= "datacamp_web/swimming_pools.csv")
dateDownloaded <- date()

# Import the file using read.csv(): pools1
pools1<-read.csv("./datacamp_web/swimming_pools.csv", header  = TRUE)

# Load the readr package
library(readr)

# Import the file using read_csv(): pools2
pools2<-read_csv("./datacamp_web/swimming_pools.csv", col_names = TRUE)

# Print the structure of pools1 and pools2
str(pools1)
str(pools2)


#####Import Excel files from the web

## Use gdata package
# Import the .xls file located at the URL url_xls.
url_xls <- "http://s3.amazonaws.com/assets.datacamp.com/course/importing_data_into_r/latitude.xls"

# Show file path to perl program so that read.xls() can be used in the gdata package.
perl <- "C:/Strawberry/perl/bin/perl5.24.0.exe"

# Using read.xls() from gdata,store the resulting data frame as excel_gdata.
library(gdata)
excel_gdata<-read.xls(url_xls, perl="perl")


## Use read_excel() package......Only available in R version 3.25 and above

# Use download.file() to download the .xls file behind the URL and store it locally as "local_latitude.xls". 

if(!file.exists("lat")){dir.create("lat")}

fileurl<-"http://s3.amazonaws.com/assets.datacamp.com/course/importing_data_into_r/latitude.xls"
download.file(fileurl, destfile= "./lat/local_latitude.xls",mode='wb',method='libcurl')

# Call read_excel() to import the local file, "local_latitude.xls". Name the resulting data frame excel_readxl
library(readxl)

#Get the the names of all the sheets in the spreadsheet
excel_sheets("./lat/local_latitude.xls")

# Save Sheet#1 of spreadsheet in excel_readxl_1
excel_readxl_1<-read_excel("./lat/local_latitude.xls",sheet = 1, col_names = TRUE)

# Save Sheet#2 of spreadsheet in excel_readxl_2
excel_readxl_2<-read_excel("./lat/local_latitude.xls",sheet = 2, col_names = TRUE)


## Downloading Rdata files

# https URL to the wine RData file.
url_rdata <- "https://s3.amazonaws.com/assets.datacamp.com/course/importing_data_into_r/wine.RData"

# Download the file at url_rdata using download.file(). Call the file "wine_local.RData".
download.file(url_rdata, destfile= "./wine_local.RData")

# Load the wine data into your workspace using load()
load("wine_local.RData")

# Print out the summary of the wine data
summary(wine)


## Downloading HTTP using httr package

# Load the httr package
library(httr)

# Get the url, save response to resp
url <- "http://www.example.com/"
resp<-GET(url)

# Print resp
resp

# Get the content of resp using content() and set the as argument to raw. 
# Assign the resulting vector to raw_content.
raw_content<-content(resp, as = "raw")

#Example 2 with JSON format
# Get the url
url <- "https://www.omdbapi.com/?t=Annie+Hall&y=&plot=short&r=json"
resp<-GET(url)
# Print resp
resp

# Print content of resp as text
content(resp, as = "text")

# Print content of resp - that httr converts the JSON response body automatically to an R list 
content(resp)


## From JSON to R - converting JSON to R with fromJSON()

# Load the jsonlite package
library(jsonlite)

# wine_json represents a JSON. Use fromJSON() to convert it to a list, named wine.
wine_json <- '{"name":"Chateau Migraine", "year":1997, "alcohol_pct":12.4, "color":"red", "awarded":false}'
wine<-fromJSON(wine_json)

# Quandl provides an API to get financial and economical data. quandl_url represents a URL. 
# Import JSON data directly from the web
quandl_url <- "http://www.quandl.com/api/v1/datasets/IWS/INTERNET_INDIA.json?auth_token=i83asDsiWUUyfoypkgMz"
# Use fromJSON() directly on this URL and store the result in quandl_data.
quandl_data <- fromJSON(quandl_url)

# Print structure of wine and quandl_data
str(wine)
str(quandl_data)

# Example 2 - different JSON data structures will lead to different data structures in R.
#call fromJSON() on json1
json1 <- '[1, 2, 3, 4, 5, 6]'
fromJSON(json1)

#call fromJSON() on json2
json2 <- '{"a": [1, 2, 3], "b": [4,5,6]}'
fromJSON(json2)

#Call fromJSON() on json3
json3 <- '[[1, 2], [3, 4]]'
fromJSON(json3)

#Call fromJSON() on json4
json4 <- '[{"a": 1, "b": 2}, {"a": 3, "b": 4}, {"a": 5, "b": 6}]'
fromJSON(json4)


# Example 3 - Import URLs with fromJSON()

# Definition of the URLs
url_sw4 <- "http://www.omdbapi.com/?i=tt0076759&r=json"
url_sw3 <- "http://www.omdbapi.com/?i=tt0121766&r=json"

# Import two URLs with fromJSON(): sw4 and sw3
sw4 <- fromJSON(url_sw4)
sw3 <- fromJSON(url_sw3)

# Print out the Title element of both lists
sw4$Title
sw3$Title

# Is the release year of sw4 later than sw3?
sw4$Year> sw3$Year ##The fourth episode of the Star Wars saga was released before the third one!


## From R to JSON - using toJSON() to convert R data to a JSON format.

library(utils)

# URL pointing to the .csv file
url_csv <- "http://s3.amazonaws.com/assets.datacamp.com/course/importing_data_into_r/water.csv"

# Import the .csv file located at url_csv
water <-read.table(url_csv, header = TRUE, sep = ",", stringsAsFactors = FALSE)

# Convert the data frame water to a JSON. Call the resulting object water_json
water_json <- toJSON(water)

# Print out water_json
water_json #As you can see, the JSON you printed out isn't easy to read.


## JSON - Minify and prettify

# Convert the mtcars dataset, which is available in R by default, to a pretty JSON. 
# Call the resulting JSON pretty_json.
pretty_json <- prettify(toJSON(mtcars, pretty = TRUE))

# Print pretty_json
pretty_json

# Minify pretty_json: mini_json
mini_json <- minify(pretty_json)

# Print mini_json
mini_json

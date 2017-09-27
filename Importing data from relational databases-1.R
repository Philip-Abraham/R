# Load the DBI and RMySQL packages
library(DBI)
library(RMySQL)


## Step 1: Establish a connection
# Every time you connect to a database using dbConnect(), you're creating a new connection to the 
# database you're referencing.

# Use the dbConnect() call to connect to the MySQL database. Make the port argument (3306) and user 
# argument ("student").
con <- dbConnect(RMySQL::MySQL(), ##Construct SQL driver
                 dbname = "tweater", 
                 host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com", 
                 port = 3306,
                 user = "student",
                 password = "datacamp")
##### You are now connected to the MySQL database tweater. con is DBIConnection object

# Print out the structure of con
str(con)
con


## Step 2: List the database tables

# dbListTables() can be very useful to get a first idea about the contents of your database.
tables <- dbListTables(con)

# Display the structure of tables; what's the class of this vector?
str(tables)
class(tables)


## Step 3: Import data from a table

# Import the users table from tweater: users
users <- dbReadTable(con, "users")
users

# Import and print the tweats table from tweater: tweats
tweats <- dbReadTable(con, "tweats")
tweats

# Import and print the comments table from tweater: comments
comments <- dbReadTable(con, "comments")
comments

# closing connections
on.exit(dbDisconnect(con))


### SQL query

# Connect to the database
library(DBI)
con <- dbConnect(RMySQL::MySQL(), 
                 dbname = "tweater", 
                 host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com", 
                 port = 3306,
                 user = "student",
                 password = "datacamp")

# Use dbGetQuery() to create a data frame, latest, that selects the post column from the tweats table 
# observations where the date is higher than "2015-09-21". 
# Make sure you correctly perform string escaping.
dbReadTable(con, "tweats") ## This is to see what the tweats column looks like
latest <- dbGetQuery(con, "SELECT post FROM tweats WHERE date > '2015-09-21'")

# Import tweat_id column of comments where user_id is 1: elisabeth
dbReadTable(con, "comments") ## This is to see what the comments column looks like
elisabeth <- dbGetQuery(con, "SELECT tweat_id FROM comments WHERE user_id = '1'")

# Print latest and elisabeth
latest
elisabeth


### More advanced SQL queries

# Create an R data frame, specific, that selects the message column from the comments table where the 
# tweat_id is 77 and the user_id is greater than 4.
specific <- dbGetQuery(con, "SELECT message FROM comments WHERE tweat_id = 77 AND user_id > 4")

# Create a data frame, short, that selects the id and name columns from the users table where the number 
# of characters in the name is under 5. 
# Use the SQL function CHAR_LENGTH() inside the WHERE clause of the SQL query.
short <- dbGetQuery(con, "SELECT id, name FROM users WHERE CHAR_LENGTH(name) < 5")

# Print specific and short
specific
short

# Another very often used keyword is JOIN, and more specifically INNER JOIN. Take this call for example:
dbGetQuery(con, "SELECT post, message FROM tweats INNER JOIN comments on tweats.id = tweat_id WHERE tweat_id = 77")
# The result contains data both from the tweats and the comments column.
# A table with four observations, containing two columns: post and message

# Send - Fetch - Clear

# Send query to the database
res <- dbSendQuery(con, "SELECT * FROM comments WHERE user_id > 4")

# Use dbFetch() twice. In the first call, import only two records of the query result by setting the n 
# argument to 2. In the second call, import all remaning queries (don't specify n). 
# In both calls, simply print the resulting data frames.
dbFetch(res, n=2)
dbFetch(res)

# Clearing the result with dbClearResult()
dbClearResult(res)


# Build a data frame long_tweats. It selects the post and date columns from the observations in tweats 
# where the character length of the post variable exceeds 40.
long_tweats <- dbGetQuery(con, "SELECT post, date FROM tweats WHERE CHAR_LENGTH(post) > 40")

# Print long_tweats
print(long_tweats)

# RMySQL automatically specifies a maximum of open connections and closes some of the connections 
# if you're exaggerating, but still: it's always polite to manually disconnect from the database afterwards. 
# You do this with the dbDisconnect() function
dbDisconnect(con)


##### The sqldf package allows for execution of SQL commands on R data frames. We will use the sqldf 
##### package to practice the queries we might send with the dbSendQuery command in RMySQL.

# Download the 2006 microdata survey about housing for the state of Idaho
setwd("C:\\Users\\Philip Abraham\\OneDrive\\TECHNOLOGY\\Data Analysis\\Data")
if(!file.exists("ACS")){dir.create("ACS")}

setwd("C:\\Users\\Philip Abraham\\OneDrive\\TECHNOLOGY\\Data Analysis\\Data\\ACS")

fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileurl, destfile= "./ss06pid.csv")
dateDownloaded <- date()

# Download the American Community Survey data and load it into an R object called acs using sqldf package
library(sqldf)
acs<-read.csv.sql("ss06pid.csv", drv = "SQLite")

# select only the data for the probability weights pwgtp1 with ages less than 50
pwgtp1_50 <- sqldf("select pwgtp1 from acs where AGEP < 50", drv = "SQLite")

# Using the same data frame, what is the equivalent function to unique(acs$AGEP)?
a<-unique(acs$AGEP)
b<-sqldf("select distinct AGEP from acs")



library(data.table)

####Selecting columns in i
#Create a data.table my_first_data_table with a column
x = c("a", "b", "c", "d", "e")
y = c(1, 2, 3, 4, 5)
my_first_data_table <- data.table(x, y)

# Create a two-column data.table DT that contains the four integers 1, 2, 1 and 2 in the first column a and
# the letters A, B, C and D in the second column b. Use recycling.
DT1<-data.table(a=as.integer(c(1,2)), b=c("A","B","C","D"))

# See all the data tables in memory
tables()

#Select the third row of DT and just print the result to the console.
DT1[3,]

# Print the second and third row to the console, but do not use commas
DT1[2:3]

# Print the second to last row of DT using .N
DT1[.N-1]

# Print the column names of DT, and number of rows and number of columns
colnames(DT1)
dim(DT1)

# Select row 2 twice and row 3, returning a data.table with three rows where row 2 is a duplicate of row 1.
DT1[c(2,2,3)]


#Create a data.table DT
A = c(1, 2, 3, 4, 5)
B = c("a", "b", "c", "d", "e")
C= c(6, 7, 8, 9, 10)
DT <- data.table(A, B, C)

# Print the second column of DT
DT[, B] ## Returns a vector


####Selecting columns in j
DT[, .(B, C)] ## Returns a Data Table

####Removing a column by column number
DT <- DT[, -c(1,3), with =F]

# A non-existing column - Column D does not exist in DT and is thus not seen as a variable. This causes 
# data.table to look for D in DT's parent frame. 
## DT[, D] returns 5 as vector, and DT[, .(D)] returns 5 as data.table
D <- 5
DT[, .(D)]
DT[, D]

## Subset rows 1 and 3, and columns B and C
DT[c(1,3), .(B,C)]

#From DT, create a data.table, ans with two columns: B and val, where val is the product of A and C
ans<-DT[, .(B, val=A*C)]

# Fill in the blanks such that ans2 equals target
target <- data.table(B = c("a", "b", "c", "d", "e", "a", "b", "c", "d", "e"), 
                     val = as.integer(c(6:10, 1:5)))
ans2 <- DT[, .(B, val = as.integer(c(6:10, 1:5)))]


##The by basics

##Download iris data from web
setwd("C:\\Users\\Philip Abraham\\OneDrive\\TECHNOLOGY\\Data Analysis\\Data")
if(!file.exists("iris")){dir.create("iris")}

fileurl<-"http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
download.file(fileurl, destfile= "iris/iris.data", method = "curl")
dateDownloaded <- date()

names(iris)

# Convert iris to a data.table: DT
DT<-data.table(iris)

# For each Species, print the mean Sepal.Length
DT[, mean(Sepal.Length), by = Species]

# Print mean Sepal.Length, grouping by first letter of Species
DT[, mean(Sepal.Length), by = substr(Species, 1,1)]

# Group the specimens by Sepal area (to the nearest 10 cm2) and count how many occur in each group.
DT[, .N, by = 10 * round( Sepal.Length *Sepal.Width / 10)]

# Now name the output columns `Area` and `Count`
DT[, .(Count=.N), by = .(Area=10 * round( Sepal.Length *Sepal.Width / 10))]

### Create the data.table DT
set.seed(1L)
DT <- data.table(A = rep(letters[2:1], each = 4L), B = rep(1:4, each = 2L), C = sample(8))

# Given DT, calculate cumulative sum of C in column C while you group by A,B. Store it in a new data.
# table DT2 with 3 columns: A, B and C.
DT2<-DT[, .(C=cumsum(C)), by = .(A,B)]

# Select from DT2 the last two values of C in column C while you group by A alone. Make sure the 
# column names don't change.
DT2[, .(C=tail(C,2)), by=.(A)]

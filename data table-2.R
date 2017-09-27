library(data.table)

## Chaining, the basics

# Build DT
DT <- data.table(A = rep(letters[2:1], each = 4L), 
                 B = rep(1:4, each = 2L), 
                 C = sample(8)) 

# Combine the two steps in a one-liner by chaining
DT2 <- DT[, .(C = cumsum(C)), by = .(A, B)]
DT2[, .(C = tail(C, 2)), by = A]

DT2 <- DT[, .(C = cumsum(C)), by = .(A, B)][, .(C = tail(C, 2)), by = A]


## Chaining your iris dataset

##Download iris data from web
if(!file.exists("iris")){dir.create("iris")}

fileurl<-"http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
download.file(fileurl, destfile= "iris/iris.data")
dateDownloaded <- date()

names(iris)

# Convert iris to a data.table: DT
DT<-data.table(iris)

# Get the median of each of the four columns Sepal.Length, Sepal.Width, Petal.Length 
# and Petal.Width, while grouping by Species. Reuse the same column names (e.g. 
# the column containing the median Sepal.Length is still called Sepal.Length). 
# Next, order() Species in descending order using chaining.
DT[, .(Sepal.Length = median(Sepal.Length), 
       Sepal.Width = median(Sepal.Width), 
       Petal.Length = median(Petal.Length),
       Petal.Width = median(Petal.Width)), 
   by = Species][order(-Species)]


## special built-in variable .SD

# build data table
x <- c(2,1,2,1,2,2,1)
y <- c(1,3,5,7,9,11,13)
z <- c(2,4,6,8,10,12,14)
DT <- data.table(x,y,z)

# Get the mean of columns y and z grouped by x by using .SD
DT[, lapply(.SD, mean), by = x]
# Get the median of columns y and z grouped by x by using .SD
DT[, lapply(.SD, median), by = x]


# Introducing .SDcols

# build data table
grp <- c(6,6,8,8,8)
Q1 <- c(1,4,4,2,5)
Q2 <- c(5,4,4,4,5)
Q3 <- c(2,1,3,1,2)
H1 <- c(3,2,5,2,5)
H2 <- c(2,1,4,5,4)
DT <- data.table(grp,Q1,Q2,Q3,H1,H2)

# Calculate the sum of the columns that start with Q, using .SD and .SDcols. 
# Set .SDcols equal to 2:4
DT[, lapply(.SD, sum), .SDcols = 2:4]

# Set .SDcols to be the result of a function call. This time, calculate the sum 
# of columns H1 and H2 using paste0() to specify the .SDcols argument.
DT[, lapply(.SD, sum), .SDcols = paste0("H",1:2)]

# Finally, select all but the first row of the groups names 6 and 8, returning 
# only the grp column and the columns that start with Q. Use -1 in i of .SD and 
# use paste0() again.
DT[, .SD[-1], by = grp, .SDcols = paste0("Q", 1:3)]


## Mixing it together: lapply, .SD, .SDcols and .N


# build data table
x <- c(2,1,2,1,2,2,1)
y <- c(1,3,5,7,9,11,13)
z <- c(2,4,6,8,10,12,14)
DT <- data.table(x,y,z)

# Get the sum of all columns x, y and z and the number of rows in each group 
# while grouping by x.
DT[, c(lapply(.SD, sum), .N), by = x, .SDcols = c("x", "y", "z")]

# Cumulative sum of column x and y while grouping by x and z > 8
DT[, lapply(.SD, cumsum), by = .(by1 = x, by2 = z > 8), .SDcols = c("x", "y")]


## Adding, updating and removing columns

# The data.table DT
DT <- data.table(A = letters[c(1, 1, 1, 2, 2)], B = 1:5)

# Add a column to DT by reference, named Total, that contains sum(B) for each 
# group in column A
DT[, Total := sum(B), by=A]

# Add 1L to the values in column B, but only in the rows 2 and 4.
DT[c(2,4), B := B+1L]

# Add a new column Total2 that contains sum(B) grouped by A but just over rows 2, 3 and 4.
DT[2:4, Total2 := sum(B), by = A]

# Remove the Total column from DT
DT[, Total := NULL]

# select the third column as a vector
DT[[3]]


## The functional form

# The data.table DT
DT <- data.table(A = letters[c(1, 1, 1, 2, 2)], B = 1:5)

# Update B with B + 1, add a new column C with A + B, and add a new column D of just 2's.
DT[, `:=`(B = B + 1, C=3+1, D = 2)]

# A variable my_cols has already been defined. Use it to delete these columns from DT
my_cols <- c("B", "C")
DT[, (my_cols) := NULL]

# Finally, delete column D using the column number (2), not its name (D).
DT[, 2 := NULL]


## set() function

# build data table
x <- c(2,1,2,1,2,2,1)
y <- c(1,3,5,7,9,11,13)
z <- c(2,4,6,8,10,12,14)
DT <- data.table(x,y,z)

# the slower computationally waY
for (i in 1:7) DT[i, z := i+1]
# the better way of doing above - use set() function
# build data table
x <- c(2,1,2,1,2,2,1)
y <- c(1,3,5,7,9,11,13)
z <- c(2,4,6,8,10,12,14)
DT <- data.table(x,y,z)
for (i in 1:7) set(DT, i, 3L, i+1)

# The set() family

# Define DT
DT <- data.table(a = letters[c(1, 1, 1, 2, 2)], b = 1)

# Add the suffix "_2" to all column names
setnames(DT, paste0(names(DT), "_2"))

# Change column name a_2 to A2
setnames(DT, "a_2", "A2")

# Reverse the order of the columns
setcolorder(DT, c("b_2", "A2"))

# Alternative solution using column numbers
# setcolorder(DT, 2:1)
                 

library(data.table)

##Download iris data from web
if(!file.exists("iris")){dir.create("iris")}

fileurl<-"http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
download.file(fileurl, destfile= "iris/iris.data")
dateDownloaded <- date()

names(iris)

# Convert iris to a data.table: DT
iris <-data.table(iris)

# Select all the rows where Species is "virginica"
iris[Species == "virginica"]

# Species is either "virginica" or "versicolor"
iris[Species %in% c("virginica", "versicolor")]

# Remove the "Sepal." prefix
setnames(iris, gsub("^Sepal\\.", "", names(iris)))

# Remove the two columns starting with "Petal"
iris[, grep("^Petal", names(iris)) := NULL]


##  automatic indexing

# Select the rows where the area is greater than 20 square centimeters.
iris[Length*Width >20]

# Add a new boolean column containing Width * Length > 25
iris[,is_large := Width * Length > 25]

# Select the rows for which the value of is_large is TRUE
iris[is_large == TRUE]
## iris[(is_large)] # Also OK


## Keys

# Build DT
DT <- data.table(A = c("b","a","b","c","a","b","c"),
                 B = c(2,4,1,7,5,3,6), 
                 C = c(6:12)) 

# Select the b group using ==
DT[A == "b"]

# Set a 2-column key on A and B
setkey(DT, A, B)

# Select the b group again using ==
DT[A == "b"] #  the order of the rows within the b group change because keys were above


## Selecting groups or parts of groups

# The 'keyed' data.table DT
DT <- data.table(A = letters[c(2, 1, 2, 3, 1, 2, 3)], 
                 B = c(5, 4, 1, 9, 8, 8, 6), 
                 C = 6:12)
setkey(DT, A, B)

# Select the "b" group
DT["b"]

# "b" and "c" groups
DT[c("b", "c")]

# The first row of the "b" and "c" groups
DT[c("b", "c"), mult = "first"]

# Use by = .EACHI and .SD to select the first and last row of the "b" and "c" groups.
DT[c("b", "c"), .SD[c(1, .N)], by = .EACHI]

# Extend the previous command to print out the group before returning the first 
# and last row from it. You can use curly brackets to include two separate 
# instructions inside the j argument.
DT[c("b", "c"), { print(.SD); .SD[c(1, .N)] }, by = .EACHI]

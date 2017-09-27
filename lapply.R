cities <- c("New York", "Paris", "London", "Tokyo", "Rio de Janeiro", "Cape Town")
result <- lapply(cities, nchar) # finds no. of characters in each city in the list
str(result)

unlist(lapply(cities, nchar))


# The vector pioneers
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

# Split names from birth year
split_math <- strsplit(pioneers, split = ":")

# Convert to lowercase strings: split_low
split_low <- lapply(split_math,tolower)

# Take a look at the structure of split_low
str(split_low)

# Write function select_first()
select_first <- function(x) {
        x[1]
}

# Apply select_first() over split_low: names
names <- lapply(split_low, select_first)
names

# Write function select_second()
select_second <- function(x) {
        x[2]
}

# Apply select_second() over split_low: years
years <- lapply(split_low, select_second)
years

# Transform: use anonymous function inside lapply doing the same set of operations as above
names <- lapply(split_low, function(x) {x[1]})

# Transform: use anonymous function inside lapply doing the same set of operations as above
years <- lapply(split_low, function(x) {x[2]})

# A more generic approach. lapply() provides a way to handle functions that require more than one argument.
# Generic select function
select_el <- function(x, index) {
        x[index]
}

# Use lapply() twice on split_low: names and years
names <- lapply(split_low,select_el,index =1)
years <- lapply(split_low,select_el,index =2)
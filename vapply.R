cities <- c("New York", "Paris", "London","Tokyo","Rio de Janeiro", "Cape Town")
sapply(cities, nchar)
vapply(cities, nchar, numeric(1)) ## with vapply you can specify type of output


temp <- list(c(3, 7, 9, 6, -1), c(6, 9, 12, 13, 5), c(4, 8, 3, -1, -3), c(1, 4, 7, 2, -2), c(5, 7, 9, 4, 2), c(-3, 5, 8, 9, 4), c(3, 6, 9, 4, 1))

# Definition of basics()
basics <- function(x) {
        c(min = min(x), mean = mean(x), max = max(x))
}

# Apply basics() over temp using vapply() - you can use numeric(3) to specify the FUN.VALUE
vapply(temp,basics,numeric(3))

# Convert to vapply() expression
sapply(temp, max)
vapply(temp,max,numeric(1))
# Convert to vapply() expression
sapply(temp, function(x, y) { mean(x) > y }, y = 5)
vapply(temp, function(x, y) { mean(x) > y }, y = 5, logical(1))
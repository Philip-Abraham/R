data(mtcars)
mtcars
narrow <- mtcars[, c("cyl", "gear", "vs", "mpg")]
narrow

# Now let's say we are wanting to summarize the data, finding the maximum value of mpg for each 
# combination of cyl, gear, and vs (there are, as you will know from the week 3 lectures, a lot of 
# ways you could do this, I happen to like reshape2

library(reshape2)
wide1 <- tidied <- dcast(narrow, cyl + gear ~ vs, max)
wide1

wide2 <- tidied <- dcast(narrow, cyl + vs ~ gear, max)
wide2

wide3 <- tidied <- dcast(narrow, gear + vs ~ cyl, max)
wide3

notverywide <- aggregate(mpg ~ gear + vs + cyl, data = narrow, max)
notverywide
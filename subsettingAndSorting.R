###Subsetting - quick review

set.seed(13435)
X <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
X <- X[sample(1:5),]; X$var2[c(1,3)] = NA
X

# Subsetting - quick review
X[,1]
X[,"var1"]
X[1:2,"var2"]

# Logicals ands and ors
X[(X$var1 <= 3 & X$var3 > 11),]
X[(X$var1 <= 3 | X$var3 > 15),]

# Dealing with missing values
X[which(X$var2 > 8),]

# Sorting
sort(X$var1)
sort(X$var1,decreasing=TRUE)
sort(X$var2,na.last=TRUE)

# Ordering
X[order(X$var1),]

X[order(X$var1,X$var3),]

# Ordering with plyr
library(plyr)
arrange(X,var1) ## ascending order
arrange(X,desc(var1)) ## descending order

# Adding rows and columns
X$var4 <- rnorm(5)
X

# Adding rows and columns

## Adding Columns
Y <- cbind(X,rnorm(5)) ## adding columns to the right
Y

Z <- cbind(rnorm(5),X) ## adding columns to the left
Z

## Adding Rows
RB <- rbind(X,rnorm(4)) ## adding rows to the bottom
RB

RT <- rbind(rnorm(4),X) ## adding rows to the top
RT


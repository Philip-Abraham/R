#Create the vectors
name <- c("Anne", "Pete", "Frank", "Julia", "Cath")
age <- c(28, 30, 21, 39, 35)
child <- c(FALSE, TRUE, TRUE, FALSE, TRUE)

#To create a data frame and name it in one and the same call you can use:
my_df<-data.frame(name1 = name, age1 = age, child1 = child)
my_df

#Check the Column Headers of the data frame
names(my_df)


#Look at the data frame structure; you will see that the names r stored as factors instead of characters
str(my_df)

# to suppress this behavior
my_df <- data.frame(name1, age1, child1, stringsAsFactors = FALSE)
str(my_df)
my_df
#Create the vectors
name <- c("Anne", "Pete", "Frank", "Julia", "Cath")
age <- c(28, 30, 21, 39, 35)
child <- c(FALSE, TRUE, TRUE, FALSE, TRUE)

#Create the Data Frame and store it in variable df
df <- data.frame(name, age, child)
df

#Check the Column Headers of the data frame
names(df)


#Look at the data frame structure; you will see that the names r stored as factors instead of characters
str(df)

# to suppress this behavior
df <- data.frame(name,age,child, stringsAsFactors = FALSE)
str(df)

#To change column header names after creating it:
names(df) <- c("name2", "age2", "child3")
str(df)
df


#Construct a list, named my_list, that contains the variables my_vector, my_matrix and my_factor as list components.
# Numeric vector: 1 up to 10
my_vector <- 1:10 

# Numeric matrix: 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

# Factor of sizes
my_factor <- factor(c("M","S","L","L","M"), ordered = TRUE, levels = c("S","M","L"))

# Construct my_list with these different elements
my_list<-list(my_vector,my_matrix,my_factor)
names(my_list) <- c("vec", "mat","fac")
#Structure of my_list
str(my_list)


# Create actors and reviews
actors_vector <- c("Jack Nicholson","Shelley Duvall","Danny Lloyd","Scatman Crothers","Barry Nelson")
reviews_factor <- factor(c("Good", "OK", "Good", "Perfect", "Bad", "Perfect", "Good"), 
                         ordered = TRUE, levels = c("Bad", "OK", "Good", "Perfect"))

# Create shining_list
shining_list<-list(title="The Shining",actors=actors_vector,reviews=reviews_factor)
str(shining_list)

#Select the actors from shining_list and assign the result to act
act<-shining_list$actors

# List containing title and reviews from shining_list: sublist
sublist<-shining_list[c(TRUE, FALSE,TRUE)] 
str(sublist)

#Select from the shining_list the last actor and assign the result to last_actor
last_actor<-shining_list[[2]][5]

#Select from the shining_list the second review score (which is a factor)
second_review<-shining_list[[3]][2]

# Add the release year to shining_list
shining_list <- c(shining_list, year = 1980)

# Add the director to shining_list
shining_list <- c(shining_list, director = "Stanley Kubrick")
str(shining_list)

#add both the year (1980) and director (Stanley Kubrick) to shining_list again. Try to do it in a one-liner this time
shining_list_ext<-c(shining_list, list(year = 1980, director = "Stanley Kubrick"))

# Have a look at the structure of shining_list_ext
str(shining_list_ext)

#selection of elements in list
shining_list_ext[[1]][[1]]
shining_list[[2]][[2]]



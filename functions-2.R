# Create a Triple function
triple <- function(x){
        3*x
}


# print string and variable within function using cat()
triple <- function(x){
        cat("Value is: ", 3*x)
}



# return() returns that value in the function
magic <- function(x){
        y<-4*x
        5*x
        
        return(y)
}

# return() and print()
magic <- function(x){
        y<-4*x
        z<-5*x
        print(z)
        
        return(y)
}


# return() twice only returns the last return call in the function which here is return(y)
magic <- function(x){
        y<-4*x
        z<-5*x
        return(z)
        return(y)
}



# print string and variable within function using paste0
magic <- function(x){
        y<-4*x
        z<-5*x
        print(paste0("y: ", y))
        print(paste0("z: ", z))
}

# functions with two arguments
twoargs <- function(x,y){
        v<-x+y
        v
}


# functions with two arguments w/ default value for on argument
twoargs <- function(x, y = x^2){
        v<-x+y
        v
}

# return error mesage and exit function to prevent giving infinite value Inf
math_magic <- function(a, b) {
        if(b == 0) {
                return("dont enter zero for second argument")
        }        
        a*b + a/b
}


# There are situations in which your function does not require an input. 
# Let's say you want to write a function that gives us the random outcome of throwing a fair dice:

throw_dice <- function() {
number <- sample(1:6, size = 1)
number
}

# Define the function hello()
hello <- function() {
        print("Hi there!")
        return(TRUE)
}


# Two dice function
two_dice <- function() {
        possibilities <- 1:6
        dice1 <- sample(possibilities, size = 1)
        dice2 <- sample(possibilities, size = 1)
        dice1 + dice2
}
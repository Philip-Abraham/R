# creating an Expectation Function for an exponential distribution using integration

f <- function(x){
        rate <- 0.2
        x*rate*exp(-rate*x)
}
mean_exp <- integrate(f,0,Inf)
mean_exp$value #mean of exponential distribution with rate = 0.2

g <- function(x) {
        rate <- 0.2
        ((x-mean_exp$value)^2)*rate*exp(-rate*x) 
}
var_exp <- integrate(g,0,Inf)
var_exp$value #variance of exponential distribution with rate = 0.2
stddev_exp <- sqrt(var_exp$value) #std dev of exponential distribution with rate = 0.2

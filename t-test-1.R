# Load the data set mtcars in the datasets R package.
data(mtcars)

# Calculate a 95% confidence interval to the nearest MPG for the variable mpg.
n <- length(mtcars$mpg)
mn <- mean(mtcars$mpg)
s <- sd(mtcars$mpg)
mn + c(-1, 1) * qt(.975, n-1) * s / sqrt(n)

# Another way of obtaining the same result as above
round(t.test(mtcars$mpg)$conf.int) # default confidence interval =95%

# for a 98% confidence interval
round(t.test(mtcars$mpg, conf.level = 0.98 )$conf.int)


# Construct a 95% T interval for MPG comparing 4 to 6 cylinder cars 
# (subtracting in the order of 4 - 6) assume a constant variance.
m4 <-  mtcars$mpg[mtcars$cyl==4]
n4 <- length(m4)
mn4 <- mean(m4)
s4 <- sd(m4)

m6  <- mtcars$mpg[mtcars$cyl==6]
n6 <- length(m6)
mn6 <- mean(m6)
s6 <- sd(m6)

sp <- sqrt(((n4-1) * s4^2 + (n6-1) * s6^2) / (n4 + n6 - 2))
mn4 - mn6 + c(-1, 1) * qt(.975, (n4+n6)-2) * sp * (1 / n4 + 1 / n6)^.5

# Another way of obtaining the same result as above
confint <- as.vector(t.test(m4, m6, var.equal = TRUE)$conf.int) # assuming constant variance accross two groups


# Suppose that 18 obese subjects were randomized, 9 each, to a new diet pill and 
# a placebo. Subjects' body mass indices (BMIs) were measured at a baseline and 
# again after having received the treatment or placebo for four weeks. 
# The average difference from follow-up to the baseline (followup - baseline) 
# was -3 kg/m2 for the treated group and 1 kg/m2 for the placebo group. 
# The corresponding standard deviations of the differences was 1.5 kg/m2 for the 
# treatment group and 1.8 kg/m2 for the placebo group. Does the change in BMI 
# over the four week period appear to differ between the treated and placebo groups? 
# Assuming normality of the underlying data and a common population variance, 
# calculate the relevant *90%* t confidence interval. 
# Subtract in the order of (Treated - Placebo) with the smaller (more negative) number first.
n1 <- n2 <- 9
x1 <- -3  ##treated
x2 <- 1  ##placebo
s1 <- 1.5  ##treated
s2 <- 1.8  ##placebo
# assuming common population variance
sp <- sqrt(( (n1 - 1) * s1^2 + (n2 - 1) * s2^2) / (n1 + n2 - 2))
x1 - x2 + c(-1, 1) * qt(.95, 16) * sp * (1 / 9 + 1 / 9)^.5


# In a study of emergency room waiting times, investigators consider a new and 
# the standard triage systems. To test the systems, administrators selected 20 
# nights and randomly assigned the new triage system to be used on 10 nights and 
# the standard system on the remaining 10 nights. They calculated the nightly 
# median waiting time (MWT) to see a physician. The average MWT for the new 
# system was 3 hours with a variance of 0.60 while the average MWT for the old 
# system was 5 hours with a variance of 0.68. Consider the 95% confidence 
# interval estimate for the differences of the mean MWT associated with the new 
# system. Assume a constant variance. What is the interval? Subtract in this 
# order (New System - Old System).
n1 <- n2 <- 10
x1 <- 3  ##new
x2 <- 5  ##old
s1 <- sqrt(.6)  ##new
s2 <- sqrt(.68)  ##old
sp <- sqrt(( (n1 - 1) * s1^2 + (n2 - 1) * s2^2) / (n1 + n2 - 2))
x1 - x2 + c(-1, 1) * qt(.975, 18) * sp * (1 / 10 + 1 / 10)^.5

# To further test the hospital triage system, administrators selected 200 nights 
# and randomly assigned a new triage system to be used on 100 nights and a 
# standard system on the remaining 100 nights. They calculated the nightly median 
# waiting time (MWT) to see a physician. The average MWT for the new system was 
# 4 hours with a standard deviation of 0.5 hours while the average MWT for the 
# old system was 6 hours with a standard deviation of 2 hours. Consider the 
# hypothesis of a decrease in the mean MWT associated with the new treatment.
n1 <- n2 <- 100
x1 <- 4  ##new
x2 <- 6  ##old
s1 <- .5  ##new
s2 <- 2  ##old
x2 - x1 + c(-1, 1) * qnorm(0.975) * sqrt(s1^2/n1 + s2^2/n2) # unequal variances


# Suppose that standard deviation of 9 paired differences is 1. 
# What value would the average difference have to be so that the lower endpoint 
# of a 95% students t confidence interval touches zero?
n <- 9
s <- 1
mn <- -1*c(-1) * qt(.975, n-1) * s / sqrt(n)
round(mn,2)


# A diet pill is given to 9 subjects over six weeks. The average difference in 
# weight (follow up - baseline) is -2 pounds. What would the standard deviation 
# of the difference in weight have to be for the upper endpoint of the 95% T 
# confidence interval to touch 0?
n <- 9
mn <- -2
s <- ((-1*mn)*sqrt(n))/((c(1))*(qt(.975, n-1)))


# In a population of interest, a sample of 9 men yielded a sample average brain 
# volume of 1,100cc and a standard deviation of 30cc. What is a 95% Student's T 
# confidence interval for the mean brain volume in this new population?
n <- 9 # Number of samples
DF <- n-1 # Degrees of Freedom
Est_mu <- 1100 # Estimated Average of Samples
s <- 30 # Standard Deviation
SEx <- s/sqrt(n) #Standard Error
Est_mu + c(-1,1)*qt(.975,DF)*SEx # 95% Confidence Interval


# Consider a uniform distribution. If we were to sample 100 draws from a a 
# uniform distribution (which has mean 0.5, and variance 1/12) and take their 
# mean, X. What is the approximate probability of getting as large as 0.51 or larger?
pnorm(.51, mean = 0.5, sd = sqrt(1 / 12 / 100), lower.tail = FALSE)



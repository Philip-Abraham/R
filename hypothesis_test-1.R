# Load the data set mtcars in the datasets R package.
data(mtcars)

# Calculate a 95% confidence interval to the nearest MPG for the variable mpg.
n <- length(mtcars$mpg)
mn <- mean(mtcars$mpg)
s <- sd(mtcars$mpg)

# You want to test whether the true MPG is mn or smaller using a one sided 5% level test.
# Using that data set and a Z test: Based on the mean MPG of the sample - mn; and by 
# using a Z test: what is the smallest value of mn that you would reject 
# for (to two decimal places)?
mn + c(1) * qnorm(.95) * s / sqrt(n)
# or
mn + c(-1) * qnorm(.05) * s / sqrt(n)

# Use a two group t-test to test the hypothesis that the 4 and 6 cyl cars have the same mpg.
m4 <-  mtcars$mpg[mtcars$cyl==4]
m6  <- mtcars$mpg[mtcars$cyl==6]
t.test(m4,m6, var.equal = FALSE, paired = FALSE, alternative="two.sided")



# Consider the mtcars data set.
m6  <- mtcars$mpg[mtcars$cyl==6]
m8  <- mtcars$mpg[mtcars$cyl==8]
n6 <- length(m6)
n8<- length(m8)
s6 <- sd(m6)
s8 <- sd(m8)

# Give the p-value for a t-test comparing MPG for 6 and 8 cylinder cars assuming equal
# variance, as a proportion to 3 decimal places.
p <- t.test(m8,m6,var.equal = TRUE, paired = FALSE,alternative = "two.sided")

# Give the associated P-value for a z test.
2*pnorm(p$statistic)

# Give the common standard deviation estimate for MPG across cylinders to 3 decimal
# places.
sqrt((((n8-1)*s8^2)+((n6-1)*s6^2))/(n8+n6-2))

# Would the t test reject at the two sided 0.05 level (0 for no 1 for yes)?
# Reject with a two-sided t-statistic value of -4.419 


# A pharmaceutical company is interested in testing a potential blood pressure 
# lowering medication. Their first examination considers only subjects that 
# received the medication at baseline then two weeks later. 
# The data are as follows (SBP in mmHg)
bas <- c(140,138,150,148,135)
trt <- c(132,135,151,146,130)
# Consider testing the hypothesis that there was a mean reduction in blood pressure? 
# Give the P-value for the associated two sided T test.
t.test(trt,bas,var.equal = TRUE, paired = TRUE,alternative = "two.sided")


# A sample of 9 men yielded a sample average brain volume of 1,100cc and a 
# standard deviation of 30cc. What is the complete set of values of mu0 that a 
# test of H0:mu=mu0 would fail to reject the null hypothesis in a two sided 5% Students t-test?
n <- 9
mu <- 1100
s <- 30
alpha <- .05
mu0 <- mu + c(-1,1)*qt(1-alpha/2,n-1)*s/sqrt(n)


# A sample of 100 men yielded an average PSA level of 3.0 with a sd of 1.1. What are the complete
# set of values that a 5% two sided Z test of H0 : mu = mu0 would fail to reject the null hypothesis
# for?
n <- 100
mu <- 3.0
s <- 1.1
alpha <- .05
mu0 <- mu + c(-1,1)*qnorm(1-alpha/2)*s/sqrt(n)



# You believe the coin that you're flipping is biased towards heads. 
# You get 55 heads out of 100 flips. 

# Note you have to start at 54 as it lower.tail = FALSE gives the 
# strictly greater than probabilities
round(pbinom(54, prob = .5, size = 100, lower.tail = FALSE),4)

# Do you reject at the 5% level that the coin is fair?
# Based on the above pbinom probability of .1841, you don't reject at the 5% level


# Researchers conducted a blind taste test of Coke versus Pepsi. Each of four
# people was asked which of two blinded drinks given in random order that they 
# preferred. The data was such that 3 of the 4 people chose Coke. Assuming that 
# this sample is representative, report a P-value for a test of the hypothesis 
# that Coke is preferred to Pepsi using a one sided exact test.
round(pbinom(2, prob = .5, size = 4, lower.tail = FALSE),2)


# A web site was monitored for a year and it received 520 hits per day. In the 
# first 30 days in the next year, the site received 15,800 hits. Assuming that 
# web hits are Poisson. Give an exact onesided P-value to the hypothesis that web 
# hits are up this year over last.
# This test comes with the important assumption that web hits are a Poisson process.
ppois(15800 - 1, lambda = 520 * 30, lower.tail = FALSE)

# Do you reject at the 5% level
# Based on the above pbinom probability of 0.05533114, you don't reject at the 5% level
# Also, compare with the Gaussian approximation where lambdha ~ N(lambdha,lambdha/t)
pnorm(15800 / 30, mean = 520, sd = sqrt(520 / 30), lower.tail = FALSE)
# As t approaches infinity this becomes more Gaussian. The approximation is 
# pretty good for this setting.



# Suppose that a hospital has an infection rate of 10 infections per 100 person/days 
# at risk (rate of 0.1) during the last monitoring period. Assume that an 
# infection rate of 0.05 is an important benchmark. Given a Poisson model, could 
# the observed rate being larger than 0.05 be attributed to chance? We want to 
# test H0 : lambdha = 0:05 where lambdha is the rate of infections per person day so that 5 
# would be the rate per 100 days. Thus we want to know if 9 events per 100 person/days 
# is unusual with respect to a Poisson distribution with a rate of 5 events per 100. 
# Consider Ha : lambdha > 0:05.

# Poisson P-value calculation.
ppois(9, 5, lower.tail = FALSE)
# Again, since this P-value is less than 0.05 we reject the null hypothesis. 
# The P-value would be 0.06 for two sided hypothesis (double) and so we would fail 
# to reject in that case.



# Infection rates at a hospital above 1 infection per 100 person days at risk are 
# believed to be too high and are used as a benchmark. A hospital that had 
# previously been above the benchmark recently had 10 infections over the last 
# 1,787 person days at risk. About what is the one sided P-value for the relevant 
# test of whether the hospital is *below* the standard?
# Poisson P-value calculation.
ppois(3, 1, lower.tail = FALSE)
# Again, since this P-value is less than 0.05 we reject the null hypothesis.

# H0:lambdha=0.01 versus Ha:lambdha<0.01. X=11, t=1,787 and assume X~H0Poisson(0.01×t)
ppois(10, lambda = 0.01 * 1787)



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


# Suppose that in an AB test( another name for randomized trial), one advertising scheme led to an average of 10 
# purchases per day for a sample of 100 days, while the other led to 11 purchaces 
# per day, also for a sample of 100 days. Assuming a common standard deviation of 
# 4 purchases per day. Assuming that the groups are independent and that they 
# days are iid, perform a Z test of equivalence.
# What is the P-value reported to 3 digits expressed as a proportion?
n1 <- n2 <- 100
x1 <- 10  ##old
x2 <- 11  ##new
s1 <- 4  ##old
s2 <- 4  ##new
sp <- sqrt(( (n1 - 1) * s1^2 + (n2 - 1) * s2^2) / (n1 + n2 - 2))
SE <- sp * sqrt(1 / n1 + 1 / n2) # equal variance
t_stat <- (x1-x2)/SE
2*pnorm(t_stat) # assume it is a two-sided test
# based on the above p-value of 0.077 for a two-sided test we won't reject on a 5% level


# Suppose that 18 obese subjects were randomized, 9 each, to a new diet pill and 
# a placebo. Subjects' body mass indices (BMIs) were measured at a baseline and 
# again after having received the treatment or placebo for four weeks. The 
# average difference from follow-up to the baseline (followup - baseline) was 
# ???3 kg/m2 for the treated group and 1 kg/m2 for the placebo group. 
# The corresponding standard deviations of the differences was 1.5 kg/m2 for the 
# treatment group and 1.8 kg/m2 for the placebo group. 
# Does the change in BMI appear to differ between the treated and placebo groups? 
n1 <- n2 <- 9
x1 <- 1  ##old
x2 <- -3  ##new
s1 <- 1.8 ##old
s2 <- 1.5  ##new
sp <- sqrt(( (n1 - 1) * s1^2 + (n2 - 1) * s2^2) / (n1 + n2 - 2))
SE <- sp * sqrt(1 / n1 + 1 / n2) # equal variance
t_stat <- (x2-x1)/SE
2*(pnorm(t_stat)) # assume it is a two-sided test
# based on the above p-value of <.01 for a two-sided test we will reject on a 5% level

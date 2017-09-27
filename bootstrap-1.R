
# One BootStrap Sample
x <- c(3.12, 0.00, 1.57, 19.67, 0.22, 2.20)
mean(x)
n <- length(x)

# number of times resample from x with replacement
B <- 10000

# resample from x with replacement
resamples <- matrix(sample(x,n*B, replace = TRUE), B, n)

# means of the 10,000 resamples
means <- apply(resamples,1, mean) # apply mean to each row(1) of the matrix
quantile(means, c(.025, .975))
mean(resamples)
mean(resamples)-mean(x)

# medians of the 10,000 resamples
medians <- apply(resamples,1, median) # apply median to each row(1) of the matrix
quantile(medians, c(.025, .975))
median(resamples)
median(resamples)-median(x)

hist(means, breaks=100)
qqnorm(means, main = "Normal Q-Q Plot, Sample Size n = 6");qqline(means,col = 2)

hist(medians, breaks=100)

sd(means)
sd(medians)

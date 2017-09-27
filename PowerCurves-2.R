mu0 = 0; sigma = .04

library(ggplot2)
nseq = c(90, 100, 137, 140, 200)
mua = seq(0, -.02, by = -.01)
z = qnorm(.05)
power = sapply(nseq, function(n)
        pnorm(mu0 + z * sigma / sqrt(n), mean = mua, sd = sigma / sqrt(n), 
              lower.tail = TRUE)
)
colnames(power) <- paste("n", nseq, sep = "")
d <- data.frame(mua, power)
library(reshape2)
d2 <- melt(d, id.vars = "mua")
names(d2) <- c("mua", "n", "power")    
g <- ggplot(d2, 
            aes(x = mua, y = power, col = n)) + geom_line(size = 2)
g            
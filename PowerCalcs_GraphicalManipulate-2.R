# GRAPHICAL DEPICTION OF POWER
library(manipulate)
mu0 = 0
myplot <- function(sigma, mua, n, alpha) {
        g = ggplot(data.frame(mu = c(-0.02, .02)), aes(x = mu))
        g = g + stat_function(fun = dnorm, geom = "line", args = list(mean = mu0,
                                                                      sd = sigma/sqrt(n)), size = 2, col = "red")
        g = g + stat_function(fun = dnorm, geom = "line", args = list(mean = mua,
                                                                      sd = sigma/sqrt(n)), size = 2, col = "blue")
        xitc = mu0 + qnorm(1 - alpha) * sigma/sqrt(n)
        g = g + geom_vline(xintercept = xitc, size = 3)
        g
}
manipulate(myplot(sigma, mua, n, alpha), sigma = slider(.01, .08, step = .01, initial = .04),
           mua = slider(-.01, 0, step = .01, initial = -.01), n = slider(100, 200, step = 1,
                        initial = 137), alpha = slider(0.95, 0.99, step = 0.01, initial = 0.95))
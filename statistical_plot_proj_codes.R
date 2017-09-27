# The purpose of this segment of code is to verify the Central Limit Theorem

# # CLT states that, when certain conditions are satisfied, sample means are
# approximately normally distributed, no matter what the underlying
# distribution is.
# First, show a histogram of the underlying distribution.
set.seed(123)
X <- rexp(40,0.2)
hist(X, probability = TRUE, main = "1000 Exponential Distributions with a Rate(lambda) of 0.2")
abline(v=mean(X), col="red",lty=2, lwd=3)
text(6, 0.1, pos= 4, "Red line is the\n location of\n the sample mean", cex = .8, col = "red")



# Draw 1000 samples (size = 40) and plot a histogram of the means.
mns=NULL
for (i in 1 : 1000) mns = c(mns, mean(rexp(40,0.2)))
     hist(mns, main = "Distribution of sample means", breaks = 100, col ="grey")

# Test if the sample means are normally distributed.
# The shapiro.test tests the NULL hypothesis that the samples came from a Normal 
# distribution. This means that if your p-value <= 0.05, then you would reject 
# the NULL hypothesis that the samples came from a Normal distribution     
     shapiro.test(mns)
     qqnorm(mns);qqline(mns,col = 2)
     
pastecs::stat.desc(mns) # give statistical summarries of the vector

library(datasets)
data("ToothGrowth")

tooth_df <- ToothGrowth

require(graphics)
coplot(len ~ dose | supp, data = tooth_df, panel = panel.smooth,
       xlab = "ToothGrowth data: length vs dose, given type of supplement")

df_vc <- subset(tooth_df, tooth_df$supp == "VC")
df_oj <- subset(tooth_df, tooth_df$supp == "OJ")

hist(df_vc$len, breaks = 15)
hist(tooth_df$len,breaks = 15)
pastecs::stat.desc(df_vc$len)
qqnorm(df_vc$len, main = "norm");qqline(df_vc$len,col = 2)
shapiro.test(df_vc$len)
shapiro.test(tooth_df$len)
qqnorm(tooth_df$len, main = "norm");qqline(tooth_df$len,col = 2)
shapiro.test(df_oj$len)
qqnorm(df_oj$len, main = "norm");qqline(df_oj$len,col = 2)
plot(df_vc$dose, df_vc$len)
hist(df_oj$len)

mean(df_vc$len)
sd(df_vc$len)

mean(df_oj$len)
sd(df_oj$len)

t.test(df_vc$len, df_oj$len, paired = FALSE, var.equal = FALSE)
t.test(df_vc$len, df_oj$len, paired = FALSE, var.equal = TRUE)
t.test(tooth_df$len, df_oj$len, paired = FALSE, var.equal = FALSE)
str(tooth_df)


library(ggplot2)
# Plot log10 of pm25 emissions by year for each type of sources (128 zero emission rows - 6% of values- will be removed when plotting log values)
p <- ggplot(tooth_df,aes(supp,len, color=supp)) + scale_color_discrete(name="Legend")+theme(legend.key=element_rect(fill=NA)) + guides(colour = guide_legend(override.aes = list(size=5)))

#Add Box plot with jittered points
p1 <- p + geom_boxplot(fill="darkolivegreen") + facet_grid(. ~ dose) + geom_jitter(shape=16, position=position_jitter(0.5),alpha=.5, size=10)

#Add means point for each year
p2 <- p1 + stat_summary(fun.y=mean, geom="point", shape=23, size=8, color= "azure", fill="black")

#Add titles and labels
p3<-p2 + labs(title="ToothGrowth data: length vs supplement, given varying dosage levels",x="Delivery Method", y = "Tooth Growth Length")

# Change the panel color & yaxis limits
# Setting the limits on the coordinate system performs a visual zoom.
# The data is unchanged, and we just view a small portion of the original
p3+theme(panel.background = element_rect(fill = 'black'))



library(ggplot2)
# Plot log10 of pm25 emissions by year for each type of sources (128 zero emission rows - 6% of values- will be removed when plotting log values)
p <- ggplot(tooth_df,aes(dose,len, color=supp)) + scale_color_discrete(name="Legend")+theme(legend.key=element_rect(fill=NA)) + guides(colour = guide_legend(override.aes = list(size=5)))

#Add Box plot with jittered points
p1 <- p  + facet_grid(. ~ supp) + geom_jitter(shape=16, position=position_jitter(0.1),alpha=.5, size=5)

#Add means point for each year
p2 <- p1 + stat_summary(fun.y=mean, geom="line", size=3)

#Add titles and labels
p3<-p2 + labs(title="ToothGrowth data: length vs dose, given type of supplement",x="Dosage Levels", y = "Tooth Growth Length")

# Change the panel color & yaxis limits
# Setting the limits on the coordinate system performs a visual zoom.
# The data is unchanged, and we just view a small portion of the original
p3+theme(panel.background = element_rect(fill = 'black'))



ggplot(df_vc, aes(x = len, fill = supp)) + geom_histogram(alpha = .20, binwidth=3, colour = "black", aes(y = ..density..)) 
ggplot(df_oj, aes(x = len, fill = supp)) + geom_histogram(alpha = .20, binwidth=2.5, colour = "black", aes(y = ..density..)) 

qqnorm(tooth_df$len, main = "norm");qqline(tooth_df$len,col = 2)
shapiro.test(df_oj$len)
qqnorm(df_oj$len, main = "norm");qqline(df_oj$len,col = 2)
qqnorm(df_vc$len, main = "norm");qqline(df_vc$len,col = 2)
shapiro.test(df_vc$len)


df_5 <- subset(tooth_df, tooth_df$dose == 0.5)
df_1 <- subset(tooth_df, tooth_df$dose == 1.0)
df_2<- subset(tooth_df, tooth_df$dose == 2.0)

t.test(df_5$len, df_1$len, paired = FALSE, var.equal = FALSE)
t.test(df_5$len, df_2$len, paired = FALSE, var.equal = FALSE)
t.test(df_1$len, df_2$len, paired = FALSE, var.equal = FALSE)


hist(mns, prob=TRUE, col="lightblue", main="mean distribution for rexp()",
     breaks=20)
lines(density(mns), lwd=3, col="blue")

hist(tooth_df$len, probability = TRUE,
     main = "Figure 3-Distribution of Tooth Lengths",
     col="darkorange", xlab='Tooth Lengths', breaks=30)
lines(density(tooth_df$len), lwd=3, col="blue")



# set constants
lambda<-0.2
n_expo<-40 # number of exponetials
n_sim<-1000 # number of tests
set.seed(42) # set the seed to create reproducability
# run the test resulting in n x numberOfSimulations matrix
simMeans <- NULL
for (i in 1 : n_sim) simMeans <- c(simMeans, mean(rexp(n_expo, lambda)))
mu <- mean(simMeans)
va <- var(simMeans)

library(ggplot2)
ggplot(data.frame(y=simMeans), aes(x=y)) +
        geom_histogram(aes(y=..density..), binwidth=0.2, alpha=0.2) +
        stat_function(fun=dnorm, args=list(mean=mu, sd=sqrt(va)), size=1, col="red") +
        geom_vline(xintercept = mu, size=1, colour="#CC0000") +
        geom_density(colour="blue", size=1) +
        geom_vline(xintercept = 1/lambda, size=1, colour="#0000CC") +
        labs(title="Plot of the Simulations", x="Simulation Mean", size=2)


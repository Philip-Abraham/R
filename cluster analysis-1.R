utilities <- read.csv("./utilities.csv")
str(utilities)

plot(Fuel_Cost~Sales, utilities)

# add labels to plots, pos=4 puts labels to the right, cex is text size
with(utilities,text(Fuel_Cost~Sales, labels=Company, pos=4, cex=.5))

## Normalization

# cluster analysis all data to be numeric, there fore remove Company column from utilities
z<- utilities[,-1]

# some values have high values lile "Sales", but others have low values like"Fuel_cost"
# so normalization levels the playing field so that one variable does not dominate the rest

# find means and sd of all the columns....the 2 indicates column. If it was 1 then it would be row
m <- apply(z,2,mean)
s <- apply(z, 2,sd)

# calculate the normalized dataset z
z <- scale(z,m,s)

# calculate Euclidean distance
distance <- dist(z)
print(distance, digits = 3) # make it compact with digits = 3

## Cluster Dendogram with Complete Linkage
hc.c <- hclust(distance)
plot(hc.c, labels = utilities$Company)
plot(hc.c, hang = -1, labels = utilities$Company) # align the dendogram lines at the bottom

# heatmap
mat<-as.matrix(distance)
heatmap(mat)

# Cluster Dendogram with Average Linkage
hc.a <- hclust(distance, method = "average")
plot(hc.a, hang =-1, labels = utilities$Company)

# Cluster Membership
member.c <-cutree(hc.c,3) #complete
member.a <-cutree(hc.a,3) #average
table(member.c,member.a) # to compare complete linkage with average linkage results in clustering

#Cluster Means
aggregate(z,list(member.c),mean) # helps u to see which variables play significat roles in characterizing the cluster
aggregate(utilities[,-1],list(member.c),mean) # to see aggregation in original units

# Silhouette plot to visualize clustering
# if members are closed to each other in cluster than the Si values will be high
# the negative value Si member is an outlier in the group
library(cluster)
plot(silhouette(cutree(hc.c,3),distance))

## Scree Plot
# to see how many clusters to use we do a scree plot
# scree plot gives u a sum of squares within group variables(wss) versus the number of clusters
# this wiil help u decide the optimum number of clusters
wss <- (nrow(z)-1)*sum(apply(z,2,var))
for(i in 2:20) wss[i] <- sum(kmeans(z,centers = i)$withinss)
plot(1:20, wss, type="b", xlab="Number of Clusters", ylab="Within group SS")
## U see that in plot that after about three clusters the group variability doesn't change much
# so it does not make sense to do more than five clusters in this case because the drop in 
# variability is not a lot after five clusters

### K-Means Clustering
kc <- kmeans(z,3) # kc will show how the clustering is broken down and group variability info
# also gives u all the components example "cluster"
kc$cluster # see what component cluster...tells you where each company is in what cluster
kc$centers # gives u centers component values

# u can plot variables by cluster variables to see how good the separation is between clusters
plot(Sales~D.Demand, utilities, col=kc$cluster)



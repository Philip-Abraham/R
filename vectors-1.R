#Assigning data to vector
star<-c("rigel", "beteleguese","vega","sirius")
is.vector(star)

#Assigning data to vector
lightyears<-c(2000,300,26,7)
is.vector(lightyears)

#Associating the two above vectors
names(lightyears)<-star
lightyears

#You could also simplify above steps -(you don't need to put quotes " " on char as above)
star<-c(rigel=2000,beteleguese=300,vega=26,sirius=26)
star

#to get info on vectors
str(star)

#check length of vector
length(star)
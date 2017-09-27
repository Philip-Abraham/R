velocity_initial<-c(3,4,-5,7)
position<-c("first","second","third","fourth")
velocity_final<-c(4,-4,2,9)
Velocity_delta<-velocity_final-velocity_initial

names(velocity_initial)<-position
names(velocity_final)<-position
names(Velocity_delta)<-position

Velocity_delta

#Relational operators
velocity_final>velocity_initial

#Subsetting index 2
initialvelocity3<-velocity_initial[2]
initialvelocity3

#Subsetting index 2 & 3
initialvelocity23<-velocity_initial[c(2,3)]
initialvelocity23

#easier way of Subsetting index 2,3,4
initialvelocity234<-velocity_initial[2:4]
initialvelocity234

#selection by name
initialvelocity23<-velocity_initial[c("second","third")]
initialvelocity23

#Selection by using LOGICALS for index 2 & 3
initialvelocity23<-velocity_initial[c(FALSE,TRUE,TRUE,FALSE)]
initialvelocity23

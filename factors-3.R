# Create speed_vector
speed_vector<-c(Analyst1="OK",Analyst2="Slow",Analyst3="Slow",Analyst4="OK",Analyst5="Fast")
speed_vector

# Convert speed_vector to ordered speed_factor
speed_factor<-factor(speed_vector, 
                           ordered = TRUE, 
                           levels = c("Slow", "OK","Fast"))
speed_factor

# Summarize speed_factor
summary(speed_factor)
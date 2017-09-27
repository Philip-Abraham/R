# Definition of hand_vector
hand_vector <- c("Right", "Left", "Left", "Right", "Left")

# Convert hand_vector to a factor: hand_factor
hand_factor<-factor(hand_vector)
hand_factor

# Display the structure of hand_factor
str(hand_factor)

# Definition of survey_vector
survey_vector <- c("R", "L", "L", "R", "R")

#Convert the character vector survey_vector into a factor vector, survey_factor, with the levels 
#"Right" and "Left"
survey_factor <- factor(survey_vector, 
                        levels = c("R", "L"),
                        labels = c( "Right",  "Left"))

#show class of survey_factor
class(survey_factor)
#show the underlying integer vector of survey_factor
unclass(survey_factor)

# Print survey_factor
survey_factor

# Summarize survey_vector
summary(survey_vector)

# Summarize survey_factor
summary(survey_factor)


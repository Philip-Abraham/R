# Definition of animal_vector and temperature_vector
animal_vector <- c("Elephant", "Giraffe", "Donkey", "Horse")
temperature_vector <- c("High", "Low", "High", "Low", "Medium")

#Convert animal_vector to a factor, animal_factor
animal_factor<-factor(animal_vector)
animal_factor

#Encode temperature_vector as an ordered factor called temperature_factor
temperature_factor<-factor(temperature_vector, 
                           ordered = TRUE, 
                           levels = c("Low", "Medium","High"))
temperature_factor
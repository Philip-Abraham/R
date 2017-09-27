# Definition of vectors
planets <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Encode type as a factor: type_factor
type_factor<-factor(type)

# Construct planets_df: strings are not converted to factors!
planets_df<-data.frame(planets,type_factor,diameter,rotation,rings, stringsAsFactors = FALSE)

# Display the structure of planets_df
str(planets_df)

#Select the type of Mars; store the factor in mars_type
mars_type<-factor(planets_df[4,2])

#Store the entire rotation column in rotation as a vector
rotation<-planets_df[,4]

#Create a data frame, closest_planets_df, that contains all data on the first three planets
closest_planets_df<-planets_df[1:3,]
closest_planets_df

#data frame furthest_planets_df that contains all data on the last three planets.
furthest_planets_df<-planets_df[6:8,]
furthest_planets_df

#Select the diameter and rotation for the 3rd planet, Earth, and save it in earth_data
earth_data<-planets_df[3,3:4]

#Select for the last six rows only the diameter and assign this selection to furthest_planets_diameter
furthest_planets_diameter<-planets_df[3:8,"diameter"]
furthest_planets_diameter

# Make use of the $ sign to create the variable rings_vector that contains the 
# entire rings column in the planets_df data frame.
rings_vector<-planets_df$rings

#Assign to planets_with_rings_df all data in the planets_df data set for the planets 
#with rings, that is, where rings_vector is TRUE
planets_with_rings_df<-planets_df[rings_vector,]
planets_with_rings_df
#Instead of having to define a vector rings_vector, which you then use 
#to subset planets_df, you could've also used:
planets_with_rings_df<-planets_df[planets_df$rings == TRUE, ]
planets_with_rings_df
#You can reach the same thing with the subset().
planets_with_rings_df<-subset(planets_df, subset = rings == TRUE)
planets_with_rings_df
#Assign to planets_without_rings_df all data in the planets_df data set for the planets 
#with rings, that is, where rings_vector is TRUE
planets_without_rings_df<-planets_df[!rings_vector,]
planets_without_rings_df
#Instead of having to define a vector rings_vector, which you then use 
#to subset planets_df, you could've also used:
planets_without_rings_df<-planets_df[planets_df$rings == FALSE, ]
planets_without_rings_df
#You can reach the same thing with the subset().
planets_without_rings_df<-subset(planets_df, subset = rings == FALSE)
planets_without_rings_df

# Planets that are smaller than planet Earth: small_planets_df
small_planets_df<-planets_df[planets_df$diameter < 1, ]
small_planets_df
# Build another data frame, slow_planets_df, with the observations that have 
# a longer rotation period than Earth (so absolute value of rotation greater than 1).
slow_planets_df<-planets_df[abs(planets_df$rotation) > 1, ]
slow_planets_df

# Definition of moons and masses
moons <- c(0, 0, 1, 2, 67, 62, 27, 14)
masses <- c(0.06, 0.82, 1.00, 0.11, 317.8, 95.2, 14.6, 17.2)

# Add moons to planets_df under the name "moon"
planets_df$moon <- moons
## Add masses to planets_df under the name "mass"
planets_df <- cbind(planets_df, mass = masses)

# The data for pluto; you have to add the appropriate names such that 
#it matches the names of planets_df
pluto <- data.frame("Pluto", "Dwarf Planet", 0.18, -6.38, FALSE,1,0.0025)
names(pluto)<-c("planets","type_factor","diameter","rotation","rings","moon","mass")

# Bind planets_df and pluto together
planets_df<-rbind(planets_df, pluto)

# Print out planets_df
planets_df

#You would like to rearrange your data frame such that it starts with the 
#largest (diameter) planet and ends with the smallest (diameter) one.
# Create a desired ordering for planets_df: positions
positions<-order(planets_df$diameter, decreasing = TRUE)

#Create the data frame largest_first_df, which contains the same information as planets_df, but with 
#the planets in decreasing order of magnitude. 
#Use the previously created variable positions as row indices to achieve this.
planets_df<-planets_df[positions,]
planets_df


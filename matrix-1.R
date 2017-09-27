matrix(1:6,nrow=2)
matrix(1:6,nrow=2,byrow = TRUE)

matrix(1:6,ncol=2)

matrix(1:6,nrow=1,ncol=6)

cbind(1:4,1:4,1:4)

rbind(1:4,1:4,1:4)

m<-matrix(1:6,nrow=2,byrow = TRUE)
m
rownames(m)<-c("row1","row2")
colnames(m)<-c("col1","col2","col3")
m

dimnames = list(c("row1", "row2"),c("col1", "col2", "col3"))
m

# Star Wars box office in millions (!)
box <- c(460.998, 314.4, 290.475, 247.900, 309.306, 165.8)

# Create star_wars_matrix
star_wars_matrix<-matrix(box,nrow=3,byrow=TRUE)
star_wars_matrix

# Name star_wars_matrix rows and columns
rownames(star_wars_matrix)<-c("sales in mill","sales in mill","sales in mill")
colnames(star_wars_matrix)<-c("US-Boxoffice","Non-US-Boxoffice")
star_wars_matrix

# Star Wars box office in millions (!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

# Create star_wars_matrix
star_wars_matrix<-rbind(new_hope,empire_strikes,return_jedi)
star_wars_matrix

# Star Wars box office in millions (!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)
star_wars_matrix <- rbind(new_hope, empire_strikes, return_jedi)

# Name the columns and rows of star_wars_matrix
rownames(star_wars_matrix)<-c("A New Hope","The Empire Strikes Back","Return of the Jedi")
colnames(star_wars_matrix)<-c("US","non-US")
star_wars_matrix

#Another Option
col <- c("US", "non-US")
row <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")
star_wars_matrix <- matrix(c(new_hope, empire_strikes, return_jedi), byrow = TRUE, nrow = 3, dimnames = list(row, col))
star_wars_matrix

# Star Wars box office in millions (!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)
star_wars_matrix <- rbind(new_hope, empire_strikes, return_jedi)
colnames(star_wars_matrix) <- c("US", "non-US")
rownames(star_wars_matrix) <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

# Calculate the worldwide box office totals for three movies: worldwide_vector
worldwide_vector<- rowSums(star_wars_matrix)
worldwide_vector

# Bind the new variable worldwide_vector as a column to star_wars_matrix: star_wars_ext
star_wars_ext<-cbind(star_wars_matrix,worldwide_vector)
star_wars_ext

#Select the US box office figure for "The Empire Strikes Back"
star_wars_matrix[2,1]
#Select the non-US box office number for "A New Hope"
star_wars_matrix[1,2]
#Select all US box office revenue from star_wars_matrix
star_wars_matrix[,1]
#Extract the revenue information for "A New Hope"
star_wars_matrix[1,]
#Calculate the average Non-US revenue for all movies
non_us_all<-sum(star_wars_matrix[,2])/length(star_wars_matrix[,2])
non_us_all
#Average non-US revenue of first two movies: non_us_some
non_us_some<-sum(star_wars_matrix[c(1,2),2])/length(star_wars_matrix[c(1,2),2])
non_us_some
# All figures for "A New Hope" and "Return of the Jedi"
star_wars_matrix[c(1,3),c(1,2)]
#Using names, select the US revenues for "A New Hope" and "The Empire Strikes Back"
star_wars_matrix[c("A New Hope","The Empire Strikes Back"),1]
#Using logical vectors, select the last two rows and both columns from star_wars_matrix
star_wars_matrix[c(FALSE,TRUE,TRUE),c(TRUE,TRUE)]
#Select the non-US revenue for "The Empire Strikes Back"
star_wars_matrix[2,2]
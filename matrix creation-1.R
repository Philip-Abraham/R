#create a 3 x 4 matrix
my_matrix<-c(3,9,10,7,15,5,3,2,-7,-1,8,4)
dim(my_matrix)<-c(3,4)
my_matrix


#subset a 3 x 3 matrix from above "my_matrix"
new_matrix<-my_matrix[c(1:3),c(1:3)]
new_matrix

#Find the inverse of the above "new_matrix"
solve(new_matrix)

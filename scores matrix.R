#The voting results for each row
first_row<-c(6,8,7,9,9,10)
second_row<-c(6,8,7,5,9,6)
third_row<-c(5,4,6,6,7,8)
fourth_row<-c(4,5,3,4,6,8)

#Make a matrix containing 4 rows, corresponding to the 4 rows in your home theater. Call it scores
scores<-rbind(first_row,second_row,third_row,fourth_row)
scores

#Make a vector containing the sums of the scores in each row. Call it row_scores
row_scores<-rowSums(scores)
row_scores

#Add row_scores as a column in scores
scores<-cbind(scores,row_scores)
scores

#Name rows and columns of scores
dimnames(scores)=list(c("row1","row2","row3","row4"),c("c1","c2","c3","c4","c5","c6","total"))
scores
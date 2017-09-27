processFile = function(filepath) {
        con = file(filepath, open='r')
        while ( TRUE ) {
                line = readLines(con, n = 1)
                length(line)
                if ( length(line) == 0 ) {
                        break
                }
                print(line)
        }
        
        close(con)
}


 ####################################
con = file("en_US.twitter.txt", open='r')
while ( TRUE ) {
  line = readLines(con, n = 1)
 
  if ( length(line) == 0 ) {
    break
  }
  print(line)
}

close(con)

#################################

##1 Extract Words from sentence
text <- c("Desk put together, room all")

library(stringr)
words <- stringi::stri_extract_all_words(text)
length(words[[1]])

##2 Extract Words from sentence
con = file("en_US.twitter.txt", open='r')
while ( TRUE ) {
  line = readLines(con, n = 1)
  if ( length(line) == 0 ) {
    break
  }
  
  line
  words <- stringi::stri_extract_all_words(line)
  words
  print(length(words[[1]]))
 

  
}

close(con)

##################################
## number of characters in text lines

testcon <- file("en_US.twitter.txt",open="r")
readsizeof <- 20000
nooflines <- 0
( while((linesread <- length(readLines(testcon,readsizeof))) > 0 ) 
  nooflines <- nooflines+linesread )
close(testcon)
nooflines


charlength = rep(NA, nooflines)
i = 0
con = file("en_US.twitter.txt", open='r')
while ( TRUE ) {
  line = readLines(con, n = 1)
  if ( length(line) == 0 ) {
    break
  }
  i=i+1
  charlength[i] = nchar(line)
}

close(con)

max(na.exclude(charlength))

###################

## Pattern matching
# In the en_US twitter data set, if you divide the number of lines where 
# the word "love" (all lowercase) occurs by the number of lines the 
# word "hate" (all lowercase) occurs, about what do you get?

pattern1 =c("love")
pattern2 =c("hate")
i = 0
count1 = 0
count2 = 0

con = file("en_US.twitter.txt", open='r')
while ( TRUE ) {
  line = readLines(con, n = 1)
  if ( length(line) == 0 ) {
    break
  }
  i=i+1
  
  print(i)
 print(grep(pattern1, line))
 print(grepl(pattern1, line))
 print(grep(pattern2, line))
 print(grepl(pattern2, line))
 if(grepl(pattern1, line)=='TRUE'){
   count1=count1+1
 }
 if(grepl(pattern2, line)=='TRUE'){
   count2=count2+1
 }
}
close(con)
count1
count2
count1/count2

################################

## The one tweet in the en_US twitter data set that matches the 
## word "biostats" says what?

pattern3 =c("biostats")

con = file("en_US.twitter.txt", open='r')
while ( TRUE ) {
  line = readLines(con, n = 1)
  if ( length(line) == 0 ) {
    break
  }
  
  
  if(grepl(pattern3, line)=='TRUE'){
    print(line)
  }
  
}
close(con)

#####################################################

# How many tweets have the exact characters "A computer once 
# beat me at chess, but it was no match for me at kickboxing". 
# (I.e. the line matches those characters exactly.)

pattern4 =c("A computer once beat me at chess, but it was no match for me at kickboxing")
i=0

con = file("en_US.twitter.txt", open='r')
while ( TRUE ) {
  line = readLines(con, n = 1)
  if ( length(line) == 0 ) {
    break
  }
  
  
  if(grepl(pattern4, line)=='TRUE'){
    i=i+1
    print(i)
    print(line)
  }
  
}
close(con)

testcon <- file("en_US.twitter.txt",open="r")
readsizeof <- 20000
nooflines <- 0
( while((linesread <- length(readLines(testcon,readsizeof))) > 0 ) 
        nooflines <- nooflines+linesread )
close(testcon)
nooflines
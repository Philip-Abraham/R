# Data Utilities
# The linkedin and facebook vectors have already been created for you
linkedin <- list(16, 9, 13, 5, 2, 17, 14)
facebook <- list(17, 7, 5, 16, 8, 13, 14)

# Convert linkedin and facebook to a vector: li_vec and fb_vec
li_vec <- unlist(linkedin)
fb_vec <- unlist(facebook)

# Append fb_vec to li_vec: social_vec
social_vec <- append(li_vec,fb_vec)

# Sort social_vec
sort(social_vec, decreasing = TRUE)


# There is a popular story about young Gauss. As a pupil, he had a lazy teacher who wanted to keep the 
# classroom busy by having them add up the numbers 1 to 100. Gauss came up with an answer almost 
# instantaneously, 5050.
sum(seq(1:100))


##Regular Expressions - use ?regex for  R documentation

# grepl() - grepl(pattern = <regex>, x = <string>) - returns logicals if pattern match on elements
animals <- c("cat", "moose", "impala", "ant", "kiwi")

grepl(pattern = "a", x = animals) # find animals that contains "a"

grepl(pattern = "^a", x = animals) # find animals that start with "a"

grepl(pattern = "a$", x = animals) # find animals that end with "a"

# grep() - returns indices of elements that match the pattern
grep(pattern = "a", x = animals)
## the above is same as writing:
which(grepl(pattern = "a", x = animals))

grep(pattern = "^a", x = animals) # find indices of elements in animals vector that start with "a"

# sub() - replacement function - sub(pattern = <regex>, replacement = <str>, x = <str>)
sub(pattern = "a", replacement = "o", x = animals) # "a" gets replaced with "o" in each animals element
# the sub() function only replaces the first character that matches pattern in each element of the animals vector

# If u want every character that matches the pattern in the element of the animals vector, then use gsub()
gsub(pattern = "a", replacement = "o", x = animals)

# to replace multiple characters - use OR in gsub()
gsub(pattern = "a|i|o", replacement = "_", x = animals) # finds "a","i", "o" and replaces with "-"


# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org", 
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for "edu"
grepl(pattern = "edu", x = emails)

# Use grep() to match for "edu", save result to hits
hits <- grep(pattern = "edu", x = emails)

# Subset emails using hits
emails[hits]


# More robust search with grepl & grep for the email problem above
#' You can use the caret, ^, and the dollar sign, $ to match the content located in the start and end of 
#' a string, respectively. This could take us one step closer to a correct pattern for matching only 
#' the ".edu" email addresses from our list of emails. But there's more that can be added to make the 
#' pattern more robust:
#' @, because a valid email must contain an at-sign.
#' .*, which matches any character (.) zero or more times (*). Both the dot and the asterisk are metacharacters. You can use them to match any character between the at-sign and the ".edu" portion of an email address.
#' \\.edu$, to match the ".edu" part of the email at the end of the string. The \\ part escapes the dot: 
#' it tells R that you want to use the . as an actual character.

# Use grepl() to match for .edu addresses more robustly
grepl(pattern = "@.*\\.edu$", x = emails)

# Use grep() to match for .edu addresses more robustly, save result to hits
hits <- grep(pattern = "@.*\\.edu$", x = emails)

# Subset emails using hits
emails[hits]


# more robust sub & gsub
# With the advanced regular expression "@.*\\.edu$", use sub() to replace the match with "@datacamp.edu"
sub(pattern = "@.*\\.edu$", replacement = "@datacamp.edu", x = emails)

# sub & gsub - Example 2
awards <- c("Won 1 Oscar.",
            "Won 1 Oscar. Another 9 wins & 24 nominations.",
            "1 win and 2 nominations.",
            "2 wins & 3 nominations.",
            "Nominated for 2 Golden Globes. 1 more win & 2 nominations.",
            "4 wins & 1 nomination.")

sub(".*\\s([0-9]+)\\snomination.*$", "\\1", awards)
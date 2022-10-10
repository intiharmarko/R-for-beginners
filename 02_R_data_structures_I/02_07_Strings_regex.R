# 2.7 Strings III - String matching, string replacement and regular expressions

# String matching - back to toy example
help(regex)

# get all country names
install.packages("countrycode")
require(countrycode)

countries <- as.vector(countrycode::codelist$country.name.en)

# countries beginning with letter "A"
grep(pattern = "^A", x = countries)
countries[grep(pattern = "^A", x = countries)]
countries[grepl(pattern = "^A", x = countries)]

# all country names that end with letter "y"
rez <- grep(pattern = "*y$", x = countries)
countries[rez]

# all country with 2 words or more for a country name
rez <- grep(pattern = "\\w\\s\\w", x = countries)
countries[rez]

# all country names that end with letter "e" or "i"
rez <- grep(pattern = "*e$|*i$", x = countries)
countries[rez]

# all country names which contain combination of letters “gin” 
rez <- grep(pattern = "*(gin)", x = countries)
countries[rez]


# metacharacters and double backslash sign
strings <- c("dollar $", "dollar", "US dollar")

# how to escape metacharacters in R
# we would like to match a word with "$" dollar sign
strings
rez1 <- grep(pattern = "$", x = strings) # wrong way all are find $ indicating end of string
strings[rez1]

# we need to escape $ with \ backslash
rez2 <- grep(pattern = "\$", x = strings) # wrong way error
strings[rez2]

# right way $ escape with \\ double backslash
rez3 <- grep(pattern = "\\$", x = strings) # wrong way error
strings[rez3]

# Escape dot .
strings <-c("word.word", "word word")
rez <- grep(pattern = "\\.", x = strings)
strings[rez]

# the hat sign beginning of the string and dollar sign end of string
strings <- c("Word", "worD")
strings[grep("^W",strings)]
strings[grep("D$",strings)]

# example of an anchor sequences in R
strings <- c("123", "onetwothree", "1twothree")
strings[grep("\\d", strings)] # digit character
strings[grep("\\D", strings)] # non-digit character

# example of a character classes
strings <- c("123", "dollar", "shkjl")
strings[grep("[aeiou]", strings)] # match word with any vovel
strings[grep("[0-9]", strings)] # match word with digits


# find and replace sub() & gsub()
string <- "I have started to learn R, and I already love R."

# replace "R" with "X"
sub(pattern = "R", replacement = "X", x = string) #only first occurence replaced
gsub(pattern = "R", replacement = "X", x = string) #all occurences replaced

#replace white space with blank space
gsub(pattern = "\\s", replacement = "", x = string)


# string split, split given sentence by comma ","
strsplit(x = string, split = ",")

# split phone numbers by digits
numbers <- c("310-555-123", "311-444-456")
strsplit(x = numbers, split = "-")
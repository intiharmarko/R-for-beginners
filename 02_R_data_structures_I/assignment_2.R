# Task 1

a <- 15
b <- 4
c <- 10
i <- TRUE 
j <- FALSE
k <- TRUE

d <- a^b*c
sqrt(d)
d^(1/4)
log(d)
log10(d)
log(d, base = 10)
sqrt(a^2+b*c)/(a+b+c)^3

# Boolean Laws
i&i
i&i == i # check
i|i
i|i == i # check
i&j == j&i # check
i|j == j|i # check
i&!i == 0 # check
!!k == k # check


# Task 2
z1 <- 3 + 2i
z2 <- 6 + 8i

z3 <- 3*z1 + 4*z2
Re <- Re(z3)
Im <- Im(z3)
Conj(z3)
z3 / (z1*z2)


# Task 3
s1 <- paste("This", "is", "a", "R", "beginner", "course.")
s2 <- "R is a fun language."
s3 <- paste(s1, s2, sep = " ")
nchar(s3)
tolower(s3)
toupper(s3)


# Task 4
states <- rownames(USArrests) 
toupper(substr(x = states, start = 1, stop = 3))

rez <- grep(pattern = "^U|^S|^A", x = states)
states[rez]

rez <- grep(pattern = "\\w\\s\\w", x = states)
states[rez]

sub(pattern = "California", replacement = "Kalifornia", x = states)

rez <- grep(pattern = "a$|e$|i$", x = states)
states[rez]


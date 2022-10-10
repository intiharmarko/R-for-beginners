# Assignment 3

# Task 1

v <- 1:100
sum(v) # sum of elements
v[seq(2,100,2)] <- v[seq(2,100,2)] * 5  # even number modification
v[seq(1,99,2)] <- v[seq(1,99,2)] / 5  # odd number modification

# vector split
v1 <- v[1:20]
v2 <- v[21:40]
v3 <- v[41:60]
v4 <- v[61:80]
v5 <- v[81:100]

# vector calculations
v1 + v2 - v3
2*v4^v5
log(v1)-sqrt(v2)
v2 %*% v3


# Task 2

set.seed(123)
M1 <- matrix(data = runif(n = 100, min = 0, max = 1), nrow = 10, ncol = 10, byrow = T)
M2 <- v; dim(M2) <- c(10,10)

# matrix calculations
100 * M1 - M2
M1^(2*M2)
log10(M1+100)/log(M2+100, base = 20)
M1 %*% M2

# matrix equation
#   3A*X=B  (put 3 on the other side)
#   A*X=B*(1/3) (bring A on the right side - multipy with inverse)
#   X=A^(-1)*B*(1/3)

A <-  matrix(data = c(2, 3, 5, -5, 50, 20, 1, 1, 2), nrow = 3, ncol = 3, byrow = T)
B <-  matrix(data = c(-15840, 3627, -300, -75150, 47100, 41100, -6270, 1299, -540), nrow = 3, ncol = 3, byrow = T)
X <- solve(A) %*% B * 1/3
X


# Task 3

vec <- runif(n = 2500, min = 0, max = 10)
A <- array(data = vec, dim = c(5,5,100))
dimnames(A) <- list(paste("r",1:5, sep = ""), paste("c",1:5, sep = ""), paste("M",1:100, sep = ""))

A[,,100] <- 0
dim(A)
A <- A[,,1:50] 
dim(A)

# array split
A1 <- A[,,1:10]
A2 <- A[,,11:20]
A3 <- A[,,21:40]
A4 <- A[,,31:40]
A5 <- A[,,41:50]

# sum of rows
A1.sum <- apply(A1, 1, sum)
A2.sum <- apply(A2, 1, sum)
A3.sum <- apply(A3, 1, sum)
A4.sum <- apply(A4, 1, sum)
A5.sum <- apply(A5, 1, sum)


# Task 4

ls() # list all elements in console

# create lists for vectors, matrices and arrays
lst.vec <- list(v = v, v1 = v1, v2 = v2, v3 = v3, v4 = v4, v5 = v5, vec = vec, 
                A1.sum = A1.sum, A2.sum = A2.sum, A3.sum = A3.sum, A4.sum = A4.sum, A5.sum = A5.sum,)
lst.mat <- list(B = B, M1 = M1, M2 = M2, X = X)
lst.array <- list(A = A, A1 = A1, A2 = A2, A3 = A3, A4 = A4, A5 = A5)

# create nested list
lst.master = list(lst.vec = lst.vec, lst.mat = lst.mat, lst.array = lst.array)

# remove members from sublists
lst.master[[1]][[1]] <- NULL # remove v
lst.master[[2]][[2]] <- NULL # remove M1
lst.master[[3]][[1]] <- NULL # remove A

# create list of mixed data types (that were removed)
lst.mix <- list(v = v, M1 = M1, A = A)

# nest mixed data types list to master list
lst.master[[4]] <- lst.mix
names(lst.master)[4] <- "lst.mix"

# unlist elements to vector
vec.master <- unlist(lst.master)
length(vec.master)
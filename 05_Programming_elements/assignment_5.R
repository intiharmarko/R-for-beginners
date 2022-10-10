# Assignment 5


# Task 1

# Simulate 1 coin toss using sample()
sample(x = c(0,1), size = 1, replace = T, prob = c(.5, .5))

# Simulate coin toss 10 times
sample(x = c(0,1), size = 10, replace = T, prob = c(.5, .5))

# Simulate coin toss (10 different coins), each coin tossed 5 times (use replicate)
replicate(10, sample(x = c(0,1), size = 5, replace = T, prob = c(.5, .5)))


# Task 2

# Write a funcion coin_toss (throw one or more coins, one or more times)
#   output matrix: rows - throw, columns - coins
#   matrix rownames: throw(nr. throws)
#   matrix colnames: coin(nr. coins)
#   defaul values

coin_toss <- function(nr_coins = 1, nr_throws = 1, heads_prob = .5){
  outcomes <- c(0,1) # 0 - tails  1 - heads
  outcomes_prob <- c(1-heads_prob, heads_prob) # probability for tails and heads
  
  # coin toss simulation
  tosses <- replicate(nr_coins, sample(x = outcomes, size = nr_throws, replace = T, prob = outcomes_prob))
  
  # matrix row/col names (check if dimension exists)
  if(!is.null(dim(tosses))){
    rownames(tosses) <- paste("throw", 1:nr_throws, sep = "")
    colnames(tosses) <- paste("coin", 1:nr_coins, sep = "")
  }
  
  return(tosses)
}

# test function for 5 coins and 20 tosses
coin_toss(nr_coins = 5, nr_throws = 20)


# Task 3

# check probabilities for heads through simulations

# throw 1 coin 10, 100, 1000, 10000 times (calculate mean of tosses)
toss_1c_10t <- coin_toss(nr_coins = 1, nr_throws = 10)
mean(toss_1c_10t)

toss_1c_100t <- coin_toss(nr_coins = 1, nr_throws = 100)
mean(toss_1c_100t)

toss_1c_1000t <- coin_toss(nr_coins = 1, nr_throws = 1000)
mean(toss_1c_1000t)

toss_1c_10000t <- coin_toss(nr_coins = 1, nr_throws = 10000)
mean(toss_1c_10000t)

# throw 10 coins 100 times (calculate mean for each coin and total mean)
toss_10c_100t <- coin_toss(nr_coins = 10, nr_throws = 100)
apply(X = toss_10c_100t, MARGIN = 2, FUN = mean)
mean(apply(X = toss_10c_100t, MARGIN = 2, FUN = mean))

# throw 100 coins 10 times (calculate mean for each coin and total mean)
toss_100c_10t <- coin_toss(nr_coins = 100, nr_throws = 10)
apply(X = toss_100c_10t, MARGIN = 2, FUN = mean)
mean(apply(X = toss_100c_10t, MARGIN = 2, FUN = mean))


# Task 4

# Write a funcion dice_throw (throw one or more dicess, one or more times)
#   output matrix: rows - throw, columns - dices
#   matrix rownames: throw(nr. throws)
#   matrix colnames: dice(nr. coins)
#   defaul values

dice_throw <- function(nr_dices = 1, nr_throws = 1, dice_probs = rep(1/6, 6)){
  outcomes <- c(1,2,3,4,5,6) 
  outcomes_prob <- dice_probs # probability for each dice number
  
  # dice throw simulation
  throws <- replicate(nr_dices, sample(x = outcomes, size = nr_throws, replace = T, prob = outcomes_prob))
  
  # matrix row/col names (check if dimension exists)
  if(!is.null(dim(throws))){
    rownames(throws) <- paste("throw", 1:nr_throws, sep = "")
    colnames(throws) <- paste("dice", 1:nr_dices, sep = "")
  }
  
  return(throws)
}

# test function for default values & for 5 throws 2 dices
dice_throw()
dice_throw(nr_dices = 2, nr_throws = 5)


# check mean value of dice values through simulations

# throw 1 dice 10, 100, 1000, 10000 times (calculate mean of throws)
throw_1d_10t <- dice_throw(nr_dices = 1, nr_throws = 10)
mean(throw_1d_10t)

throw_1d_100t <- dice_throw(nr_dices = 1, nr_throws = 100)
mean(throw_1d_100t)

throw_1d_1000t <- dice_throw(nr_dices = 1, nr_throws = 1000)
mean(throw_1d_1000t)

throw_1d_10000t <- dice_throw(nr_dices = 1, nr_throws = 10000)
mean(throw_1d_10000t)


# throw 10 dices 100 times (calculate mean for each dice and total mean)
throw_10d_100t <- dice_throw(nr_dices = 10, nr_throws = 100)
apply(X = throw_10d_100t, MARGIN = 2, FUN = mean)
mean(apply(X = throw_10d_100t, MARGIN = 2, FUN = mean))


# throw 100 dices 10 times (calculate mean for each dice and total mean)
throw_100d_10t <- dice_throw(nr_dices = 100, nr_throws = 10)
apply(X = throw_100d_10t, MARGIN = 2, FUN = mean)
mean(apply(X = throw_100d_10t, MARGIN = 2, FUN = mean))


# save both functions to script throw_dice_coin.R

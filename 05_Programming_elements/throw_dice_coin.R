

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
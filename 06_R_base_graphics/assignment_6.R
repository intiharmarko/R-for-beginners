# Assignment 6


# Task 1

# diamonds dataset
library(ggplot2) # ggplot library for the dataset

df <- diamonds # get whole diamonds dataset

set.seed(11235)
sel.rand.rows <- sample(x = 1:nrow(df), size = 5000, replace = F) # random selected rows

df <- df[sel.rand.rows,] # keep only randomly selected rows

# calculate volume of a diamond
df$vol <- df$x * df$y * df$z


# Scatterplot diamond price VS volume

# draft of scatterplot
plot(x = df$vol, 
     y = df$price, 
     main = "Diamond prices",
     xlab = "Volume (mm3)",
     ylab = "Price (USD)",
     xlim = c(0,500),
     font.main = 2,
     cex.main = 1.5,
     font.lab = 4,
     cex.lab = 1.1)

# save scatter plot to pdf
pdf("diamond_prices.pdf",
    width = 11.7, 
    height = 8.3)
plot(x = df$vol, 
     y = df$price, 
     main = "Diamond prices",
     xlab = "Volume (mm3)",
     ylab = "Price (USD)",
     xlim = c(0,500),
     font.main = 2,
     cex.main = 1.5,
     font.lab = 4,
     cex.lab = 1.1)
dev.off()

# Scatterplot diamond price VS volume subplot by cut

# get unique cut
diamond.cuts <- as.character(levels(df$cut))

# colors for each cut
cut.colors <- c("gray87", "blanchedalmond", "cadetblue1", "gold", "gold3")

# Loop over each cut and draw plot
par(mfrow = c(3,2))

i <- 1
for(cut_ in diamond.cuts){
  df_temp <- subset(df, cut == cut_) # subset by cut
  
  plot(x = df_temp$vol, 
       y = df_temp$price, 
       col = cut.colors[i],
       main = paste("Diamond prices (cut-", cut_, ")", sep = ""),
       xlab = "Volume (mm3)",
       ylab = "Price (USD)",
       xlim = c(0,500),
       font.main = 2,
       cex.main = 1.5,
       font.lab = 4,
       cex.lab = 1.1)
  i <- i + 1
}

# Repeat loop and save plot to pdf
pdf("diamond_prices_by_cut.pdf",
    width = 11.7, 
    height = 8.3)
par(mfrow = c(3,2))

i <- 1
for(cut_ in diamond.cuts){
  df_temp <- subset(df, cut == cut_) # subset by cut
  
  plot(x = df_temp$vol, 
       y = df_temp$price, 
       col = cut.colors[i],
       main = paste("Diamond prices (cut- '", cut_, "')", sep = ""),
       xlab = "Volume (mm3)",
       ylab = "Price (USD)",
       xlim = c(0,500),
       font.main = 2,
       cex.main = 1.5,
       font.lab = 4,
       cex.lab = 1.1)
  i <- i + 1
}
dev.off()



# Task 2

source("throw_dice_coin.R") # load functions

set.seed(11235)

# generate coin tosses (10x, 20x, 50x, 100x)
toss10 <- coin_toss(nr_coins = 1, nr_throws = 10)
toss20 <- coin_toss(nr_coins = 1, nr_throws = 20)
toss50 <- coin_toss(nr_coins = 1, nr_throws = 50)
toss100 <- coin_toss(nr_coins = 1, nr_throws = 100)

pdf("toss_coins_multiple_times.pdf",
    width = 11.7, 
    height = 8.3)
par(mfrow = c(2,2))
barplot(table(toss10), 
        names.arg = c("Tails", "Heads"),
        main = "Toss coin 10 times")
barplot(table(toss20), 
        names.arg = c("Tails", "Heads"),
        main = "Toss coin 20 times")
barplot(table(toss50), 
        names.arg = c("Tails", "Heads"),
        main = "Toss coin 50 times")
barplot(table(toss100), 
        names.arg = c("Tails", "Heads"),
        main = "Toss coin 100 times")
dev.off()



# Task 3

# coin toss 15 times - 500 cycles
toss15.500 <- coin_toss(nr_coins = 500, nr_throws = 15)

# calculate sum of tosses(nr. of heads in each cycle)
toss15.500.heads <- apply(X = toss15.500, MARGIN = 2, FUN = sum)

# Distribution of heads for given cycles
par(mfrow = c(1,1))
hist(x = toss15.500.heads, 
     breaks = 15,
     probability = T,
     xlab = "Number of heads",
     main = "Coin toss - 500 cycles",
     xlim = c(0,15))
abline(v = 7.5, 
       col = "brown1", 
       lwd = 3, 
       lty = 2)

# Simulation - distribution of heads different number of cycles
cycles <- c(10, 50, 100, 500, 1000, 5000)

pdf("coin_toss_nr_heads_different_cycles.pdf",
    width = 11.7, 
    height = 8.3)
par(mfrow = c(3,2))

i <- 1
for(cycle in cycles){
  toss15.x <- coin_toss(nr_coins = cycle, nr_throws = 15)
  toss15.x.heads <- apply(X = toss15.x, MARGIN = 2, FUN = sum)
  
  hist(x = toss15.x.heads, 
       breaks = 15,
       probability = T,
       xlab = "Number of heads",
       main = paste("Coin toss - ", cycle, " cycles", sep = ""),
       xlim = c(0,15))
  abline(v = 7.5, 
         col = "brown1", 
         lwd = 3, 
         lty = 2)
  i <- i + 1
}
dev.off()



# Task 4

# Dice throwing

# Game 1:
# - 3 players
# - 1 dice
# - 50 throws 
# - winner: max sum of all numbers on dice (all throws)

# Game simulation
game1 <- replicate(3, dice_throw(nr_dices = 1, nr_throws = 50))
dimnames(game1)[[3]] <- c("player1", "player2", "player3")

# Distribution of throws (scatterplot)
par(mfrow = c(1,1))

plot(x = 1:dim(game1)[1], 
     y = game1[,,"player1"], 
     main = "Actual throws",
     xlab = "Throw(i)", 
     ylab = "Number on dice",
     pch = 1,
     col = "brown1",
     ylim = c(0, 8))
points(x = 1:dim(game1)[1], 
       y = game1[,,"player2"], 
       pch = 3,
       col = "deepskyblue1")
points(x = 1:dim(game1)[1], 
       y = game1[,,"player3"], 
       pch = 22,
       col = "black")
legend("topleft", 
       col = c("brown3", "deepskyblue", "black"),
       pch = c(1,3,22), 
       legend = c("player1", "player2", "player3"))

# Cumulative sum of numbers on dice (all throws)
game1.cumsum <- apply(X = game1, MARGIN = 3, FUN = cumsum)
plot(x = 1:nrow(game1.cumsum),
     y = game1.cumsum[,1], 
     main = "Cumulative sum of numbers (on dice)",
     xlab = "Throw(i)",
     ylab = "Cumulative sum",
     type = "l", 
     col = "brown1")
lines(x = 1:nrow(game1.cumsum),
      y = game1.cumsum[,2], 
      type = "l", 
      col = "deepskyblue1")
lines(x = 1:nrow(game1.cumsum),
      y = game1.cumsum[,3], 
      type = "l", 
      col = "black")
legend("topleft", 
       col = c("brown3", "deepskyblue", "black"),
       lty = c(1,1,1), 
       legend = c("player1", "player2", "player3"))

# Distribution of throws
par(mfrow = c(1,3))
hist(x = game1[,,"player1"], breaks = 6, freq = F, col = "brown3", main = "Player 1 - distribution of throws", xlab = "")
hist(x = game1[,,"player2"], breaks = 6, freq = F, col = "deepskyblue", main = "Player 2 - distribution of throws", xlab = "")
hist(x = game1[,,"player3"], breaks = 6, freq = F, col = "gray", main = "Player 3 - distribution of throws", xlab = "")

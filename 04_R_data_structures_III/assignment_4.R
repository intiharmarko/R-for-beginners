# Assignment 4

# download assignment_4_data.zip from course and copy it to project folder and unzip it!!!

# Task 1

coins2014 <- read.table(file = "./assignment_4_data/coin_prices_2014.txt", header = T, sep = "\t")
coins2015 <- read.table(file = "./assignment_4_data/coin_prices_2015.txt", header = T, sep = "\t")
coins2016 <- read.table(file = "./assignment_4_data/coin_prices_2016.txt", header = T, sep = "\t")
coins2017 <- read.table(file = "./assignment_4_data/coin_prices_2017.txt", header = T, sep = "\t")

coins <- rbind(coins2014, coins2015, coins2016, coins2017)

rm(coins2014, coins2015, coins2016, coins2017)


# Task 2

# check structure of DF
str(coins)

# check number of rows
nrow(coins)

# check number of cols
ncol(coins)

# print column names
colnames(coins)

# use head on DF
head(coins)

# Convert date to date format 
# Caution first convert to character then to date!!!
coins$DATE <- as.Date(as.character(coins$DATE), format = "%Y-%m-%d")

coins <- coins[order(coins$DATE, coins$COIN),] # order by date and coin

# Check levels of factor variables
levels(coins$COIN)
levels(coins$COIN_ABR)

# get distinct dates (save to dates)
dates <- unique(coins$DATE)

# save number of distinct dates in nr_days
nr_days <- length(dates)


# Task 3

# create dates variables: YEAR, MONTH, DOM, DOW numeric 0-6, WEEK
coins$YEAR <- as.numeric(format(coins$DATE, "%Y"))
coins$MONTH <- as.numeric(format(coins$DATE, "%m"))
coins$DOM <- as.numeric(format(coins$DATE, "%d"))
coins$DOW <- as.numeric(format(coins$DATE, "%w"))
coins$WEEK <- as.numeric(format(coins$DATE, "%W"))

# calculate min/max/average/median prices for all coins (columns OPEN HIGH LOW CLOSE)
min_prices <- apply(X = coins[,4:7], MARGIN = 2, FUN = min)
max_prices <- apply(X = coins[,4:7], MARGIN = 2, FUN = max)
mean_prices <- apply(X = coins[,4:7], MARGIN = 2, FUN = mean)
median_prices <- apply(X = coins[,4:7], MARGIN = 2, FUN = median)


# split data frame to 4 data frames for each coin, name DFs with coin names
bitcoin <- coins[coins$COIN == "bitcoin", ]
ethereum <- coins[coins$COIN == "ethereum", ]
litecoin <- coins[coins$COIN == "litecoin", ]
ripple <- coins[coins$COIN == "ripple", ]

# remove coins data frame
rm(coins)

# use summary on each coin DF
summary(bitcoin)
summary(ethereum)
summary(litecoin)
summary(ripple)


# Task 4

# save bitcoin: bitcoin.txt, tab as separator, colnames, no quotes
write.table(x = bitcoin, file = "./assignment_4_data/bitcoin.txt", sep = "\t", col.names = T, row.names = F, quote = F)

# save ethereum: ethereum.txt, ";" as separator, no colnames, rownames, quotes
write.table(x = ethereum, file = "./assignment_4_data/ethereum.txt", sep = ";", col.names = F, row.names = T, quote = T)

# save litecoin: litecoin.csv, "," as separator, colnames, no rownames, no quotes
write.table(x = litecoin, file = "./assignment_4_data/litecoin.csv", sep = ",", col.names = T, row.names = F, quote = F)

# save ripple: ripple.xlsx, with colnames
library(writexl)
writexl::write_xlsx(x = ripple, path = "./assignment_4_data/ripple.xlsx", col_names = T)


# Casino winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# Create logical vector corresponding to profitable poker days: selection_vector
selection_vector<-poker_vector>0
selection_vector

# Select amounts for profitable poker days: poker_profits
poker_profits<-poker_vector[selection_vector]
poker_profits

# Select amounts for profitable roulette days: roulette_profits
roulette_profits<-roulette_vector[roulette_vector>0]
roulette_profits

# Sum of the profitable roulette days: roulette_total_profit
roulette_total_profit<-sum(roulette_profits)
roulette_total_profit

# Number of profitable roulette days: num_profitable_days
num_profitable_days<-sum(roulette_vector>0)
num_profitable_days
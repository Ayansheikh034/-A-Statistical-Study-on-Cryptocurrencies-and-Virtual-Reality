library(readxl)
d=read_xlsx("D:\\ST 402 Project\\data\\metaverse tokens\\four tokens\\Axie Infinity.xlsx")
attach(d)
states = ifelse(Return > 0, "birth", "death")


lambda = sum(states == "birth") / length(states)  # birth rate
mu = sum(states == "death") / length(states)  # death rate

X = rep(0, length(Return))
X[1] = as.numeric(states[1] == "birth")


for (t in 2:length(X)) {
  if (X[t - 1] == 0) {  
    X[t] = rbinom(1, 1, lambda / (lambda + mu))  
  } else {  
    X[t] = rbinom(1, 1, 1 - mu / (lambda + mu))  
  }
}


simulated_returns = X
simulated_returns[X == 0] = -abs(Return[X == 0])  # 'death' states correspond to negative returns
simulated_returns[X == 1] = abs(Return[X == 1])  # 'birth' states correspond to positive returns


transition_count_matrix = table(states[-length(states)], states[-1])
tpm= prop.table(transition_count_matrix, 1);tpm

plot(simulated_returns, type = "l")

# Stationary distribution
stationary_distribution = eigen(t(tpm))$vectors[,1]
stationary_distribution = Re(stationary_distribution / sum(stationary_distribution)); stationary_distribution




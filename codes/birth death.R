library(readxl)
library(markovchain)
d1=read_xlsx("D:\\ST 402 Project\\data\\metaverse tokens\\four tokens\\Axie Infinity.xlsx")
#View(d)
attach(d1)
###Axie infinity
states = ifelse(Return > 0, "birth", "death")
# Load the required library
library(stats4)

# Define the likelihood function for a Birth-Death process
likelihood <- function(lambda, mu) {
  p = lambda / (lambda + mu)
  logL=sum(dbinom(x = as.numeric(states == "birth"), size = 1, prob = p, log = TRUE))
  return(-logL)
}

# Use MLE to estimate the parameters
mle_results <- mle(likelihood, start = list(lambda = 0.5, mu = 0.5))

# Print the estimated parameters
est=coef(mle_results)


n_folds <- 100

# Calculate the size of each fold
fold_size <- length(Return) / n_folds

# Initialize a vector to store the accuracy for each fold
accuracy =accuracy1<- rep(0, n_folds)

# Perform cross-validation
for (i in 1:n_folds) {
  # Define the indices for the test set
  test_indices <- ((i-1)*fold_size + 1):(i*fold_size)
  
  # Split the data into a training set and a test set
  train_Return <- Return[-test_indices]
  test_Return <- Return[test_indices]
  
  # Estimate parameters from the training set
  train_states <- ifelse(train_Return > 0, "birth", "death")
  lambda =est["lambda"]
  mu =est["mu"]
  
  # Initialize the state variable
  X <- rep(0, length(test_Return))
  X[1] <- as.numeric(train_states[1] == "birth")
  
  # Simulate the Birth-Death process
  for (t in 2:length(X)) {
    if (X[t - 1] == 0) {  
      X[t] <- rbinom(1, 1, lambda / (lambda + mu))  
    } else {  
      X[t] <- rbinom(1, 1, 1 - mu / (lambda + mu))  
    }
  }
  
  # Generate simulated returns
  simulated_returns <- X
  simulated_returns[X == 0] <- -abs(test_Return[X == 0])
  simulated_returns[X == 1] <- abs(test_Return[X == 1])
  
  # Calculate the accuracy for this fold
  accuracy[i] <- mean((test_Return- simulated_returns)^2)
  accuracy1[i] <- cor(test_Return,simulated_returns)
}

# Print the average accuracy across all folds
acc=mean(accuracy);acc
acc1=mean(accuracy1);acc1
#############################################################



d2=read_xlsx("D:\\ST 402 Project\\data\\metaverse tokens\\four tokens\\Sandbox.xlsx")
#View(d)
attach(d2)
###Sandbox
states = ifelse(Return > 0, "birth", "death")

states = ifelse(Return > 0, "birth", "death")
# Load the required library
library(stats4)

# Define the likelihood function for a Birth-Death process
likelihood <- function(lambda, mu) {
  p = lambda / (lambda + mu)
  logL=sum(dbinom(x = as.numeric(states == "birth"), size = 1, prob = p, log = TRUE))
  return(-logL)
}

# Use MLE to estimate the parameters
mle_results <- mle(likelihood, start = list(lambda = 0.5, mu = 0.5))

# Print the estimated parameters
est=coef(mle_results)


n_folds <- 100

# Calculate the size of each fold
fold_size <- length(Return) / n_folds

# Initialize a vector to store the accuracy for each fold
accuracy =accuracy1<- rep(0, n_folds)

# Perform cross-validation
for (i in 1:n_folds) {
  # Define the indices for the test set
  test_indices <- ((i-1)*fold_size+0.5 ):(i*fold_size)
  
  # Split the data into a training set and a test set
  train_Return <- Return[-test_indices]
  test_Return <- Return[test_indices]
  
  # Estimate parameters from the training set
  train_states <- ifelse(train_Return > 0, "birth", "death")
  lambda =est["lambda"]
  mu =est["mu"]
  
  # Initialize the state variable
  X <- rep(0, length(test_Return))
  X[1] <- as.numeric(train_states[1] == "birth")
  
  # Simulate the Birth-Death process
  for (t in 2:length(X)) {
    if (X[t - 1] == 0) {  
      X[t] <- rbinom(1, 1, lambda / (lambda + mu))  
    } else {  
      X[t] <- rbinom(1, 1, 1 - mu / (lambda + mu))  
    }
  }
  
  # Generate simulated returns
  simulated_returns <- X
  simulated_returns[X == 0] <- -abs(test_Return[X == 0])
  simulated_returns[X == 1] <- abs(test_Return[X == 1])
  
  # Calculate the accuracy for this fold
  accuracy[i] <- mean((test_Return- simulated_returns)^2)
  accuracy1[i] <- cor(test_Return,simulated_returns)
}

# Print the average accuracy across all folds
acc=mean(accuracy);acc
acc1=mean(accuracy1);acc1

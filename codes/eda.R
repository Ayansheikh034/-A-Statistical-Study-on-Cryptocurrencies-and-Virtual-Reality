# Load necessary libraries
library(ggplot2)
library(dplyr)

data=read.csv("D:\\ST 402 Project\\data\\metaverse tokens\\Metaverse coins\\1BOX.csv")

data$Date <- as.Date(data$Date, format = "%d-%m-%Y")

# Trend Analysis
ggplot(data, aes(x=Date, y=Close)) + geom_line()

# Volatility Measurement
data$Volatility=data$High - data$Low

# Volume Analysis
summary(data$Volume)

# Return Calculation
data$Return=c(0, diff(data$Close)) / lag(data$Close)

# Correlation Analysis
cor(data$Volume, data$Volatility)
View(data)





########## Analysis on Volatility###########################

library(fGarch)  # for GARCH model


# Volatility Clustering Analysis
ggplot(data, aes(x=Date, y=Volatility)) + geom_line()

# Autocorrelation of Volatility
acf(data$Volatility)

# GARCH Model
garch_model = garchFit(~ garch(1, 1), data = data$Volatility, trace = F)
summary(garch_model)

################# For volatility cones#######################

#install.packages(c("quantmod", "PerformanceAnalytics","zoo"))

library(quantmod)
library(PerformanceAnalytics)
library(zoo)


# Calculate rolling standard deviation with a window of 60 days
rolling_sd = rollapply(data$Return, width = 60, FUN = sd, na.pad = TRUE)

plot(rolling_sd, main = "Volatility Cone", ylab = "Standard Deviation")

plot(rolling_sd, main = "Rolling Standard Deviation", ylab = "Standard Deviation", xlab = "Index")
plot(rolling_mean, main = "Rolling mean", ylab = "mean", xlab = "Index")



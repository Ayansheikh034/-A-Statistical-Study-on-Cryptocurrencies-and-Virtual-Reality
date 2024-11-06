###Axie Infinity
#install.packages("readxl")
library(readxl)
library(tseries)
d=read_xlsx("D:\\ST 402 Project\\data\\metaverse tokens\\four tokens\\Axie Infinity.xlsx")
View(d)
dim(d)
par(mfrow=c(1,3))
plot(d$Date ,d$Return, type="l", xlab="Date", ylab="Return",
     main = "Axie Infinity return")
# looking at the graph, the series appears to fluctuate around 0,
# large changes are followed by large changes and small change is followed by small changes
# That may exhibit volatility clustering, we further confirm that by garch effect
acf(d$Return, main="ACF of Axie Infinity")
pacf(d$Return, main="PACF of Axie Infinity")
# So from the acf and pacf plot, it is quite obvious that
# We further confirm this by stationarity test
adf.test(d$Return)
# pvalue<0.05, we reject the null hypothesis ie the series is stationary
pp.test(d$Return)
# pvalue<0.05, we reject the null hypothesis ie the series is stationary
kpss.test(d$Return)
# pvalue<0.05, we reject the null hypothesis ie the series is not stationary

library(FinTS)
ArchTest(d$Return)
# pvalue > 0.05, we fail to reject the null hypothesis ie there is no ARCH effects

library(tseries)
library(forecast)
a=auto.arima(d$Return)
a
# The series can be modeled by ARIMA(1,1,1)

library(ggfortify)
ggtsdiag(a)

############3
data=d$Return
# Load necessary packages

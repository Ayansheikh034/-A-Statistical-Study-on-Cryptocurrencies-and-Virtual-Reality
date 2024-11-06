
### Time dependency analysis 
## this currency is BTC base on the USD currency

BTC=read.csv("D:/ST 402 Project/data/B_E_L Metaverse Tokens/BTC_USD_2020-03-29-CoinDesk.csv")
colnames(BTC)=c("currency","Date","Close","Open","High","Low")
View(BTC)
attach(BTC)
##based on the Returns we are going to compare the cryptocurrencies and Metaverse Tokens 
### how much the risk is invoing this this to 
#compare the this two in on the basis of their return values.

BTC$returns = c(0, diff(BTC$Close) / head(BTC$Close, -1))

plot(BTC$returns, type="l")
acf(BTC$returns)
pacf(BTC$return)
library(tseries)
adf.test(BTC$returns) 
pp.test(BTC$returns)
kpss.test(BTC$returns)
library(FinTS)
ArchTest(BTC$returns)



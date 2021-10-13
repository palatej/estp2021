library(RJDemetra)
source("./R files/utility.R")

arma.compare<-function(s){
  spec<-regarima_spec_x13("RG0", arima.mu=F, tradingdays.option="TradingDays")
  ma1<-regarima(s, spec)
  spec<-regarima_spec_x13("RG0", arima.mu=F, arima.p=1, arima.q=0, tradingdays.option="TradingDays")
  ar1<-regarima(s, spec)
  return(c(ma1$loglik[1], ar1$loglik[1]))
}

all<-sapply(indprod, function(z){return (arma.compare(log(z)))})

matplot(t(all), pch=18)
plot(all[1,]-all[2,], type='h')

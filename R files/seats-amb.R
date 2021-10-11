suppressPackageStartupMessages(library(rjd3tramoseats))
# Display only
library(rjd3arima)

airline.decomposition<-function(period, th, bth){
  sarima<-rjd3modelling::sarima.model("m", period, NULL, 1, th, NULL, 1, bth)
  return (seats.decompose(sarima))
}

airline.variances<-function(period, th, bth){
  ucm<-airline.decomposition(period, th, bth)
  if (is.null(ucm)) return (c(NA, NA, NA)) else return (c(ucm$components[[1]]$var, 
                                                          ucm$components[[2]]$var, 
                                                          ucm$components[[4]]$var))
}


vars<-sapply(seq(.3, -.99, -.01), function(bth){return (airline.variances(24,-.5, bth))})

# trend
matplot(t(vars), type = 'b', pch=18)

ucm1<-airline.decomposition(12,-.8,-.7)

twk1<-ucarima.wk(ucm1, 1)
plot(twk1$gain2, type='l')

ucm2<-airline.decomposition(12,.1,-.7)

twk2<-ucarima.wk(ucm2, 1)
lines(twk2$gain2, col="blue")

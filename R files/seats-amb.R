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

print(airline.decomposition(4,-.8,-.7))

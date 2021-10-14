suppressPackageStartupMessages(library(RJDemetra))
suppressPackageStartupMessages(library(RJDemetra3))

myQR<-function(q){
  mul<-q$decomposition$mode=="Multiplicative"
  a<-q$diagnostics$variance_decomposition
  a<-100*a[1:4,]/sum(a[1:4,])
  var<-data.frame(contribution=a, row.names = c("Cycle", "Seas", "Irr", "TD&Hol"))
  
  # alternative (probably better)
  # remove the trend of the series using a simple filter (12x2)
  if (mul){
    si<-q$decomposition$components[,"s_cmp"]*q$decomposition$components[,"i_cmp"]
  }else{
    si<-q$decomposition$components[,"s_cmp"]+q$decomposition$components[,"i_cmp"]
  }
  ct<-rjd3sa::seasonality.combined(si, 12, 1, mul)
  
  # residual seasonality on sa
  rseasf<-rjd3sa::seasonality.f(q$decomposition$components[,"sa_cmp"], period=12, model='D1')
  rseasqs<-rjd3sa::seasonality.qs(q$decomposition$components[,"sa_cmp"], period=12)
  
  # residual trading days on sa
  rtd<-rjd3sa::td.f(q$decomposition$components[,"sa_cmp"], model='R011')
  
  return (list(seasonality=ct, residualseasonality=list(f=rseasf, qs=rseasqs), vardecomposition=var, residualtd=rtd))
}
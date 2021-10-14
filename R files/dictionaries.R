library(RJDemetra)

jts<-RJDemetra::jtramoseats(indprod$M.PROD.C.NSA.I15.DE, "RSAfull")
JD_DIC<-RJDemetra::get_dictionary(jts)

s<-indprod$M.PROD.C.NSA.I15.DE

q<-RJDemetra::tramoseats(s, "RSAfull", JD_DIC[200:235])
var<-q$user_defined$diagnostics.variancedecomposition
cat(var[1:4]/sum(var[1:4])*100, '\n')

# or (see documentation)

indicators<-RJDemetra::get_indicators(jts, JD_DIC[235])
var2<-indicators$diagnostics.variancedecomposition
cat(var2[1:4]/sum(var2[1:4])*100, '\n')
q2<-RJDemetra::jSA2R(jts)

# get backcasts/forecasts
indicators<-RJDemetra::get_indicators(jts, "preprocessing.model.bcasts(24)", "preprocessing.model.fcasts(24)")
ts.plot(ts.union(indicators[[1]], indprod$M.PROD.C.NSA.I15.DE, indicators[[2]]), col=c("blue", "gray", "red"))

allq<-RJDemetra::get_indicators(jts, JD_DIC)

suppressPackageStartupMessages(library(rjd3tramoseats))

s<-retail$ShoeStores

sa<-fast.tramoseats(s, "rsafull")

ssa<-sa$decomposition$stochastics$sa$data

a<-sapply(8:20, function(j){rjd3sa::td.f(ssa, model = "D1", nyears = j)$pvalue})
b<-sapply(8:20, function(j){rjd3sa::td.f(ssa, model = "R011", nyears = j)$pvalue})
c<-sapply(8:20, function(j){rjd3sa::td.f(ssa, model = "R100", nyears = j)$pvalue})

matplot(cbind(a,b,c), pch=18)

sirr<-sa$decomposition$stochastics$i$data

a<-sapply(8:20, function(j){rjd3sa::td.f(sirr, model = "D1", nyears = j)$pvalue})
b<-sapply(8:20, function(j){rjd3sa::td.f(sirr, model = "WN", nyears = j)$pvalue})
c<-sapply(8:20, function(j){rjd3sa::td.f(sirr, model = "R100", nyears = j)$pvalue})

matplot(cbind(a,b,c), pch=18)

test<-rjd3sa::td.f(log(s), model = "DYD1", nyears =0)
print(test)
test<-rjd3sa::td.f(log(s), model = "AIRLINE", nyears =0)
print(test)
library(RJDemetra)

spec1<-tramoseats_spec("RSAfull")

spec2<-tramoseats_spec(spec1, estimate.last=120)

q1<-tramoseats(indprod$M.PROD.C.NSA.I15.DE, spec1)
q2<-tramoseats(indprod$M.PROD.C.NSA.I15.DE, spec2)

ts.plot(ts.union(q1$final$series[,"sa"], q2$final$series[,"sa"]), col=c("gray", "blue"))

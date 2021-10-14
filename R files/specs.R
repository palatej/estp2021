library(RJDemetra)

spec1<-tramoseats_spec("RSAfull")
q1<-tramoseats(indprod$M.PROD.C.NSA.I15.DE, spec1)

spec2<-tramoseats_spec(spec1, estimate.last=120)
q2<-tramoseats(indprod$M.PROD.C.NSA.I15.DE, spec2)

ts.plot(ts.union(q1$final$series[,"sa"], q2$final$series[,"sa"]), col=c("gray", "blue"))

spec3<-tramoseats_spec(spec1, transform.function="Log", usrdef.outliersEnabled = T, usrdef.outliersType = c("AO", "AO", "AO"), 
                       usrdef.outliersDate = c("2020-03-01", "2020-04-01", "2020-05-01"))
q3<-tramoseats(indprod$M.PROD.C.NSA.I15.DE, spec3)

all<-sapply(indprod, function(z){RJDemetra::tramoseats(z, spec3)$diagnostics$variance_decomposition})


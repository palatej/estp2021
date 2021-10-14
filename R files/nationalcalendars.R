suppressPackageStartupMessages(library(RJDemetra))
suppressPackageStartupMessages(library(RJDemetra3))

cal<-calendar.new()
calendar.holiday(cal, "NEWYEAR")
calendar.holiday(cal, "EASTERMONDAY")
calendar.holiday(cal, "MAYDAY")
calendar.holiday(cal, "ASCENSION")
calendar.holiday(cal, "WHITMONDAY")
calendar.fixedday(cal, 7, 21)
calendar.holiday(cal, "ASSUMPTION")
calendar.holiday(cal, "ALLSAINTDAY")
calendar.holiday(cal, "ARMISTICE")
calendar.holiday(cal, "CHRISTMAS")

#leap year. Will be available with the calendars in rjd3modelling
lp<-function(frequency, y0, nyears){
  
  if (frequency == 12) p0=2 else p0=1
  d<-rep(0, frequency*nyears)
  d[seq(p0, length(d), frequency)]<- -.25
  del<-(4-(y0%%4))%%4
  p0<-p0+del*frequency
  d[seq(p0, length(d), frequency*4)]<-.75
  return (ts(d, frequency = frequency, start=c(y0, 1)))  
}


td6.be<-rjd3modelling::htd(calendar = cal, frequency = 12, start = c(1980, 1), length = 600, groups = c(1,2,3,4,5,6,0), contrasts = T)
td2.be<-rjd3modelling::htd(calendar = cal, frequency = 12, start = c(1980, 1), length = 600, groups = c(1,1,1,1,1,0,0), contrasts = T)
td3.be<-rjd3modelling::htd(calendar = cal, frequency = 12, start = c(1980, 1), length = 600, groups = c(1,1,1,1,1,2,0), contrasts = T)

# Add LP
td7.be<-ts.union(ts(td6.be, frequency=12, start=c(1980,1)), lp(12, 1980, 50))
td2.be<-ts.union(ts(td2.be, frequency=12, start=c(1980,1)), lp(12, 1980, 50))
td3.be<-ts.union(ts(td3.be, frequency=12, start=c(1980,1)), lp(12, 1980, 50))

td2.be<-`colnames<-`(td2.be, c("wd","lp"))
td3.be<-`colnames<-`(td3.be, c("wd","sat", "lp"))
td7.be<-`colnames<-`(td7.be, c("mon","tue", "wed", "thu", "fri","sat", "lp"))

spec2.be<-RJDemetra::tramoseats_spec("RSAfull", 
                              tradingdays.option = "UserDefined",
                              usrdef.varEnabled=T, 
                              usrdef.var=td2.be, 
                              usrdef.varType=rep("Calendar", 2))
spec3.be<-RJDemetra::tramoseats_spec("RSAfull", 
                                     tradingdays.option = "UserDefined",
                                     usrdef.varEnabled=T, 
                                     usrdef.var=td3.be, 
                                     usrdef.varType=rep("Calendar", 3))
spec7.be<-RJDemetra::tramoseats_spec("RSAfull", 
                                     tradingdays.option = "UserDefined",
                                     usrdef.varEnabled=T, 
                                     usrdef.var=td7.be, 
                                     usrdef.varType=rep("Calendar", 7))

q2<-RJDemetra::tramoseats(indprod$M.PROD.C.NSA.I15.BE, spec2.be)
q3<-RJDemetra::tramoseats(indprod$M.PROD.C.NSA.I15.BE, spec3.be)
q7<-RJDemetra::tramoseats(indprod$M.PROD.C.NSA.I15.BE, spec7.be)

Q2<-RJDemetra::tramoseats(indprod$M.PROD.C.NSA.I15.BE, "RSA4")
Q7<-RJDemetra::tramoseats(indprod$M.PROD.C.NSA.I15.BE, "RSA5")

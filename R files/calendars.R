library(rjd3modelling)

e<-easter.dates(1900, 2100)

print(rjd3modelling::td(12, c(1980,1), 11, contrasts = F, groups = c(1,1,1,1,2,2,0)))

print(rjd3modelling::td(12, c(1980,1), 12, contrasts = T, groups = c(1,1,1,1,2,2,0)))

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
print(rjd3modelling::htd(cal, 12, c(1980,1), 24, contrasts = F, groups = c(1,1,1,1,2,2,0)))

print(rjd3modelling::htd(cal, 12, c(1980,1), 24, contrasts = T, groups = c(1,1,1,1,2,2,0)))

ltm<-longTermMean(cal, 12, groups = c(1,1,1,1,2,2,0))
print(ltm)
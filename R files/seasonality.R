suppressPackageStartupMessages(library(rjd3sa))

s<-retail$RetailSalesTotal
ls<-log(s)
st<-do.stationary(ls, 12)
dls<-st$ddata

spec.pgram(dls)

spec.ar(dls)

print(seasonality.qs(dls, 12))

# H0: the series has no seasonality
# pvalue = prob[x>T]
# pvalue nearly 0 -> w reject H0

print(seasonality.kruskalwallis(dls, 12))

print(seasonality.friedman(dls, 12))


# !!!

print(seasonality.qs(1:120, 12))

print(seasonality.friedman(1:120, 12))

# Other tests: uroot
# Canova-Hansen
# H0: stable seasonality

library(uroot)

uroot::ch.test(ls, lag1=T)


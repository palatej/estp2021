
wd<-getwd()

setwd(dir = "C:/LocalData/DEV/PALATEJ/R")

install.packages("rJava")
install.packages("RProtoBuf")

install.packages("rjd3toolkit_0.1.0.tar.gz", repos=NULL, type = "source", INSTALL_opts = "--no-multiarch")
install.packages("rjd3modelling_0.1.0.tar.gz", repos=NULL, type = "source", INSTALL_opts = "--no-multiarch")
install.packages("rjd3arima_0.1.0.tar.gz", repos=NULL, type = "source", INSTALL_opts = "--no-multiarch")
install.packages("rjd3sa_0.1.0.tar.gz", repos=NULL, type = "source", INSTALL_opts = "--no-multiarch")
install.packages("rjd3tramoseats_0.1.0.tar.gz", repos=NULL, type = "source", INSTALL_opts = "--no-multiarch")
install.packages("rjd3x13_0.1.0.tar.gz", repos=NULL, type = "source", INSTALL_opts = "--no-multiarch")
install.packages("rjdemetra3_0.1.0.tar.gz", repos=NULL, type = "source", INSTALL_opts = "--no-multiarch")
install.packages("rjd3sts_0.1.0.tar.gz", repos=NULL, type = "source", INSTALL_opts = "--no-multiarch")

setwd(dir = wd)


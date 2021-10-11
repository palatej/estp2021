suppressPackageStartupMessages(library(rjd3modelling))

airline<-sarima.model("airline", 12, d=1, theta = -.8, bd=1, btheta=-.6)

plot(sarima.random(airline, 600), type='l')

# complex root if phi(1)*phi(1)-4*phi(2) < 0
sarima<-sarima.model("airline", phi=-1.5, .9, 12, d=1, theta = -.8, bd=1, btheta=-.6)

plot(sarima.random(airline, 600, 10), type='l')


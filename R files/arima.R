
random.ar<-function(phi, length){
  
  start=rnorm(length(phi))
  all<-vector(length=length)
  for (i in seq_along(all)){
    cur<-start%*%phi+rnorm(1)
    all[[i]]<-cur
    start<-c(start[-1],cur)
  }
  return (unlist(all))
}

random.ma<-function(theta, length){
  
  c<-c(1, rev(theta))
  q<-length(theta)
  rnd=rnorm(q+length)
  all<-vector(length=length)
  for (i in seq_along(all)){
    cur<-c%*%rnd[seq(i, i+q)]
    all[[i]]<-cur
  }
  return (unlist(all))
}

random.arma<-function(theta, length){
  
  c<-c(1, rev(theta))
  q<-length(theta)
  rnd=rnorm(q+length)
  all<-vector(length=length)
  for (i in seq_along(all)){
    cur<-c%*%rnd[seq(i, i+q)]
    all[[i]]<-cur
  }
  return (unlist(all))
}
suppressPackageStartupMessages(library(RJDemetra))

#read a workspace
ws<-RJDemetra::load_workspace("C:/sarepository/estp.xml")

#compute the workspace
compute(ws)

#retrieve information

#first multi-processing
mp<-get_object(ws, 1)

#all sa-items form the multi-processing
items<-get_all_objects(mp)

#Display the first item
item1<-get_model(items[[1]], ws)

plot(item1, ask=F)

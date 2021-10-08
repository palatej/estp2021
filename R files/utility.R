library(xlsx)

ts.xlsx<-function(workbook, sheet, frequency, start){
  data<-xlsx::read.xlsx(workbook, sheet)
  # skip the first column (dates)
  data<-data[,-1]
  lapply(data, function(s){ts(s, frequency = frequency, start=start)})
}

indprod<-ts.xlsx('./Data/Excel/indprod.xlsx', 1, 12, c(2000,1))
setwd("/Users/iMac6/udata-aru.github.io/img")
pass<-data.frame(pass=c(1234,round(runif(9,1000,9999))))
write.table(pass,"pass.csv",sep = ";")           

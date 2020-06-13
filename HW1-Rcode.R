> covidD<- read_csv("Desktop/covid_19_data.csv")
> covidD<-subset(covidD,select=c(Date,Confirmed,Deaths,Recovered))

> USs <- read_csv("Desktop/^DJI.csv")
> Germanys <- read_csv("Desktop/^GDAXI.csv")
> Japans <- read_csv("Desktop/^N225.csv")
> USs <- subset(USs, select =c(Date,Close))
> colnames(USs)[2]<-"US"
> Germanys <- subset(Germanys, select =c(Date,Close))
> colnames(Chinas)[2]<-"China"
> colnames(Germanys)[2]<-"Germany"
> Japans <- subset(Japans, select =c(Date,Close))
> colnames(Japans)[2]<-"Japan"
> ChinaS <- subset(X399001_SZ, select =c(Date,Close))

> M5<-merge(USs,ChinaS, by = c("Date"))
> M6<-merge(M5,Germanys,by=c("Date"))
> FINAL<-merge(M6,Japans,by=c("Date"))
> colnames(FINAL)[3]<-"China"
> FINAL<-merge(covidD,FINAL,by=c("Date"))

> pairs(FINAL[2:8],pch=21)
> Correlation <- subset(FINAL, select =-c(Date))
> View(Correlation)
> round(cor(Correlation),2)
Confirmed Deaths Recovered   US China Germany Japan
Confirmed      1.00   0.85      0.40 0.04  0.05    0.05  0.06
Deaths         0.85   1.00      0.29 0.03  0.04    0.03  0.04
Recovered      0.40   0.29      1.00 0.04  0.05    0.04  0.06
US             0.04   0.03      0.04 1.00  0.71    0.97  0.94
China          0.05   0.04      0.05 0.71  1.00    0.68  0.67
Germany        0.05   0.03      0.04 0.97  0.68    1.00  0.98
Japan          0.06   0.04      0.06 0.94  0.67    0.98  1.00
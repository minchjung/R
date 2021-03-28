#Ch5 데이터 시각화 
install.packages("ggplot2")
library("ggplot2")
install.packages("scatterplot3d")
library("scatterplot3d")
appl<-read.csv(file="C:/Users/user/Desktop/AAPL.csv",header=TRUE)
tsl<-read.csv(file="C:/Users/user/Desktop/TSLA.csv",header=TRUE)
sam<-read.csv(file="C:/Users/user/Desktop/Sam.csv",header=TRUE)


plot(tsl$Volume,col='red',type="l",ann=F)
par(new=TRUE)
plot(appl$Volume,col='blue',type="l",axes=F)
par(new=TRUE)
plot(sam$Volume,col='green',type="l",axes=F)
plot(appl$Volume,pch=21,col='blue',bg='green',cex=0.2*appl$Var)

appVar = as.numeric(appl$Var)
tslVar = as.numeric(appl$Var2)

Dataf <-data.frame(table(appVar,tslVar))
names(Dataf)=c("applVar","tslVar","Freq")
Dataf


lengFunc<-function(ap,ts){
  if (max(ap)>max(ts)){
    closeLength<-max(ap)
  }else{
    closeLength<-max(ts)
  }
  return (closeLength)
}

clLeng = lengFunc(appl$Close,tsl$Close)
vrLeng = lengFunc(appl$Var,tsl$Var)
volLeng = lengFunc(appl$Volume,tsl$Volume)

clLeng
vrLeng
volLeng



scatterplot3d(appl$Close, appl$Var, appl$Volume,bg='orange',pch=23)
par(new=TRUE)
scatterplot3d(tsl$Close,tsl$Var,tsl$Volume, bg='blue',pch=23)


appvv <-appl$Var
tslvv <-tsl$Var

appvv
tslvv
plot(appvv,col='red',type='l')
par(new=TRUE)
plot(tslvv,col='blue',axes=FALSE)



install.packages(c("dplyr","hflights"))
library(dplyr)
library(hflights)
hf = tbl_df(hflights)
hf

hf%>%filter(Month==1&DayofMonth==2)
hf%>%arrange(Year,Month,DepTime,ArrTime)

ap =tbl_df(appl)
ap%>%arrange(Date,Close,Volume)
ap=ap%>%mutate(var=Open-Close,varPer=100*var/Open)
tl =tbl_df(tsl)
tl%>%mutate(var=Open-Close,varPer=100*var/Open)
joined = inner_join(ap,tl,by='Date')
joined

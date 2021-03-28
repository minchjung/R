#Ch6.----
#reshape
install.packages("reshape2")
library(reshape2)

dataApple <-read.csv(file="AAPL.csv")
names<-c("date","open","high","low","close","volume","variation")
colnames(dataApple)<-names
dataApple

#smith 성 내장데이터
data("smiths")
long<-melt(id=1:2,smiths) #col1,2기준으로 길게쪼갬
wide<-dcast(long,subject+time) # long을 다시 wide로 컬럼명지정+

data("airquality")
str(airquality)
airquality

air_melt <-melt(airquality,id=c("Month","Day"),na.rm=TRUE)
air_melt
acast<-acast(air_melt,Day~Month~variable)
head(acast) #3차원 데이터

###Ch7. EDA 
#1.정의
dataApple <-read.csv(file="AAPL.csv") # 자료불러오기
plot(dataApple$close, col='red',type='l') # plot

#2.데이터 조회 
dataApple["close"] # 특정 컬럼만 조회 
dataApple[,2] # 지정열의 모든행 조회 (옆으로 나옴 )
dataApple[,c(2:4)] #2~4열 모든행 조회 

#3.결측치 처리 
# 확인 by summary()
summary(dataApple)
#na.omit()결측치 제거 함수 
na.omit(dataApple) #셋이 뒤죽박죽됨. 
#그래서 if구문으로 결측치를 0처리 
x<-dataApple[,2]
dtApple=ifelse(!is.na(x),x,0)
dtApple
#결측치를 평균처리 
dtAppl2 = ifelse(!is.na(x),x,round(mean(x,na.rm=TRUE),2))
dtAppl2

#4. 극단치 처리 
# subset()
# 연결형 극단치 처리 
dataTsla=read.csv(file="TSLA.csv")
summary(dataTsla)
plot(dataTsla$Close,col='red',type='l')

tsla_subset<-subset(dataTsla,Close<max(dataTsla$Close)&Close>min(dataTsla$Close))
length(tsla_subset) #속성값 속성갯수가 나옴. 
length(tsla_subset$Close)

#4.3 극단치 찾기 어려운 case
boxplot(dataTsla$Close) #plot 확인
boxplot(dataTsla$Close)$stats #stats통계 1번 min 5번 max
#5. 코딩 변경 
# data 변경

dataTsla$Var2[dataAppl$Open-dataAppl$Close<0]<-'Low'
dataTsla$Var2[dataAppl$Open-dataAppl$Close>0]<-'High' #Var>0 high로 표시하는 Var2컬럼 추가
tail(dataTsla[c("Date","Var2")],50) #끝에서 50개만 해당컬럼만 보기

# 내맘대로 
dataTsla$Var3[dataTsla$Var2=='Low']<-"-1"
dataTsla$Var3[dataTsla$Var2=='High']<-"1"
tail(dataTsla,50)

#TSLA주가가 올른날을 1 떨어진날을 -1 
subset_var3_1<-subset(dataTsla,Var3==1)
subset_var3_neg1<-subset(dataTsla,Var3==-1)

length(subset_var3_1$Var3) #오른날 59
length(subset_var3_neg1$Var3) #떨어진날 67
#APPL 주가가 올른날을 1 떨어진날을 -1
dataAppl= read.csv(file="AAPL.csv")
dataAppl$Var2[dataAppl$Open-dataAppl$Close>0]<-"UP"
dataAppl$Var2[dataAppl$Open-dataAppl$Close<0]<-"DOWN"
#파이프라인으로 하는게 용이함

subset_posit <-subset(dataAppl,Var2==1)
subset_neg <-subset(dataAppl,Var2==-1)
length(subset_posit$Var2) # 오른날 59 
length(subset_neg$Var2) #떨어진날 67
# 똑같음 ..소오름 ;;

####맘대로 끝 ##################
#6.변수간의 관계분석
#1)범주형 vs 범주형  - 데이터 불러와 변경후 특정 칼럼대상 빈도수 구하기 
# 나중에..

#6.2)연속형vs 범주형
install.packages("lattice")
library(lattice)
densityplot(~Close, groups=Var2,data=dataAppl,plot.points=T,auto.key=T)


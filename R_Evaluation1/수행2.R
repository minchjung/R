# 1,2번 서술형 
# 3번: 수행2_3.R 파일 참조

#4번. 
install.packages("reshape2")
library(reshape2)
iris
#str(iris)

# 1) 
long<-melt(iris,id="Species",variable.name = "LW", value.name = "Values")
head(long)
# 2)
sum<-dcast(long,Species~LW,value.var = "Values",margins=TRUE,fun.aggregate=sum)
sum

#5번 
library(dplyr)
#1) 
str(iris)

filter1 <-iris%>%filter(Petal.Length>=1.5)
filter1


#2)
filter2<-filter1%>%select(1,3,5)
filter2
#3)
diff<-mutate(filter2,diff =Sepal.Length-Petal.Length)
head(diff)
#4)
species<-group_by(iris,Species)
SepalLength_Avg<-summarise(species, SepalLength_Avg=mean(Sepal.Length))
SepalWidth_Avg<-summarise(species, SepalWidth_Avg=mean(Sepal.Width))
PetalLength_Avg<-summarise(species, PetalLength_Avg=mean(Petal.Length))
PetalWidth_Avg<-summarise(species, PetalWidth_Avg=mean(Petal.Width))

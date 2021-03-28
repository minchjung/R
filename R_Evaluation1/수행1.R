# 1. 서술형 

# 2. 
install.packages("ggplot2") #ggplot or qplot 
library(ggplot2)
str(diamonds) # <-ggplot2 data set
p <- ggplot(diamonds, aes(carat, price, color = clarity)) 
p + geom_point() # ggplot 산점도 
qplot(carat,price,data=diamonds,color=factor(clarity),geom="point") # qplot 산점도

# 3.
library("lattice") # equal.count, xyplot
quakes # <-R data set
head(quakes)
#1)수심 3개로 범주화 
depthgroup <- equal.count(quakes$depth, number = 3, overlap = 0)
#2)리히터 2개로 범주화
maggroup<- equal.count(quakes$mag, number=2,overlap=0) 
#3) 산점도 3행 2열 
xyplot(lat ~ long|depthgroup*maggroup, data = quakes,layout=c(2,3),col=c("red","blue"))

# 4.
install.packages("ggmap")
library(ggmap) #get_stamenmap, ggmap 
library(stringr)

#1)
seoul <- c(left = 126.77, bottom = 37.40, 
           right = 127.17, top = 37.70)
map <- get_stamenmap(seoul, zoom = 11, maptype = 'watercolor')
# ggmap(map)

#2)
getwd()
setwd("C:/Users/admin/Desktop/R/project")
pop <- read.csv("university.csv", header = T)
str(pop)
#head(pop)

#3)
lon <- pop$LON
lat <- pop$LAT

#4)
school <- pop$'학교명'
df <- data.frame(school, lon, lat)


layer1 <- ggmap(map)
layer1


layer2 <- layer1 + geom_point(data = df, 
                              aes(x = lon, y = lat,
                                  color = factor(school), 
                                  size = factor(school)))
layer2

layer3 <- layer2 + geom_text(data = df,
                             aes(x =lon-0.01, y = lat-0.01, 
                                 label=school))
layer3
ggsave("pop201901.png", scale = 1, width = 10.24, height = 7.68)




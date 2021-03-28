# 1 서술형 

# 2 

rivers
str(rivers)

res<-hist(rivers,col =5,border='navy',breaks=8, xlab="miles")
res$breaks
res$counts

# 3
getwd()
magazine<-read.csv(file="magazine.csv", header = T)
magazine
summary(magazine)

magazine<-magazine[-1]
barplot(as.matrix(magazine),col=rainbow(2),
        main="문인잡지의 작품 발표 현황",ylab="발행 건수",xlab="작품 종류")
legend("topright",legend=c("2017","2016"),fill=rainbow(2))

# 4 
trees
summary(trees)
str(trees)

par(mfrow=c(1,3))
hist(trees$Girth,col=1,border=2,xlab="지름",main="Histogram of Grith")
hist(trees$Height,col=2,border=1,xlab="높이",main="Histogram of Height")
hist(trees$Volume,col=4,border=7,xlab="부피",main="Histogram of Volume")

# 5 

library(ggplot2)
# (1)
diamonds
ds<-diamonds
head(ds)

#(2)
par(mar=c(3,6,3,3))

#(3)
p_cut<-ggplot(ds, aes(cut))+geom_bar(fill='pink')+ggtitle("Quality of the cut") 
p_cut<- p_cut+theme(axis.title.y=element_text(angle=0,vjust=0.6,size=15)) 
p_cut # use for number(6)
p_cutFlop<- p_cut+coord_flip() # + flopped
p_cutFlop
#(4)
par(mar=c(5,4,3,2)+0.1)
p_cutFlop # w/o margin 

#(5)
p_depth<-ggplot(ds,aes(depth))+ggtitle("Histogram of Depth")+xlab("percentage")
p_depth<- p_depth +stat_bin(fill="wheat",geom="bar")
p_depth

#(6) Two different sets of plots just in case of any misleading 
#-1.plotting two variables in one palette respectively 
# coordinates need to be flopped again with no margin, 
# thereby, "p_cut",which axes have not flopped, should be in usage 
install.packages("gridExtra")
library(gridExtra)
p_depth <- p_depth + theme(axis.title.y=element_text(angle=0,vjust=0.6,size=15))
final_p =grid.arrange(p_cut,p_depth,ncol=1) 
#-2.plot two variables in one plot by ggplot w/ stat-bin
  # from ggplot w/ stat_bin
p <-ggplot(ds, aes(depth))
p<-p + stat_bin(aes(color=cut),geom="bar")
p  
# To set range of x-axis
xmin<-min(ds$depth)
xmax<-max(ds$depth)
  # To set rage of y-axis
tableCut<-table(ds$cut)
ymin<-min(tableCut)
ymax<-max(tableCut)

p_lims<- p+ xlim(0,xmax)+ylim(0,ymax)
p_lims
# To reset both axes
p

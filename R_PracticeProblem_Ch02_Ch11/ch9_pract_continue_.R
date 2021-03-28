library(rJava)
library(KoNLP)

library(tm)
library(wordcloud)

public_data<-read.csv(file="publicCorona.csv",header=F)
class(public_data)
str(public_data)
re_data<-public_data[,14]
str(re_data)

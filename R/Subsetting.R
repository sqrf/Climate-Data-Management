library(MASS)
library(plotly)


m <- as.matrix(read.csv(file = "UIZ-2000-2016(O3+WSP+WDR+T+RH+Nox+pm10).csv", sep = ",", header = TRUE ))
d<-data.frame(m)
hr_before = 24

d$O3 <- as.numeric(as.character(d$O3))  
d$WSP <- as.numeric(as.character(d$WSP)) 
d$WDR <- as.numeric(as.character(d$WDR)) 
d$Temp <- as.numeric(as.character(d$Temp)) 
d$RH <- as.numeric(as.character(d$RH)) 
d$Nox <- as.numeric(as.character(d$Nox)) 
d$Pm10 <- as.numeric(as.character(d$Pm10)) 

#s<-subset(d, d[2] >= 150)
index<-which(d$O3 >= 155)



df <- data.frame(Time= character(), O3= numeric(),WSP = numeric(),WDR=numeric(),Temp=numeric(),RH=numeric(),Nox=numeric(),Pm10=numeric())
  

for (i in index){
  for (j in hr_before:0){
    df<-rbind(df,d[i-j,])
  }
}

filename="UIZ-contingences00-16.csv"
#write.csv(df, file = paste0("df",i,".csv"))
write.csv(df, file = filename)

#n<-as.matrix(read.csv(filename), sep = ",", header = TRUE)

#w<-data.frame(Time= character(), O3= numeric(),WSP = numeric(),WDR=numeric(),Temp=numeric(),RH=numeric(),Nox=numeric(),Pm10=numeric())
#for (l in 0:length(index)){
#  w <- rbind(w,df[hr_before*l+l+1:hr_before*l+l+11,])
#  write.csv(w, file = paste0(i,"_df_.csv"))}


  


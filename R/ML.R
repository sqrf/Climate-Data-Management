library(caret)
library(ellipse)


m <- as.matrix(read.csv(file = "UIZ-2000-2016(O3+WSP+WDR+T+RH+Nox+pm10).csv", sep = ",", header = TRUE ))
d<-data.frame(m)

d$O3 <- as.numeric(as.character(d$O3))  
d$WSP <- as.numeric(as.character(d$WSP)) 
d$WDR <- as.numeric(as.character(d$WDR)) 
d$Temp <- as.numeric(as.character(d$Temp)) 
d$RH <- as.numeric(as.character(d$RH)) 
d$Nox <- as.numeric(as.character(d$Nox)) 
d$Pm10 <- as.numeric(as.character(d$Pm10)) 

# create a list of 80% of the rows in the original dataset we can use for training
validation_index <- createDataPartition(d$Time, p=0.80, list=FALSE)
# select 20% of the data for validation
validation <- dataset[-validation_index,]
# use the remaining 80% of data to training and testing the models
d <- d[validation_index,]
#sapply(d, class)
#head(d)

percentage <- prop.table(table(d$Time)) * 100
cbind(freq=table(d$Time), percentage=percentage)  

#split input and ouput
x <- d[,2:8]
y <- d[,1]

# boxplot for each attribute on one image
par(mfrow=c(2,8))
for(i in 2:8) {
  boxplot(x[,i], main=names(d)[i])
}

# scatterplot matrix
featurePlot(x=x, y=y, plot="ellipse")
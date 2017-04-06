library(MASS)
library(plotly)
library(colorRamps)

m <- as.matrix(read.csv(file = "csv2scatterplot.csv", sep = ",", header = TRUE ))
d=as.data.frame(m)

#par(mfrow=c(1,3))
#plot(m[,1],m[,2],xlab="x", ylab="x+1", xlim=c(0,160),ylim=c(0,160))
#plot(m[,3],m[,4],xlab="x", ylab="x+1", xlim=c(0,160),ylim=c(0,160))
#plot(m[,5],m[,6],xlab="x", ylab="x+1", xlim=c(0,160),ylim=c(0,160))
#mtext("Diagramas de dispersión", side=3, outer=TRUE, line=-3)
d1<-plot_ly(d, x = ~x1, y = ~y1, color = ~y2, size = ~y1, type = "scatter", mode = "markers")%>%
  layout(
    xaxis = list(range = c(0, 170)),
    yaxis = list(range = c(0, 170)))
d2<-plot_ly(d, x = ~x2, y = ~y2, color = ~y2, size = ~y2)%>%
  layout(
    xaxis = list(range = c(0, 170)),
    yaxis = list(range = c(0, 170)))
d3<-plot_ly(d, x = ~x3, y = ~y3, color = ~y2, size = ~y3)%>%
  layout(
    xaxis = list(range = c(0, 170)),
    yaxis = list(range = c(0, 170)))

subplot(d1,d2,d3)%>% 
  layout(title = "CCA - 21/05/16",
         scene = list(
           xaxis = list(title = "x"), 
           yaxis = list(title = "x+1")))
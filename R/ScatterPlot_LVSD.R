library(MASS)
library(plotly)
library(colorRamps)

f1 <- list(
  family = "Arial, sans-serif",
  size = 15,
  color = "white"
)
a <- list(
  autotick = FALSE,
  ticks = "outside",
  tick0 = 0,
  dtick = 2,
  tickfont = f1,
  tickcolor = toRGB("white"))

m <- as.matrix(read.csv(file = "csv2scatterplot_LVSD.csv", sep = ",", header = TRUE ))
d=as.data.frame(m)

####### x1,y1  ----> LV
####### x2, y2 ----> SD

maxsize<- 17

d1<-plot_ly(d, x = ~x1, y = ~y1, color = ~y1, size = ~y1, type = "scatter", mode = "markers")%>%
  layout(
    xaxis = list(range = c(0, maxsize)),
    yaxis = list(range = c(0, maxsize)))%>%
  layout(xaxis = a, yaxis = a, showgrid = T)%>%layout(plot_bgcolor='rgb(0, 0, 0)') %>% 
  layout(paper_bgcolor='rgb(0, 0, 0)')
d2<-plot_ly(d, x = ~x2, y = ~y2, color = ~y1, size = ~y1,type = "scatter", mode = "markers")%>%
  layout(
    xaxis = list(range = c(0, maxsize)),
    yaxis = list(range = c(0, maxsize)))%>%
  layout(xaxis = a, yaxis = a, showgrid = T)%>%layout(plot_bgcolor='rgb(0, 0, 0)') %>% 
  layout(paper_bgcolor='rgb(0, 0, 0)')


subplot(d1,d2)%>% 
  layout(title = "BC - LV/SD",
         scene = list(
           xaxis = list(title = "x"), 
           yaxis = list(title = "x+1")))
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

m <- as.matrix(read.csv(file = "2016-CCA-TEMP-daily.csv", sep = ",", header = TRUE ))
#plot_ly(x=c("1","154"),y=c("1":"24"),z=m, type = "heatmap")


plot_ly(z= ~m, type = "contour", 
        #marker = list(cmin = , cmax = 220),
        #OZONO#zmin = -3, zmax = 165,
       # zmin = -.2, zmax = 7,#UVA
       zmin = -.2, zmax = 33,#temp
        #colors = colorRamp(c("black","dodgerblue3","yellow","red3")),#UVA
        #colors = colorRamp(c("black","dodgerblue3","yellow","orange","red3")),#OZONE
       colors = colorRamp(c("black","dodgerblue3","orange","red")),
  width = 1600, height = 350,autotick=FALSE, dtick=2, gridwidth = 2)%>%
  layout(xaxis = a, yaxis = a, showgrid = T)%>%layout(plot_bgcolor='rgb(0, 0, 0)') %>% 
  layout(paper_bgcolor='rgb(0, 0, 0)')

#
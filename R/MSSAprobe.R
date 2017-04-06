

m <- as.matrix(read.csv(file = "MER-2000-2016(O3+WSP+WDR+T+RH+Nox+pm10).csv", sep = ",", header = TRUE ))
d<-as.data.frame(m)
#2:O3	
#3: WSP	
#4: WDR	
#5: Temp
#6: RH	
#7: Nox	
#8: Pm10


columna<-2
#n<-m[25000:30000,1]
n<-m[,columna]
n <- as.numeric(as.character(n))
z<-ts(n, start = 2000, end = 2016)
s <- ssa(z, L=600, kind = "1d-ssa") # Perform the decomposition using the default window length
summary(s) # Show various information about the decomposition
plot(s, main ="Scree Diagram", cex.axis=6) # Show the plot of the eigenvalues

r <- reconstruct(s, groups = list(Tendencia = c(1),
                                  Seasonality = c(2:16))) 
#groups = list(Trend = c(1, 2),Seasonality = c(2:3, 5:6)))# Reconstruct into 2 series


#plot(r, add.original = TRUE, main="Descomposición SSA ") # Plot the reconstruction
plot(r, add.residuals=FALSE, add.original = TRUE, main="Descomposición SSA ", plot.method="xyplot",superpose=TRUE) # Plot the reconstruction

nth<-20
plot(s, "series", groups=1:nth )# ,main =paste0("n=",nth, " modos principales - "))
plot(wcor(s, groups = 1:nth), scales = list(at = c(5,10,15)))


#par(cex.axis=2, cex.lab=0.00001)
#plot(r$Tendencia,col="orange")


#output_filename<-"r-SAG.txt"
#write.table(s, file = output_filename, sep = ",")

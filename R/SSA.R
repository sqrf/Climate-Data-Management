#library(Rssa)
#library(corrplot)

m <- as.matrix(read.csv(file = "SAG-00-16-byseasons.csv", sep = ",", header = TRUE ))
#	O3-CDS	:	1
#	O3-WDS	:	2
#	O3-RS	:	3
#	WSP-CDS	:	4
#	WSP-WDS	:	5
#	WSP-RS	:	6
#	T-CDS	:	7
#	T-WDS	:	8
#	T-RS	:	9
#	RH-CDS	:	10
#	RH-WDS	:	11
#	RH-RS	:	12
#	NOX-CDS	:	13
#	NOX-WDS	:	14
#	NOX-RS	:	15
#	PM10-CDS	:	16
#	PM10-WDS	:	17
#	PM10-RS	:	18
columna<-7
#n<-m[25000:30000,1]
n<-m[1:30000,columna]
n <- as.numeric(as.character(n))
z<-ts(n)
s <- ssa(z, L=2100) # Perform the decomposition using the default window length
summary(s) # Show various information about the decomposition
plot(s, main ="Scree Diagram", cex.axis=6) # Show the plot of the eigenvalues

r <- reconstruct(s, groups = list(Tendencia = c(1),
                                  Seasonality = c(2:16))) 
#groups = list(Trend = c(1, 2),Seasonality = c(2:3, 5:6)))# Reconstruct into 2 series
plot(r, add.original = TRUE, main="Descomposición SSA " ) # Plot the reconstruction
nth<-1

plot(s, "series", groups=1:nth)# ,main =paste0("n=",nth, " modos principales - "))
#plot(wcor(s, groups = 1:nth), scales = list(at = c(5,10,15)))


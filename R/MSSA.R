library("Rssa")
library("MTS")
library("lattice")
library("zoo")
m <- as.matrix(read.csv(file = "MER-2000-2016(O3+WSP+WDR+T+RH+Nox+pm10).csv", sep = ",", header = TRUE ))

d<-data.frame(m)


d$O3 <- as.numeric(as.character(d$O3))  
d$WSP <- as.numeric(as.character(d$WSP)) 
d$WDR <- as.numeric(as.character(d$WDR)) 
d$Temp <- as.numeric(as.character(d$Temp)) 
d$RH <- as.numeric(as.character(d$RH)) 
d$Nox <- as.numeric(as.character(d$Nox)) 
d$Pm10 <- as.numeric(as.character(d$Pm10)) 
#variables_matrix<-as.matrix(sapply(d, as.numeric)) 
mtsData<-ts(d[,-1], class = "mts")

#wine <- win  dow(AustralianWine, end = time(AustralianWine)[174])
variable <- mtsData[1:350, c("O3")] #c(nombres columnas, , , )

L <- 60

s.variable <- ssa(variable, L = L, kind = "1d-ssa" )# kind = "mssa")
plot(s.variable)
r.variable <- reconstruct(s.variable, groups = list(Trend = c(1), Seasonality = c(2:5, 7:12)))
plot(r.variable, add.residuals = FALSE, plot.method = "xyplot", superpose = TRUE, auto.key = list(columns = 3))
###############################
f.variable <- vforecast(s.variable,
                    groups = list(Trend = 1, Signal = 1:11), len = 200, only.new = TRUE)

plot(cbind(variable, f.variable$Signal, f.variable$Trend), type="l")#,
plot.type = "single", col = c("black", "red", "blue"), ylab = NULL)

#matplot(data.frame(c(variable, rep(NA, len)), f.variable), type = "l")

  


#Normalization


#################################
#Simultaneous Decompostion by MSSA


norm.mtsData <- sqrt(colMeans(mtsData[1:1000, -1]^2))
w <- sweep(mtsData[1:1000, -1], 2, norm.mtsData, "/")
s.w <- ssa(w, L = L, kind = "mssa")
r.w <- reconstruct(s.w, groups = list(Trend = c(1), Seasonality = c(3:4, 6:12)))
plot(r.w, add.residuals = FALSE, plot.method = "xyplot", slice = list(component = 1), screens = list(colnames(w)), col = c("blue", "green", "red", "violet", "black", "green4","yellow"), lty = rep(c(1, 2), each = 6), scales = list(y = list(draw = TRUE)), layout = c(1, 7))
plot(r.w, plot.method = "xyplot", add.original = TRUE, add.residuals = FALSE, slice = list(component = 2), col = c("blue", "green", "red", "violet", "black", "green4","yellow"), scales = list(y = list(draw = TRUE)), layout = c(1, 7))


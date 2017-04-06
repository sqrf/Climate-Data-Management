library(colorRamps)
m <- as.matrix(read.csv(file = "MER-24hr-before-WSP-00-16.csv", sep = ",", header = TRUE ))
#m <- as.matrix(read.csv(file = "MER-24h-Temp-randm-events00-16(maxO3-hr-interval).csv", sep = ",", header = TRUE ))
#m <- as.matrix(read.csv(file = "MER-24h-Pm10-randm-events00-16(1500hr).csv", sep = ",", header = TRUE ))

d<-data.frame(m)


#rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = rgb(0,0,0,0.5))

par(bg="black", col="white")
colfunc <- colorRampPalette(c("goldenrod4","darkorange","khaki" ,"white"))

matplot(d[, 1], d[, -1],type = "l", col = colfunc(20),
        xlab = " Previous Hours",
        ylab =  expression(paste(WSP[], "(m/s)")),
        cex.lab=1,
        cex.axis=2,
        lwd = 1.5,
        lty = 1,
        col.lab="white",
        col.axis="white",
        col.ticks="white")
grid(lty=3, lwd = 0.01, col = "grey")
        #col="white")

#rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = rgb(0,0,0,0.2))




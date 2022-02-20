# Load the built-in data:
data(airquality)
help(airquality)
head(airquality)

plot(Ozone ~ Wind, data=airquality)
plot(Ozone ~ Wind, data=airquality, xaxt="n", yaxt="n", ylab="", xlab="")
plot(Ozone ~ Wind, data=airquality, xaxt="n", yaxt="n", ylab="", xlab="")
# add the wind speed axis:
axis(side=1, at=seq(0, max(airquality$Wind, na.rm=T), 2), padj=-0.8)
# add the Ozone axis:
axis(side=2, at=seq(0, max(airquality$Ozone, na.rm=T), 20), hadj=0.8, las=2)
# This finds the maximum value for wind:
max(airquality$Wind, na.rm=T)

## [1] 20.7

# Then use that in the 'seq()' function to create the sequence of places for the tickmarks:
seq(from = 0, to = max(airquality$Wind, na.rm=T), by = 2)
## [1] 0 2 4 6 8 10 12 14 16 18 20
plot(Ozone ~ Wind, data=airquality, xaxt="n", yaxt="n", ylab="", xlab="")
# add the wind speed axis:
axis(side=1, at=seq(0, max(airquality$Wind, na.rm=T), 2), padj=-0.8)
# add the Ozone axis:
axis(side=2, at=seq(0, max(airquality$Ozone, na.rm=T), 20), hadj=0.8, las=2)
# add in the labels for each axis:
mtext(side=1, "Wind Speed (mph)", line=2.8, cex=1.5, font=2)
mtext(side=2, "Ozone Concentration (ppb)", line=2.8, cex=1.4, font=2)

plot(Ozone ~ Wind, data=airquality, xaxt="n", yaxt="n", ylab="", xlab="", pch=16, cex=1.5)
# add the wind speed axis:
axis(side=1, at=seq(0, max(airquality$Wind, na.rm=T), 2), padj=-0.8)
# add the Ozone axis:
axis(side=2, at=seq(0, max(airquality$Ozone, na.rm=T), 20), hadj=0.8, las=2)
# add in the labels for each axis:
mtext(side=1, "Wind Speed (mph)", line=2.8, cex=1.5, font=2)
mtext(side=2, "Ozone Concentration (ppb)", line=2.8, cex=1.4, font=2)
### transparent colors function
t_col <- function(color, opacity = 0.5) {
  rgb.val <- col2rgb(color)
  t.col <- rgb(rgb.val[1], rgb.val[2], rgb.val[3], max = 255, alpha = (opacity)*255)
  invisible(t.col)
}
plot(Ozone ~ Wind, data=airquality, xaxt="n", yaxt="n", ylab="", xlab="", pch=16, cex=1.5,
     col=t_col("black",0.6))
# add the wind speed axis:
axis(side=1, seq(0, max(airquality$Wind, na.rm=T), 2), padj=-0.8)
# add the Ozone axis:
axis(side=2, at=seq(0, max(airquality$Ozone, na.rm=T), 20), hadj=0.8, las=2)
# add in the labels for each axis:
mtext(side=1, "Wind Speed (mph)", line=2.8, cex=1.5, font=2)
mtext(side=2, "Ozone Concentration (ppb)", line=2.8, cex=1.4, font=2)
plot(Ozone ~ Wind, data=airquality, xaxt="n", yaxt="n", ylab="", xlab="", pch=16, cex=1.5,
     col=t_col("black",0.6), ylim=c(0,185), xlim=c(0,22))
# add the wind speed axis:
axis(side=1, seq(0, max(airquality$Wind, na.rm=T), 2), padj=-0.8)
# add the Ozone axis:
axis(side=2, at=seq(0, max(airquality$Ozone, na.rm=T), 20), hadj=0.8, las=2)
# add in the labels for each axis:
mtext(side=1, "Wind Speed (mph)", line=2.8, cex=1.5, font=2)
mtext(side=2, "Ozone Concentration (ppb)", line=2.8, cex=1.4, font=2)
par(mar=c(5,5,2,2))
plot(Ozone ~ Wind, data=airquality, xaxt="n", yaxt="n", ylab="", xlab="", pch=16, cex=1.5,
     ylim=c(0,185), xlim=c(0,22), col=t_col("black",0.6))
mtext(side=1, "Wind Speed (mph)", line=2.8, cex=1.5, font=2)
axis(side=1, seq(0, max(airquality$Wind)+2, 2), padj=-0.8)
mtext(side=2, "Ozone Concentration (ppb)", line=2.8, cex=1.4, font=2)
axis(side=2, at=seq(0, 185, 20), hadj=0.8, las=2)

pdf(file="my_scatterplot.pdf",width=7,height=4.5)
par(mar=c(5,5,2,2))
plot(Ozone ~ Wind, data=airquality, xaxt="n", yaxt="n", ylab="", xlab="", pch=16, cex=1.5,
     ylim=c(0,185), xlim=c(0,22), col=t_col("black",0.6))
mtext(side=1, "Wind Speed (mph)", line=2.8, cex=1.5, font=2)
axis(side=1, seq(0, max(airquality$Wind)+2, 2), padj=-0.8)
mtext(side=2, "Ozone Concentration (ppb)", line=2.8, cex=1.4, font=2)
axis(side=2, at=seq(0, 185, 20), hadj=0.8, las=2)
dev.off()

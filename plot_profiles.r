## Plots annual temperature profiles 



## don't get hosed by factors
options(stringsAsFactors=FALSE)

## load data: y1=cooler year, y2=warmer year
y1 <- read.csv(file="tvm_msa_profiles_2000.csv")
y2 <- read.csv(file="tvm_msa_profiles_2100.csv")

#convert to Fahrenheit
for (i in 3:367) {
	y1[,i] <- 1.8*y1[,i] + 32
	y2[,i] <- 1.8*y2[,i] + 32
}

#strip off labels to make data-only frame
d1 <- y1[,3:367]
d2 <- y2[,3:367]

pdf("profiles.pdf")

for (m in 1:nrow(d1)) {

plot(1, type="n", axes = FALSE, xlim=c(1,365), ylim=c(0,max(d2[m,]) + 10), xlab="Month", ylab="tmax(F)", main=y1[m,1])
lines(1:365, d2[m,], lwd=3, col="red")
lines(1:365, d1[m,], lwd=3, col="green")
legend(0,25, "2100", col="red", lwd=3, box.lwd=0, box.col="white")
legend(0,15, "2000", col="green", lwd=3, box.lwd=0, box.col="white")
axis(2, tck=1, col.ticks="gray")
axis(1, at=c(0,31,59,90,120,151,181,212,243,273,304,334,365), labels=FALSE)
text(15, 0, labels="J")
text(45, 0, labels="F")
text(75, 0, labels="M")
text(105, 0, labels="A")
text(136, 0, labels="M")
text(166, 0, labels="J")
text(197, 0, labels="J")
text(228, 0, labels="A")
text(258, 0, labels="S")
text(289, 0, labels="O")
text(319, 0, labels="N")
text(350, 0, labels="D")

}
dev.off()
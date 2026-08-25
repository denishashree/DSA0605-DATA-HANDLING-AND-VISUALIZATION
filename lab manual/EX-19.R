g=c("Male","Female","Male","Female","Male","Female")
s=c(4.5,6.0,3.2,7.1,2.8,5.4)
d=c(2.4,3.8,1.6,4.5,1.2,3.1)
sat=c(3,5,3,5,2,4)

par(mfrow=c(1,3))

# 1. Histogram + Density
hist(s,col="skyblue",main="Screen Time",xlab="Hours",prob=TRUE)
lines(density(s),col="red",lwd=2)

# 2. Scatter Plot + Trend Line
plot(d,s,pch=19,col="blue",main="Data vs Screen")
abline(lm(s~d),col="red",lwd=2)
cor(d,s)

# 3. Bar Chart
a=tapply(sat,g,mean)
bp=barplot(a,col=c("pink","lightgreen"),main="Avg Satisfaction")
text(bp,a,round(a,1),pos=3)

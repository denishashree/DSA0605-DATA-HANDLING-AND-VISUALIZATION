library(ggplot2)

h=c(12,8,15,10,7)
a=c(90,70,95,85,60)
t=c(85,70,92,80,65)
p=c(8,7,9,8,6)

# 1. Area Chart
df=data.frame(x=1:5,Test=t,Part=p)
ggplot(df,aes(x))+geom_area(aes(y=Test,fill="Test"))+
  geom_area(aes(y=Test+Part,fill="Participation"))+
  labs(title="Stacked Area")

# 2. Boxplot
df2=data.frame(h,a=cut(a,quantile(a),include.lowest=TRUE))
ggplot(df2,aes(a,h,fill=a))+geom_boxplot()

# 3. Density Plot
ggplot(data.frame(t),aes(t))+geom_density(fill="skyblue")


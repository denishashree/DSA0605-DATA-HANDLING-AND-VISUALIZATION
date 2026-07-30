# Install packages (only once)
install.packages("wordcloud")
install.packages("tm")

# Load packages
library(wordcloud)
library(tm)

# Create Dataset
customer <- data.frame(
  CustomerID = c(1,2,3,4,5),
  Age = c(25,30,35,28,40),
  Satisfaction = c(4,5,3,4,5)
)

# -------------------------------
# Histogram
# -------------------------------

hist(customer$Age,
     main="Customer Ages",
     xlab="Age",
     ylab="Frequency",
     col="lightblue")

# -------------------------------
# Pie Chart
# -------------------------------

score <- table(customer$Satisfaction)

pie(score,
    labels=names(score),
    main="Customer Satisfaction",
    col=rainbow(3))

# -------------------------------
# Stacked Bar Chart
# -------------------------------

customer$AgeGroup <- ifelse(customer$Age<=30,"21-30","31-40")

data <- table(customer$AgeGroup,
              customer$Satisfaction)

barplot(data,
        main="Satisfaction by Age Group",
        xlab="Age Group",
        ylab="Customers",
        col=c("red","green","blue"),
        legend.text=TRUE)

# -------------------------------
# Word Cloud
# -------------------------------

feedback <- c(
  "Excellent service",
  "Very satisfied",
  "Average experience",
  "Good quality",
  "Excellent support"
)

wordcloud(
  words=unlist(strsplit(paste(feedback,collapse=" ")," ")),
  random.order=FALSE,
  colors=rainbow(10)
)


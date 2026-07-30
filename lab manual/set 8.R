#=========================================
# SET 8: Online Learning Activity Analysis
#=========================================

# Create Dataset
student <- data.frame(
  Student_ID = c("L01","L02","L03","L04","L05","L06"),
  Gender = c("Male","Female","Male","Female","Male","Female"),
  Age = c(20,22,19,21,23,20),
  Course = c("R","R","SQL","R","R","SQL"),
  Study_Time = c(3.5,4.2,2.0,5.0,2.5,4.0),
  Videos_Watched = c(12,15,8,18,9,14),
  Quiz_Score = c(78,85,65,92,70,88),
  Login_Date = as.Date(c("2025-01-05",
                         "2025-01-05",
                         "2025-02-08",
                         "2025-02-08",
                         "2025-03-12",
                         "2025-03-12"))
)

print(student)

#=========================================
# Task 1: Histogram
#=========================================

hist(student$Quiz_Score,
     col="skyblue",
     main="Histogram of Quiz Scores",
     xlab="Quiz Score",
     ylab="Frequency")

#=========================================
# Task 1: Boxplot
#=========================================

boxplot(Quiz_Score ~ Course,
        data=student,
        col=c("pink","lightgreen"),
        main="Quiz Score by Course",
        xlab="Course",
        ylab="Quiz Score")

cat("\nInterpretation:\n")
cat("Students in the R course generally have higher quiz scores than SQL students.\n")

#=========================================
# Task 2: Scatter Plot
#=========================================

plot(student$Study_Time,
     student$Quiz_Score,
     pch=19,
     cex=student$Videos_Watched/5,
     col=rgb(1,0,0,0.5),
     main="Study Time vs Quiz Score",
     xlab="Study Time (Hours)",
     ylab="Quiz Score")

cat("\nLearning Pattern:\n")
cat("Students who spend more time studying generally score higher.\n")
cat("Larger bubbles indicate more videos watched.\n")

#=========================================
# Task 3: Average Quiz Score per Month
#=========================================

student$Month <- format(student$Login_Date,"%B")

avg_score <- aggregate(Quiz_Score ~ Month,
                       data=student,
                       mean)

print(avg_score)

plot(avg_score$Quiz_Score,
     type="o",
     pch=16,
     col="blue",
     xaxt="n",
     xlab="Month",
     ylab="Average Quiz Score",
     main="Average Quiz Score by Month")

axis(1,
     at=1:nrow(avg_score),
     labels=avg_score$Month)

cat("\nTrend:\n")
cat("Average quiz scores vary across the months.\n")

#=========================================
# Task 4: Save Dataset for Tableau
#=========================================

write.csv(student,
          "Online_Learning_Activity.csv",
          row.names=FALSE)

cat("\nDataset saved as Online_Learning_Activity.csv\n")
cat("Import this CSV into Tableau.\n")
cat("Create:\n")
cat("1. Bar Chart (Average Quiz Score by Course)\n")
cat("2. Scatter Plot (Study Time vs Quiz Score)\n")
cat("3. Add Gender and Course Filters\n")
cat("4. Combine into a Dashboard\n")
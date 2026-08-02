#=========================================================
# SET 15 - STUDENT MINI DATA ANALYSIS
#=========================================================

# Clear Workspace
rm(list = ls())

#=========================================================
# STEP 1: Create Dataset
#=========================================================

student <- data.frame(
  Student_ID = c("S01","S02","S03","S04","S05","S06"),
  Gender = c("Male","Female","Male","Female","Male","Female"),
  Study_Hours = c(2.0,3.5,1.5,4.0,2.8,3.0),
  Attendance = c(78,90,70,95,85,92),
  Math_Score = c(62,80,55,90,72,82),
  Science_Score = c(65,85,58,92,74,86),
  Exam_Date = c("2025-01-10","2025-01-10","2025-02-12",
                "2025-02-12","2025-03-15","2025-03-15")
)

# Display Dataset
print(student)

# Save Dataset as CSV
write.csv(student,
          "Student_Mini_Data.csv",
          row.names = FALSE)

#=========================================================
# STEP 2: Import Dataset
#=========================================================

student <- read.csv("Student_Mini_Data.csv")

print(student)

#=========================================================
# QUESTION 1
# Histogram and Boxplot
#=========================================================

# Histogram of Math Score
hist(student$Math_Score,
     main = "Histogram of Math Scores",
     xlab = "Math Score",
     col = "skyblue",
     border = "black")

# Boxplot of Science Score by Gender
boxplot(Science_Score ~ Gender,
        data = student,
        main = "Science Score by Gender",
        xlab = "Gender",
        ylab = "Science Score",
        col = c("lightgreen","pink"))

#=========================================================
# QUESTION 2
# Scatter Plot with Regression Line
#=========================================================

# Assign Colors
colors <- ifelse(student$Gender=="Male","blue","red")

plot(student$Study_Hours,
     student$Math_Score,
     pch = 19,
     col = colors,
     xlab = "Study Hours",
     ylab = "Math Score",
     main = "Study Hours vs Math Score")

# Add Regression Line
abline(lm(Math_Score ~ Study_Hours, data=student),
       col="darkgreen",
       lwd=2)

# Legend
legend("topleft",
       legend=c("Male","Female"),
       col=c("blue","red"),
       pch=19)

#=========================================================
# QUESTION 3
# Date Conversion and Monthly Average
#=========================================================

# Convert Date
student$Exam_Date <- as.Date(student$Exam_Date)

# Extract Month
student$Month <- format(student$Exam_Date,"%Y-%m")

# Monthly Average Math Score
monthly_avg <- aggregate(Math_Score ~ Month,
                         data=student,
                         mean)

print(monthly_avg)

# Line Chart
plot(monthly_avg$Math_Score,
     type="o",
     xaxt="n",
     col="blue",
     lwd=2,
     xlab="Month",
     ylab="Average Math Score",
     main="Monthly Average Math Score")

axis(1,
     at=1:nrow(monthly_avg),
     labels=monthly_avg$Month)

# Moving Average (Window = 2)
moving_avg <- filter(monthly_avg$Math_Score,
                     rep(1/2,2),
                     sides=1)

lines(moving_avg,
      col="red",
      lwd=2,
      lty=2)

legend("topleft",
       legend=c("Monthly Average","Moving Average"),
       col=c("blue","red"),
       lty=c(1,2),
       lwd=2)

#=========================================================
# Summary Statistics
#=========================================================

cat("\nSummary Statistics\n")
summary(student)

cat("\nAverage Math Score :", mean(student$Math_Score), "\n")
cat("Average Science Score :", mean(student$Science_Score), "\n")
cat("Average Study Hours :", mean(student$Study_Hours), "\n")

#=========================================================
# Interpretation
#=========================================================

cat("\nINTERPRETATION\n")
cat("1. Histogram shows distribution of Math scores.\n")
cat("2. Boxplot compares Science scores of Male and Female students.\n")
cat("3. Scatter plot shows a positive relationship between Study Hours and Math Score.\n")
cat("4. Regression line indicates that higher study hours generally improve Math performance.\n")
cat("5. Monthly average Math scores show an increasing trend from January to March.\n")
cat("6. Moving average smooths the monthly trend.\n")

#=========================================================
# QUESTION 4
# Tableau Instructions
#=========================================================

cat("\n=========================================\n")
cat("TABLEAU TASK\n")
cat("=========================================\n")
cat("1. Import Student_Mini_Data.csv.\n")
cat("2. Create Bar Chart:\n")
cat("   Gender -> Columns\n")
cat("   AVG(Math_Score) -> Rows\n")
cat("3. Create Line Chart:\n")
cat("   Exam_Date -> Columns\n")
cat("   AVG(Math_Score) -> Rows\n")
cat("4. Add Filter:\n")
cat("   Exam_Date\n")
cat("5. Create Dashboard.\n")
cat("6. Add Bar Chart and Line Chart to Dashboard.\n")
cat("7. Show Filter for Exam_Date.\n")
cat("=========================================\n")
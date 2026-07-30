#=========================================
# SET 3: Employee Performance Evaluation
#=========================================

# Create Dataset
employee <- data.frame(
  EmployeeID = c(1, 2, 3, 4, 5),
  Department = c("Sales", "HR", "Marketing", "Sales", "HR"),
  YearsOfService = c(5, 3, 7, 4, 2),
  PerformanceScore = c(85, 92, 78, 90, 76)
)

# Display Dataset
print(employee)

#=========================================
# Task 1: Line Chart
#=========================================

plot(employee$EmployeeID,
     employee$PerformanceScore,
     type = "o",
     col = "blue",
     pch = 16,
     lwd = 2,
     main = "Employee Performance Trend",
     xlab = "Employee ID",
     ylab = "Performance Score")

legend("bottomright",
       legend = "Performance Score",
       col = "blue",
       lty = 1,
       pch = 16)

#=========================================
# Task 2: Bar Chart
#=========================================

dept <- table(employee$Department)

barplot(dept,
        col = c("red", "green", "blue"),
        main = "Employees by Department",
        xlab = "Department",
        ylab = "Number of Employees")

#=========================================
# Task 3: Scatter Plot
#=========================================

plot(employee$YearsOfService,
     employee$PerformanceScore,
     pch = 19,
     col = "darkgreen",
     main = "Years of Service vs Performance",
     xlab = "Years of Service",
     ylab = "Performance Score")

#=========================================
# Scatter Plot Insight
#=========================================

cat("\nScatter Plot Insight:\n")
cat("The scatter plot shows the relationship between years of service and performance score.\n")
cat("Employees with more years of service do not always have higher performance scores.\n")
cat("There is no strong positive correlation in this dataset.\n")

#=========================================
# Task 4: Save Dataset for Tableau
#=========================================

write.csv(employee, "employee.csv", row.names = FALSE)

cat("\nDataset saved as employee.csv\n")
cat("Open employee.csv in Tableau and create:\n")
cat("1. Line Chart\n")
cat("2. Bar Chart\n")
cat("3. Combine both in a Dashboard\n")
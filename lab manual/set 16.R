#=========================================================
# SET 16 - PATIENT HEALTH RISK ANALYSIS
#=========================================================

# Clear Workspace
rm(list = ls())

#=========================================================
# STEP 1: Create Dataset
#=========================================================

patient <- data.frame(
  Patient_ID = c("P1","P2","P3","P4","P5"),
  Age = c(25,40,55,35,60),
  BMI = c(22,28,30,26,32),
  BP = c(120,135,145,130,150),
  Cholesterol = c(180,210,240,200,260)
)

# Display Dataset
print(patient)

# Save Dataset
write.csv(patient,
          "Patient_Health_Risk_Data.csv",
          row.names = FALSE)

# Import Dataset
patient <- read.csv("Patient_Health_Risk_Data.csv")

print(patient)

#=========================================================
# QUESTION 1
# Scatterplot Matrix
#=========================================================

pairs(
  patient[,2:5],
  main = "Scatterplot Matrix of Health Indicators",
  pch = 19,
  col = "blue"
)

#=========================================================
# QUESTION 2
# Q-Q Plot and ECDF
#=========================================================

# Q-Q Plot
qqnorm(
  patient$Cholesterol,
  main = "Q-Q Plot of Cholesterol"
)

qqline(
  patient$Cholesterol,
  col = "red",
  lwd = 2
)

# ECDF
plot(
  ecdf(patient$Cholesterol),
  main = "ECDF of Cholesterol",
  xlab = "Cholesterol",
  ylab = "Cumulative Probability",
  col = "blue",
  lwd = 2
)

#=========================================================
# QUESTION 3
# Average Health Indicators Bar Chart
#=========================================================

avg_values <- c(
  mean(patient$Age),
  mean(patient$BMI),
  mean(patient$BP),
  mean(patient$Cholesterol)
)

names(avg_values) <- c("Age","BMI","BP","Cholesterol")

print(avg_values)

barplot(
  avg_values,
  col = c("skyblue","orange","lightgreen","pink"),
  main = "Average Health Indicators",
  xlab = "Health Indicators",
  ylab = "Average Value"
)

#=========================================================
# Summary Statistics
#=========================================================

summary(patient)

cat("\nAverage Age =", mean(patient$Age))
cat("\nAverage BMI =", mean(patient$BMI))
cat("\nAverage BP =", mean(patient$BP))
cat("\nAverage Cholesterol =", mean(patient$Cholesterol))

#=========================================================
# Interpretation
#=========================================================

cat("\n\nINTERPRETATION\n")
cat("1. Scatterplot matrix helps identify relationships among Age, BMI, BP, and Cholesterol.\n")
cat("2. Positive relationships indicate that BP and Cholesterol generally increase with Age and BMI.\n")
cat("3. Q-Q plot checks whether Cholesterol values follow a normal distribution.\n")
cat("4. ECDF displays cumulative distribution of Cholesterol levels.\n")
cat("5. The bar chart compares the average values of Age, BMI, BP, and Cholesterol.\n")
cat("6. Higher average BMI, BP, and Cholesterol suggest increased health risk.\n")
#=========================================================
# ENERGY CONSUMPTION DATA ANALYSIS
#=========================================================

# Clear Workspace
rm(list = ls())

#---------------------------------------------------------
# Step 1: Create Dataset
#---------------------------------------------------------

energy <- data.frame(
  Sector = c("Residential","Commercial","Industrial",
             "Residential","Commercial","Industrial"),
  Region = c("North","South","West","East","North","South"),
  Month = c("Jan","Jan","Feb","Feb","Mar","Mar"),
  Temperature = c(15,24,20,18,28,30),
  Units_Consumed = c(320,540,880,350,610,920),
  Cost = c(2100,3600,5900,2300,4100,6200),
  Renewable_Usage = c(22,18,12,25,20,15),
  Peak_Hours = c(4,6,8,5,7,9)
)

# Display Dataset
print(energy)

# Save Dataset as CSV
write.csv(
  energy,
  "Energy_Consumption_Data.csv",
  row.names = FALSE
)

# Import Dataset
energy <- read.csv("Energy_Consumption_Data.csv")

# Display Imported Dataset
print(energy)

#=========================================================
# QUESTION 1
# Histogram and Density Plot
#=========================================================

hist(
  energy$Units_Consumed,
  main = "Histogram of Units Consumed",
  xlab = "Units Consumed (kWh)",
  col = "lightblue",
  border = "black"
)

plot(
  density(energy$Units_Consumed),
  main = "Density Plot of Units Consumed",
  xlab = "Units Consumed (kWh)",
  col = "blue",
  lwd = 3
)

polygon(
  density(energy$Units_Consumed),
  col = "lightblue",
  border = "blue"
)

#=========================================================
# QUESTION 2
# Scatter Plot with Bubble Size and Transparency
#=========================================================

symbols(
  energy$Temperature,
  energy$Units_Consumed,
  circles = energy$Peak_Hours,
  inches = 0.30,
  bg = rgb(0,0,1,0.5),
  fg = "black",
  xlab = "Temperature (°C)",
  ylab = "Units Consumed (kWh)",
  main = "Temperature vs Units Consumed"
)

#=========================================================
# QUESTION 3
# Average Renewable Usage by Sector
#=========================================================

avgRenew <- aggregate(
  Renewable_Usage ~ Sector,
  data = energy,
  mean
)

print(avgRenew)

barplot(
  avgRenew$Renewable_Usage,
  names.arg = avgRenew$Sector,
  col = c("green","orange","steelblue"),
  main = "Average Renewable Usage by Sector",
  xlab = "Sector",
  ylab = "Average Renewable Usage (%)"
)

#=========================================================
# Additional Summary Statistics
#=========================================================

cat("\nSummary Statistics\n")
summary(energy)

cat("\nAverage Units Consumed =", mean(energy$Units_Consumed), "\n")
cat("Maximum Units Consumed =", max(energy$Units_Consumed), "\n")
cat("Minimum Units Consumed =", min(energy$Units_Consumed), "\n")

#=========================================================
# QUESTION 4
# Tableau Instructions
#=========================================================

cat("\n=============================================\n")
cat("TABLEAU TASK\n")
cat("=============================================\n")
cat("1. Import Energy_Consumption_Data.csv into Tableau.\n")
cat("2. Create a Line Chart:\n")
cat("   Month -> Columns\n")
cat("   Units_Consumed -> Rows\n")
cat("3. Create a Heat Map:\n")
cat("   Sector -> Rows\n")
cat("   Region -> Columns\n")
cat("   Units_Consumed -> Color\n")
cat("4. Add Filters:\n")
cat("   Month\n")
cat("   Sector\n")
cat("5. Combine both charts into a Dashboard.\n")
cat("=============================================\n")
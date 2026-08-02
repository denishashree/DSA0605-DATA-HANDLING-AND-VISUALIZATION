#=========================================================
# SET 17 - VEHICLE PERFORMANCE ANALYSIS
#=========================================================

# Clear Workspace
rm(list = ls())

# Install packages (Run only once)
# install.packages("ggplot2")
# install.packages("corrplot")

library(ggplot2)
library(corrplot)

#=========================================================
# STEP 1: Create Dataset
#=========================================================

vehicle <- data.frame(
  Vehicle_ID = c("V1","V2","V3","V4","V5"),
  Engine_Size = c(1.5,2.0,3.0,2.5,1.8),
  Horsepower = c(110,150,250,200,130),
  Fuel_Efficiency = c(18,15,12,14,17),
  Top_Speed = c(180,200,250,220,190),
  Safety_Rating = c(4,5,5,4,3)
)

# Display Dataset
print(vehicle)

# Save Dataset
write.csv(vehicle,
          "Vehicle_Performance_Data.csv",
          row.names = FALSE)

# Import Dataset
vehicle <- read.csv("Vehicle_Performance_Data.csv")

print(vehicle)

#=========================================================
# QUESTION 1
# Violin Plot
#=========================================================

ggplot(vehicle,
       aes(x=factor(Safety_Rating),
           y=Fuel_Efficiency,
           fill=factor(Safety_Rating))) +
  geom_violin(trim=FALSE) +
  geom_boxplot(width=0.1, fill="white") +
  labs(
    title="Fuel Efficiency by Safety Rating",
    x="Safety Rating",
    y="Fuel Efficiency (km/l)"
  ) +
  theme_minimal()

#=========================================================
# QUESTION 2
# Scatter Plot
#=========================================================

ggplot(vehicle,
       aes(x=Horsepower,
           y=Top_Speed,
           color=Engine_Size)) +
  geom_point(size=4) +
  geom_smooth(method="lm",
              se=FALSE,
              color="black") +
  labs(
    title="Horsepower vs Top Speed",
    x="Horsepower",
    y="Top Speed (km/h)"
  ) +
  theme_minimal()

#=========================================================
# QUESTION 3
# Correlation Heatmap
#=========================================================

num_data <- vehicle[,2:6]

cor_matrix <- cor(num_data)

print(cor_matrix)

corrplot(
  cor_matrix,
  method="color",
  type="upper",
  addCoef.col="black",
  tl.col="black",
  tl.srt=45
)

#=========================================================
# Summary Statistics
#=========================================================

summary(vehicle)

cat("\nAverage Engine Size =", mean(vehicle$Engine_Size))
cat("\nAverage Horsepower =", mean(vehicle$Horsepower))
cat("\nAverage Fuel Efficiency =", mean(vehicle$Fuel_Efficiency))
cat("\nAverage Top Speed =", mean(vehicle$Top_Speed))

#=========================================================
# Interpretation
#=========================================================

cat("\n\nINTERPRETATION\n")
cat("1. Violin plot compares Fuel Efficiency across Safety Ratings.\n")
cat("2. Scatter plot shows a positive relationship between Horsepower and Top Speed.\n")
cat("3. Correlation heatmap identifies variables strongly associated with Top Speed.\n")
cat("4. Horsepower and Engine Size generally have strong positive correlations with Top Speed.\n")
cat("5. Fuel Efficiency usually has a negative correlation with Engine Size and Horsepower.\n")
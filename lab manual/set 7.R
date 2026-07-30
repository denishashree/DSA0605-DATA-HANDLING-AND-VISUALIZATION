#=========================================
# SET 7: Customer Demographics Analysis
#=========================================

# Create Dataset
customer <- data.frame(
  CustomerID = c(1,2,3),
  Age = c(28,35,42),
  Gender = c("Female","Male","Female"),
  Income = c(50000,60000,75000)
)

# Display Dataset
print(customer)

#=========================================
# Task 1: Bar Chart
#=========================================

barplot(customer$Age,
        names.arg = customer$CustomerID,
        col = "skyblue",
        main = "Customer Age Distribution",
        xlab = "Customer ID",
        ylab = "Age")

#=========================================
# Task 2: Pie Chart
#=========================================

gender <- table(customer$Gender)

pie(gender,
    main = "Customer Gender Distribution",
    col = c("pink","lightblue"),
    labels = paste(names(gender), gender))

#=========================================
# Task 3: Table
#=========================================

cat("\nCustomer Demographics Table\n")
print(customer)

# Open table in RStudio
View(customer)

#=========================================
# Task 4: Save Dataset for Tableau
#=========================================

write.csv(customer, "customer_demographics.csv", row.names = FALSE)

cat("\nDataset saved as customer_demographics.csv\n")
cat("Import this file into Tableau.\n")
cat("Create:\n")
cat("1. Bar Chart\n")
cat("2. Pie Chart\n")
cat("3. Table\n")
cat("4. Combine all three in a Dashboard.\n")
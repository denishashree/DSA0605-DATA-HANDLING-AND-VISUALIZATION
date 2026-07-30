#=========================================
# SET 4: Product Inventory Management
#=========================================

# Create Dataset
product <- data.frame(
  ProductID = c(1,2,3,4,5),
  ProductName = c("Product A","Product B","Product C","Product D","Product E"),
  QuantityAvailable = c(250,175,300,200,220),
  Category = c("Electronics","Electronics","Accessories","Accessories","Electronics"),
  Price = c(500,350,600,450,550)
)

print(product)

#=========================================
# Task 1: Bar Chart
#=========================================

barplot(product$QuantityAvailable,
        names.arg = product$ProductName,
        col = "skyblue",
        main = "Quantity of Products in Inventory",
        xlab = "Product Name",
        ylab = "Quantity Available")

#=========================================
# Task 2: Stacked Bar Chart
#=========================================

inventory <- table(product$Category,
                   product$ProductName)

barplot(inventory,
        main = "Products by Category",
        xlab = "Category",
        ylab = "Number of Products",
        col = rainbow(5),
        legend.text = TRUE)

#=========================================
# Task 3: Scatter Plot
#=========================================

plot(product$Price,
     product$QuantityAvailable,
     pch = 19,
     col = "red",
     main = "Price vs Quantity Available",
     xlab = "Product Price",
     ylab = "Quantity Available")

#=========================================
# Scatter Plot Insight
#=========================================

cat("\nScatter Plot Insight:\n")
cat("The scatter plot shows the relationship between product price and quantity available.\n")
cat("Higher-priced products may have higher or lower quantities.\n")
cat("This dataset does not show a strong correlation between price and quantity.\n")

#=========================================
# Save Dataset for Tableau
#=========================================

write.csv(product, "product_inventory.csv", row.names = FALSE)

cat("\nDataset saved as product_inventory.csv\n")
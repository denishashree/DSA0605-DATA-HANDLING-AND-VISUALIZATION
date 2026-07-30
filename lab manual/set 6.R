#=========================================
# SET 6: Product Sales Analysis
#=========================================

# Create Dataset
sales <- data.frame(
  ProductID = c(1,2,3),
  ProductName = c("Product A","Product B","Product C"),
  January = c(2000,1500,1200),
  February = c(2200,1800,1400),
  March = c(2400,1600,1100)
)

print(sales)

#=========================================
# Task 1: Grouped Bar Chart
#=========================================

sales_data <- rbind(sales$January,
                    sales$February,
                    sales$March)

colnames(sales_data) <- sales$ProductName
rownames(sales_data) <- c("January","February","March")

barplot(sales_data,
        beside = TRUE,
        col = c("red","green","blue"),
        main = "Monthly Product Sales (First Quarter)",
        xlab = "Products",
        ylab = "Sales",
        legend.text = rownames(sales_data))

#=========================================
# Task 2: Stacked Area Chart
#=========================================

months <- c(1,2,3)

plot(months,
     sales$January,
     type = "n",
     xaxt = "n",
     ylim = c(0,6000),
     xlab = "Month",
     ylab = "Total Sales",
     main = "Overall Sales Trend")

axis(1,
     at = months,
     labels = c("January","February","March"))

polygon(c(months, rev(months)),
        c(rep(0,3), rev(sales$January)),
        col = "lightblue",
        border = NA)

polygon(c(months, rev(months)),
        c(sales$January,
          rev(sales$January + sales$February)),
        col = "lightgreen",
        border = NA)

polygon(c(months, rev(months)),
        c(sales$January + sales$February,
          rev(sales$January + sales$February + sales$March)),
        col = "pink",
        border = NA)

legend("topleft",
       legend = c("January","February","March"),
       fill = c("lightblue","lightgreen","pink"))

#=========================================
# Task 3: Table
#=========================================

cat("\nMonthly Product Sales Table\n")
print(sales)

#=========================================
# Task 4: Save Dataset for Tableau
#=========================================

write.csv(sales, "product_sales.csv", row.names = FALSE)

cat("\nDataset saved as product_sales.csv\n")
cat("Open this file in Tableau.\n")
cat("Create:\n")
cat("1. Grouped Bar Chart\n")
cat("2. Stacked Area Chart\n")
cat("3. Table\n")
cat("4. Combine all three in a Dashboard.\n")
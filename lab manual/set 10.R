#=========================================
# SET 10 : Product Category Analysis
#=========================================

# Create Dataset
product <- data.frame(
  Category=c("Electronics",
             "Clothing",
             "Appliances"),
  Sales=c(50000,
          35000,
          40000)
)

print(product)

#=========================================
# Task 1 : Funnel Chart (Horizontal Bar)
#=========================================

barplot(product$Sales,
        names.arg=product$Category,
        horiz=TRUE,
        col=c("red","blue","green"),
        main="Sales by Product Category",
        xlab="Sales")

#=========================================
# Task 2 : Table
#=========================================

cat("\nProduct Sales Table\n")
print(product)

#=========================================
# Task 3 : Save CSV for Tableau
#=========================================

write.csv(product,
          "Product_Category.csv",
          row.names=FALSE)

cat("\nProduct_Category.csv saved successfully.\n")

#=========================================
# Task 4 : Pie Chart
#=========================================

pie(product$Sales,
    labels=product$Category,
    col=rainbow(3),
    main="Sales Distribution by Category")
#=========================================
# SET 5: Website Analytics
#=========================================

# Create Dataset
website <- data.frame(
  Date = as.Date(c("2023-01-01","2023-01-02","2023-01-03","2023-01-04","2023-01-05")),
  PageViews = c(1500,1600,1400,1650,1800),
  ClickThroughRate = c(2.3,2.7,2.0,2.4,2.6)
)

print(website)

#=========================================
# Task 1: Line Chart
#=========================================

plot(website$Date,
     website$PageViews,
     type = "o",
     col = "blue",
     pch = 16,
     lwd = 2,
     main = "Daily Page Views Trend",
     xlab = "Date",
     ylab = "Page Views")

#=========================================
# Task 2: Bar Chart
#=========================================

barplot(website$ClickThroughRate,
        names.arg = website$Date,
        col = "orange",
        main = "Click-Through Rate by Date",
        xlab = "Date",
        ylab = "Click-Through Rate (%)")

#=========================================
# Task 3: Stacked Area Chart
#=========================================

# Sample user interaction data
likes <- c(100,120,110,130,140)
shares <- c(50,60,55,65,70)
comments <- c(30,35,25,40,45)

interaction <- rbind(likes, shares, comments)

# Stacked Area Chart
plot(website$Date,
     likes,
     type = "n",
     ylim = c(0,300),
     xlab = "Date",
     ylab = "User Interactions",
     main = "Stacked Area Chart of User Interactions")

polygon(c(website$Date, rev(website$Date)),
        c(rep(0,5), rev(likes)),
        col = "lightblue",
        border = NA)

polygon(c(website$Date, rev(website$Date)),
        c(likes, rev(likes + shares)),
        col = "lightgreen",
        border = NA)

polygon(c(website$Date, rev(website$Date)),
        c(likes + shares, rev(likes + shares + comments)),
        col = "pink",
        border = NA)

legend("topleft",
       legend = c("Likes","Shares","Comments"),
       fill = c("lightblue","lightgreen","pink"))

#=========================================
# Task 4: Save Dataset for Tableau
#=========================================

write.csv(website, "website_traffic.csv", row.names = FALSE)

cat("\nDataset saved as website_traffic.csv\n")
cat("Import this file into Tableau.\n")
cat("Create a Line Chart and Bar Chart, then add both to a Dashboard.\n")
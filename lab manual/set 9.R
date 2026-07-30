#=========================================
# SET 9 : Survey Responses Analysis
#=========================================

# Create Dataset
survey <- data.frame(
  SurveyID = c(1,2,3),
  Question1 = c("A","B","C"),
  Question2 = c("B","A","A"),
  Question3 = c("C","D","B")
)

print(survey)

#=========================================
# Task 1 : Grouped Bar Chart
#=========================================

q1 <- table(survey$Question1)

barplot(q1,
        col=c("red","blue","green"),
        main="Distribution of Question 1 Responses",
        xlab="Answer",
        ylab="Frequency",
        beside=TRUE)

#=========================================
# Task 2 : Stacked Bar Chart
#=========================================

data <- rbind(
  table(survey$Question1),
  table(survey$Question2),
  table(survey$Question3)
)

rownames(data) <- c("Question1","Question2","Question3")

barplot(data,
        col=rainbow(ncol(data)),
        main="Survey Responses",
        xlab="Questions",
        ylab="Frequency",
        legend=colnames(data))

#=========================================
# Task 3 : Table
#=========================================

cat("\nSurvey Response Table\n")
print(survey)

#=========================================
# Task 4 : Save CSV for Tableau
#=========================================

write.csv(survey,
          "Survey_Responses.csv",
          row.names=FALSE)

cat("\nSurvey_Responses.csv saved successfully.\n")
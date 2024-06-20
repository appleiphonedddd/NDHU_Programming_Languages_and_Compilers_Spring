# Read the CSV files
fees <- read.csv("HW2-Fees.csv", stringsAsFactors = FALSE)
student_main <- read.csv("HW2-Student-Main.csv", stringsAsFactors = FALSE)
student_payment <- read.csv("HW2-Student-Payment.csv", stringsAsFactors = FALSE)

# Clean the 'Amount' column in fees and student_payment dataframes
fees$Amount <- as.numeric(gsub(",", "", fees$Amount))
student_payment$Amount <- as.numeric(gsub(",", "", student_payment$Amount))

# Merge the dataframes
student_fees <- merge(student_main, fees, by.x = "Payment.Type", by.y = "Payment.Type")
student_fees_payment <- merge(student_fees, student_payment, by.x = "Student.ID", by.y = "Student.ID", all.x = TRUE)

# Calculate the amount short
student_fees_payment$Amount.Short <- student_fees_payment$Amount.x - ifelse(is.na(student_fees_payment$Amount.y), 0, student_fees_payment$Amount.y)

# Filter students who did not pay the required fees
students_not_paid <- subset(student_fees_payment, Amount.Short > 0)

# Display the result
students_not_paid <- students_not_paid[, c("Student.ID", "Name", "Amount.Short")]
print(students_not_paid)

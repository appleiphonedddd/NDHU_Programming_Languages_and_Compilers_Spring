# Load the CSV file
student_payment <- read.csv("HW2-Student-Payment.csv", stringsAsFactors = FALSE)

# Clean the "Amount" column
student_payment$Amount <- gsub(",", "", student_payment$Amount)  # Remove commas
student_payment$Amount <- as.numeric(student_payment$Amount)     # Convert to numeric

# Calculate the total amount received
total_amount_received <- sum(student_payment$Amount, na.rm = TRUE)

# Print the total amount received
print(total_amount_received)

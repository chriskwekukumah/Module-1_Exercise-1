# Load the dataset into your environment
data(mtcars)

# View the first 6 rows
head(mtcars)

renv::install()
renv::update()
install.packages("ggplot2")
summary()
is.na()
sum(is.na(mtcars))
colSums(is.na(mtcars))
colSums(is.na(mtcars))
clean_data <- na.omit(mtcars)
# Create a new column 'weight_lbs' by multiplying 'wt' by 1000
mtcars$weight_lbs <- mtcars$wt * 1000

# View the first few rows to see your new column at the end
head(mtcars)
# Normalize 'mpg' and save it as a new column
mtcars$mpg_norm <- (mtcars$mpg - min(mtcars$mpg)) / (max(mtcars$mpg) - min(mtcars$mpg))

# Check the summary to see that the min is 0 and max is 1
summary(mtcars$mpg_norm)
# Create a simple table for your new columns
stats_table <- data.frame(
  Mean = colMeans(mtcars[, c("weight_lbs", "mpg_norm")]),
  Max  = sapply(mtcars[, c("weight_lbs", "mpg_norm")], max)
)

print(stats_table)
library(ggplot2)
# 1. Create the plot
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 2, fill = "steelblue", color = "white") +
  # 2. Customize (Task 2)
  labs(title = "Distribution of Fuel Efficiency",
       x = "Miles Per Gallon (mpg)",
       y = "Number of Cars") +
  theme_minimal()
# 1. Create the plot
ggplot(mtcars, aes(x = wt, y = hp)) +
  geom_point(color = "red", size = 3) +
  # Add a trend line to see the correlation
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  # 2. Customize (Task 2)
  labs(title = "Correlation: Horsepower vs. Vehicle Weight",
       x = "Weight (1000 lbs)",
       y = "Gross Horsepower") +
  theme_light()

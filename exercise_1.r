data <- read.csv("./data/listings.csv")

# determine the data type of all variables
sapply(data, class)
# print out the datatypes in a nice format
print(paste("The data types are:", paste(sapply(data, class), collapse = ", ")))

# determine the number of observations
nrow(data)
# determine the number of variables
ncol(data)

# What is the average price of a listing in the dataset?
data$price_num <- as.numeric(gsub("\\$", "", data$price))

price <- data$price_num
average_price <- mean(price, na.rm = TRUE)
print("Average price in USD:")
average_price

hist(price,
    main = "Price Distribution",
    xlab = "Price in USD",
    ylab = "Frequency",
    col = "#7272e2"
)


# What is the average host response rate?
data$host_response_rate_num <- as.numeric(gsub(
    "%", "",
    data$host_response_rate
))
average_response_time <- mean(data$host_response_rate_num, na.rm = TRUE)
print("Average response time in minutes:")
average_response_time

boxplot(data$host_response_rate_num,
    main = "Host Response Rate Distribution",
    xlab = "Host Response Rate",
    ylab = "Response time in minutes",
    col = "#7272e2"
)

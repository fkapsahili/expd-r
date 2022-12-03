data <- read.csv("./data/listings.csv")

# determine the data type of all variables
sapply(data, class)
table(sapply(data, class))

# determine the number of observations
nrow(data)
# determine the number of variables
ncol(data)

# What is the highest and mean price of a listing in the dataset?
data$price_num <- as.numeric(gsub("\\$", "", data$price))

price <- data$price_num
average_price <- mean(price, na.rm = TRUE)
max_price <- max(price, na.rm = TRUE)

print("Average price in USD:")
average_price

print("Maximum price in USD:")
max_price

hist(price,
    main = "Price Distribution",
    xlab = "Price in USD",
    ylab = "Frequency",
    col = "#7272e2"
)

# What is the host response rate for all room types?
data$host_response_rate_num <- as.numeric(gsub(
    "%", "",
    data$host_response_rate
))

boxplot(data$host_response_rate_num ~ data$room_type,
    main = "Host Response Rate Distribution",
    xlab = "Room Type",
    ylab = "Response time in minutes",
    col = "#7272e2"
)

avg_response_time_by_room_type <- aggregate(
    data$host_response_rate_num,
    by = list(data$room_type),
    FUN = mean,
    na.rm = TRUE
)

print("Average response time by room type:")
avg_response_time_by_room_type

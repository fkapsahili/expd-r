library(ggplot2)
library(dplyr)

data <- read.csv("./data/listings.csv")

data$price_num <- as.numeric(gsub("\\$", "", data$price))

data_sample_1000 <- data[sample(nrow(data), 1000), ]

ggplot(data_sample_1000, aes(
    x = host_location, y = price_num,
    color = host_is_superhost,
    shape = host_identity_verified
)) +
    geom_point(size = 3, alpha = .6) +
    labs(title = "Price by host location") +
    theme(
        axis.text.x = element_text(angle = 90)
    )

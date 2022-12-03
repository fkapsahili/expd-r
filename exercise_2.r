library(ggplot2)
library(dplyr)

data <- read.csv("./data/listings.csv")

data_sample_100 <- data[sample(nrow(data), 75), ]

bedrooms_data <- data_sample_100 %>%
    group_by(room_type) %>%
    summarize(mean_bedrooms = mean(bedrooms, na.rm = TRUE))

ggplot(bedrooms_data, aes(x = room_type, y = mean_bedrooms)) +
    geom_bar(stat = "identity", fill = "cornflowerblue") +
    labs(
        title = "Average number of bedrooms by room type",
        x = "Room Type",
        y = "Average number of bedrooms"
    )


ggplot(data_sample_100, aes(x = host_location, fill = room_type)) +
    geom_bar(position = "stack") +
    labs(
        title = "Host Location vs. Room Type",
        x = "Host Location",
        y = "Room Type"
    )

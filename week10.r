library(readr)
data <- read.csv("./data/private-unfall-versicherung.csv", sep = ";")
head(data)

mean(data$Schaden, na.rm = TRUE)
data <- read_delim("./data/private-unfall-versicherung.csv", delim = ";")
mean(data$Schaden, na.rm = TRUE)

sum(!is.na(data$Schaden))
dim(data)
nrow(data)
length(data$Schaden)
table(data$Typ)

hist(data$Schaden, nclass = sqrt(length(data$Schaden)), col = "#7272e2")
range(data$Schaden)

v_sel <- data$Schaden <= 100000
sum(v_sel)
hist(data$Schaden[v_sel])
range(data$Schaden[v_sel])

data$log_schaeden <- log(data$Schaden)
hist(data$log_schaeden)
median(data$Schaden, na.rm = TRUE)
mean(data$Schaden)
mean(data$log_schaeden)
median(data$log_schaeden)
log(median(data$Schaden))

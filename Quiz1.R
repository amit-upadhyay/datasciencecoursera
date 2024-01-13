data <- read.csv("quiz1_data/hw1_data.csv")
data

data[1:2,]

dim(data)

data[152:153,]

data[47,"Ozone"]

table(is.na(data$Ozone))

mean(data$Ozone[!is.na(data$Ozone)])


sub <- data[data$Ozone > 31 & data$Temp >90,]
# sub <- sub[complete.cases(sub),]
mean(sub$Solar.R, na.rm = T)

mean(data[data$Month == 6,]$Temp)

max(data[data$Month == 5,]$Ozone,na.rm=T)



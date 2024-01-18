###############################################################################################

library(stringr)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url,"housing.csv")

d <- read.csv("housing.csv")

names(d)
strsplit(names(d),"wgtp")[123]

###############################################################################################

url1 <-  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url1,"gdp.csv")


d1 <- read.csv("gdp.csv",skip = 3,nrows = 195)
d1 <- d1[!is.na(d1$Ranking),]
head(d1)
d1$US.dollars. <- as.numeric(str_trim(gsub(',',"",d1$US.dollars.)))
d1$US.dollars.
mean(d1$US.dollars., na.rm = T)

grep("^United",d1$Economy)

###############################################################################################

url1 <-  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url1,"edu.csv")
d2 <- read.csv("edu.csv")
head(d2)
dim(d2)

d <- merge(d1,d2,by.x = "X",by.y = "CountryCode",all=FALSE)
head(d)
dim(d)

names(d)
table(grepl("Fiscal year end: June",d$Special.Notes))

###############################################################################################

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

library(lubridate)

d <- data.frame(Year = year(sampleTimes), Day = wday(sampleTimes, label = T))
table(d$Year)
table(d$Year,d$Day)

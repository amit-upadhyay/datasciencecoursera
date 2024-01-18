library(dplyr)


###############################################################################################
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url,"housing.csv")

d <- read.csv("housing.csv")

unique(d$ACR) # 3
unique(d$AGS) # 6

agricultureLogical <- d$ACR ==3 & d$AGS ==6
which(agricultureLogical) 


###############################################################################################

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(url,"jeff.jpg")
install.packages("jpeg")
library(jpeg)

img <- readJPEG("getdata_jeff.jpg",native=TRUE)
quantile(img,c(0.3,0.8))

###############################################################################################

url1 <-  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url1,"gdp.csv")

url1 <-  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url1,"edu.csv")

d1 <- read.csv("gdp.csv",skip = 3,nrows = 195)
d1 <- d1[!is.na(d1$Ranking),]

head(d1)
tail(d1)
dim(d1)

d2 <- read.csv("edu.csv")
head(d2)
dim(d2)

d <- merge(d1,d2,by.x = "X",by.y = "CountryCode",all=FALSE)
head(d)
dim(d)
unique(d$X)

table(d1$X %in% d2$CountryCode)

tail(d %>% arrange(desc(Ranking)))
head(d %>% arrange(desc(Ranking)),13)

###############################################################################################

unique(d$Income.Group)
d %>% group_by(Income.Group) %>% summarize(averageGDP = mean(Ranking))

###############################################################################################

top38 <- d[d$Ranking <=38,] 
table(top38$Income.Group)

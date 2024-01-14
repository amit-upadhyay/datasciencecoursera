url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url,"communities.csv")

d <- read.csv("communities.csv")
head(d)
table(d$VAL ==24)


url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url,"ngap.xlsx")
library(xlsx)
dat <- read.xlsx("NGAP2.xlsx", sheetIndex = 1,rowIndex = 18:23, colIndex = 7:15)

sum(dat$Zip*dat$Ext,na.rm=T)


url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
library(XML)
doc <- xmlTreeParse(url, useInternal = TRUE)
rootNode <- xmlRoot(doc)
zipcodes <- xpathSApply(rootNode,"//zipcode",xmlValue)
table(zipcodes==21231)


library(data.table)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url,"idaho.csv")
DT <- fread("idaho.csv")

DT[,mean(pwgtp15),by=SEX]
system.time(DT[,mean(pwgtp15),by=SEX])

mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)

tapply(DT$pwgtp15,DT$SEX,mean)

sapply(split(DT$pwgtp15,DT$SEX),mean)







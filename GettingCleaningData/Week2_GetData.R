##################################################################################################

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url,"acs.csv")
df <- read.csv("acs.csv")
library(sqldf)

##################################################################################################

url_link <- "https://biostat.jhsph.edu/~jleek/contact.html"
con = url(url_link)
htmlCode = readLines(con)
close(con)

nchar(htmlCode[10]) # 45
nchar(htmlCode[20]) # 7
nchar(htmlCode[30]) # 31
nchar(htmlCode[100]) # 25

##################################################################################################

install.packages("foreign")
library(foreign)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for","test.for")

df <- read.fwf("test.for",c(10,9,4,9,4,9,4,9,4),skip = 4)
head(df)
sum(df[,4])

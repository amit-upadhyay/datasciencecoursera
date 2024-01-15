####################################################################################################################################
library(RMySQL)

# connect to UCSC Genome Browser database

ucscDb <- dbConnect(MySQL(), user = "genome",
                    host = "genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb,"show databases;");dbDisconnect(ucscDb);
result


# Connect hg19 and list tables

hg19 <- dbConnect(MySQL(), user = "genome", db = "hg19",
                    host = "genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]


dbListFields(hg19,"affyU133Plus2")

dbGetQuery(hg19, " select count(*) from affyU133Plus2")

affyData <- dbReadTable(hg19,"affyU133Plus2")
head(affyData)

query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query); quantile(affyMis$misMatches)
affyMisSmall <- fetch(query,n=10); dbClearResult(query);
dim(affyMisSmall)

dbDisconnect(hg19)

####################################################################################################################################

library(rhdf5)

created <- h5createFile("example.h5")
created = h5createGroup("example.h5","foo")
A = matrix(1:10,nr=5,nc=2)
h5write(A,"example.h5","foo/A") # error chunk size related
h5ls("example.h5")

df = data.frame(1L:5L,seq(0,1,length.out = 5),c("ab","cde","fghi","a","s"), stringsAsFactors = FALSE)
h5write(df,"example.h5","test_df")
h5ls("example.h5")

readA = h5read("example.h5","foo/A")
readB = h5read("example.h5","test_df")
readB

####################################################################################################################################
con = url("http://scholar.google.com")
htmlCode = readLines(con)
close(con)
htmlCode


library(XML)
url <- "http://scholar.google.com"
html <- htmlTreeParse(url, useInternalNodes = T)
xpathSApply(html,"//title",xmlValue)
xpathSApply(html,"//td[@id='col-citedby']",xmlValue)


library(httr); html2 = GET(url)
content2 = content(html2,as="text")
parsedHtml = htmlParse(content2,asText = TRUE)
xpathSApply(parsedHtml,"//title",xmlValue)

####################################################################################################################################


myapp = oauth_app("twitter", key = "ConsumerKey",secret = "ConsumerSecret")

sig = sign_oauth1.0(myapp, token = "Token",token_secret = "TokenSecret")

homeTL = GET("https://api.com/home.json", sig)

json1 = content(homeTL)

json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:14]







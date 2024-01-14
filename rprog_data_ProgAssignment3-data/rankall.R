

rankall <- function(outcome,num="best"){
  
  df <- data.frame(hospital = character(),state=character())
  
  data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  
  if(!outcome %in% c("heart attack","heart failure","pneumonia")){
    stop("invalid outcome")
  }
  
  index <- NA
  
  if(outcome == "heart attack"){index <- 11}
  else if(outcome == "heart failure") {index <- 17}
  else if(outcome == "pneumonia") {index <- 23}
  
  sapply(split(data,data$State), function(x){
    d <- x[x[,index] != "Not Available", c(2,index,7)]
    d[,2] <- as.numeric(d[,2])
    
    d <- d[order(d[,2],d[,1]),]
    d$Rank <- 1:nrow(d)
    
    if(num == "best"){num = 1} 
    else if(num == "worst"){ num = nrow(d)}
    
    df <<- rbind(df,c(d[num,1],unique(d$State)))
  })
  colnames(df) <- c("hospital","state")
  df
}

head(rankall("heart attack", 20), 10)

tail(rankall("pneumonia", "worst"), 3)

tail(rankall("heart failure"), 10)

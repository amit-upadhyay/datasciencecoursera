rankhospital <- function(state, outcome,num="best"){
  
  data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  
  if(!state %in% data$State){
    stop("invalid state")
  }
  
  if(!outcome %in% c("heart attack","heart failure","pneumonia")){
    stop("invalid outcome")
  }
  
  index <- NA
  
  if(outcome == "heart attack"){index <- 11}
  else if(outcome == "heart failure") {index <- 17}
  else if(outcome == "pneumonia") {index <- 23}
  
  d <- data[data$State == state & data[,index] != "Not Available", c(2,index)]
  d[,2] <- as.numeric(d[,2])
  
  d <- d[order(d[,2],d[,1]),]
  d$Rank <- 1:nrow(d)
  
  if(num == "best"){num = 1} 
  else if(num == "worst"){ num = nrow(d)}
  d[num,1]
}

rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)

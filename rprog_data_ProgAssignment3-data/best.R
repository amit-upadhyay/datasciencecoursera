best <- function(state,outcome){
  
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
  min_mort <- min(as.numeric(d[,2]), na.rm = T)
  d <- d[d[,2] == min_mort,]
  d <- d[order(d$Hospital.Name),]
  d[1,1]
}

best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack")
best("NY", "hert attack")

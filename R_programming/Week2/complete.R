complete <- function(directory, id = 1:332) {
  
  df <- data.frame(id=character(),nobs=numeric())
  
  for (i in id){
    
    if(i < 10){
      d <- read.csv(paste0(directory,"/00",as.character(i),".csv"))
    }
    else if(i < 100){
      d <- read.csv(paste0(directory,"/0",as.character(i),".csv"))
    }
    else{
      d <- read.csv(paste0(directory,"/",as.character(i),".csv"))
    }
    num <- dim(d[complete.cases(d),])[1]
    df <- rbind(df,c(i,num))
  }
  names(df) <- c("id","nobs")
  df
}
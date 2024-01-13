corr <- function(directory, threshold = 0) {
  
  df <- complete(directory)
  df <- df[df$nobs > threshold,]
  
  cor_vec <- vector()
  
  for (i in df$id){
    
    if(i < 10){
      d <- read.csv(paste0(directory,"/00",as.character(i),".csv"))
    }
    else if(i < 100){
      d <- read.csv(paste0(directory,"/0",as.character(i),".csv"))
    }
    else{
      d <- read.csv(paste0(directory,"/",as.character(i),".csv"))
    }
    
    d <- d[complete.cases(d),]
    
    cor_vec <- c(cor_vec, cor(d$sulfate,d$nitrate))
  } 
  
  cor_vec
}  
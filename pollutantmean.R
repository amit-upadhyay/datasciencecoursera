pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  all_pollutant <- vector()
  
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
    
    
    all_pollutant = c(all_pollutant,d[,pollutant])
  }
  
  mean(all_pollutant,na.rm=T)
}

# pollutantmean("specdata", "sulfate", 1:10)

# pollutantmean("specdata", "nitrate", 70:72)

# pollutantmean("specdata", "nitrate", 23)
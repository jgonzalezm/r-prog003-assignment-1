files <- getfileinfo(directory)
for (i in id){
        filename<- files[files$monitorid ==i, 1]
        filepath <- paste (directory,"/" , filename, sep ="")
        data <- read.csv(file = filepath, header =TRUE)
        colNames <- colnames (data)
        pollmean <- colMeans (data[data$pollutant], na.rm = TRUE)
        colindex <- match (tolower(pollutant) , tolower(colNames))
        output <- c(output, data[,colindex]) 
}



files <- getfileinfo(directory)
for (i in id){
        filename<- files[files$monitorid ==i, 1]
        filepath <- paste (directory,"/" , filename, sep ="")
        data <- read.csv(file = filepath, header =TRUE)
        colNames <- colnames (data)
        pollmean <- colMeans (data[data$pollutant], na.rm = TRUE)
        colindex <- match (tolower(pollutant) , tolower(colNames))
        pollmeans <- mean(data[,colindex], na.rm = TRUE)
        output <- 
}
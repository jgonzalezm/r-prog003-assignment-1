pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        files <- getfileinfo(directory)
        output <- NULL 
        for (i in id){
                filename<- files[files$monitorid ==i, 1]
                filepath <- paste (directory,"/" , filename, sep ="")
                data <- read.csv(file = filepath, header =TRUE)
                colNames <- colnames (data)
                pollmean <- colMeans (data[data$pollutant], na.rm = TRUE)
                colindex <- match (tolower(pollutant) , tolower(colNames))
                output <- c(output, data[,colindex]) 
                outputmean <- mean(output, na.rm = TRUE)
        }
        outputmean
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)        
        
        
        
}

getfileinfo <- function (directory){
        filenames <- list.files (path = directory)
        monitorid <- as.numeric(substr(filenames,1,3))
        files <- data.frame(filenames, monitorid, stringsAsFactors = FALSE)
        names(files) <- c("filename","monitorid")
        return(files)     
}
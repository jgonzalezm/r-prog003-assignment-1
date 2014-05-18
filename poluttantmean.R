pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        filenames <- list.files (path = directory)
        filecount <- length(filenames)
        for (i in id){
                filename<- filenames[i]
                filepath <- paste (directory , filename, sep ="")
                data <- read.csv(file = filepath)
                print(paste("File", filename, "loaded"))
        }
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


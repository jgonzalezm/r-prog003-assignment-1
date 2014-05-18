source ("pollutantmean.R")
complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        files <- getfileinfo(directory)
        output <- data.frame (id = numeric(length(id)) , nobs = numeric(length(id)))
        j<-0

        for (i in id){
                j<- j+1
                filename<- files[files$monitorid ==i, 1]
                filepath <- paste (directory,"/" , filename, sep ="")
                data <- read.csv(file = filepath, header =TRUE)
                compcase<- sum(complete.cases(data))
                output$id [j]<- i
                output$nobs [j]<- compcase
        }
              
        output
        
        
        
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1 117
        ## 2 1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
}
source("complete.R")
source("pollutantmean.R")


corr <- function(directory, threshold = 0) {
        files<- getfileinfo(directory)
        id<- 1:nrow(files)
        numcompletes <- complete(directory, id)
        meetsthresh <- numcompletes[numcompletes$nobs >= threshold, ]
        numfiles <- nrow(meetsthresh)
        if (numfiles > 0){
                cr <- vector (mode = "numeric", length = numfiles)
                useid <- meetsthresh[,1]
                j<- 0
                ##output <- data.frame(Min=numeric(numfiles), frstQuartile=numeric(numfiles),  
                ##                     Median=numeric(numfiles),
                ##                     Mean=numeric(numfiles), thrdQuartile=numeric(numfiles),
                ##                     Max=numeric(numfiles))
                for (i in useid){
                        j <- j+1
                        filename<- files[files$monitorid == i , 1]
                        filepath <- paste (directory,"/" , filename, sep ="")
                        data <- read.csv(file = filepath, header =TRUE)
                        compcase<- na.omit(data)
                        cr[j]<- cor(compcase[,2], compcase[,3])
                        }
                cr
        }
        else{
                cr <- vector(mode = "numeric", length = 0)
                cr
        }
        
}
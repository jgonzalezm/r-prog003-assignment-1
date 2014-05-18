filenames <- list.files (path = directory)
filecount <- length(filenames)
for (i in id){
        filename<- paste(sprintf("%03d", i), ".csv", sep = ""  )
        filepath <- paste (directory , filename, sep ="")
        data <- read.csv(file = filepath)
        print(paste("File", filename, "loaded"))
        }
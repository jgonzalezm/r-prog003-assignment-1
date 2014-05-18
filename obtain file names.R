filenames <- list.files (path = "~/GitHub/Coursera/r-prog003-assignment-1/specdata")
monitorid <- as.numeric(substr(filenames,1,3))
files <- data.frame(filenames, monitorid)
names(files) <- c("filename","monitorid")


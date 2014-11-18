#
# This script request for downloading the original dataset
# or the location where the user has the data


base_dir <- function () {

cat("The Human Activity Recognition Using Smartphones Dataset, do you need to download? \n")
download <- "x"
while ( sum(toupper(download) == c("Y","N","C")) == 0) {
        cat("Type [Y]es, [N]o or [C]ancel")
        download <- scan(what=character(),nmax=1,quiet=TRUE)
}

dir <- ""

if (toupper(download) != "C") {

        if (toupper(download) == "Y") {
                cat("Downloading....")
                url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                download.file(url,dest="HARUS.zip")
                unzip(zipfile = "HARUS.zip")
                dir = "UCI HAR Dataset"
        } else {
                cat("Type the directory where data is located ? \n")  
                while (dir == "") {
                        dir <- scan(what=character(),nmax=1,sep = "\n",quiet=TRUE)
                        if (!file.exists(dir)) {
                                cat("Try again...")
                        }
                }
        }
}

dir

}

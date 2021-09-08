#' Parse a batch file and return the data as dataframe.
#'
#' @param file The name of the xlsx batch file.
#' @return A dataframe with the contents of the batch file.
#'
#' @export
#' @author Daniel Montemayor, \email{montemayord2@uthscsa.edu}
load_batch_file <- function(file){
    #load file as dataframe
    df <- xlsx::read.xlsx(file,sheetIndex=1,header=FALSE)

    #find first row with cols 4 =  "Peak Name
    startRow <- which(xlsx::read.xlsx(file,sheetIndex=1,header=FALSE)[,4]==
                      "Peak Name")+1

    #read xlsx and use labels in startRow as variable names
    xlsx::read.xlsx(file,sheetIndex=1,startRow=startRow,header=TRUE)
}

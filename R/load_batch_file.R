#' Parse a batch file and return the data as dataframe.
#'
#' @param file The name of the xlsx batch file.
#' @return A dataframe with the contents of the batch file.
#' @examples
#' load_batch_file(file="somebatchfile.xlsx")
#'
#' @export
#' @author Daniel Montemayor, \email{montemayord2@uthscsa.edu}
load_batch_file <- function(file){
    read.xlsx(file,sheetIndex=1,header=TRUE)
}

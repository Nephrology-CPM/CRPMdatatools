#' Initialize a workbook
#'
#' @param file The name of the xlsx batch file.
#' @return A new xlsx workbook with no sheets.
#'
#' @export
#' @author Daniel Montemayor, \email{montemayord2@uthscsa.edu}
init_workbook <- function(file){
  xlsx::createWorkbook(type="xlsm")
}

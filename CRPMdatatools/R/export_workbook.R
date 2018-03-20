#' Export gcms analysis workbook.
#'
#' @return A xlsx workbook with analysis specified.
#'
#' @export
#' @author Daniel Montemayor, \email{montemayord2@uthscsa.edu}
export_workbook <- function(){
  return(xlsx::createWorkbook(type="xlsx"))
}

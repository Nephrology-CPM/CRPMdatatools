#' Find sample IDs in gcms batch dataframe.
#'
#' @return An array of the unique sample IDs found.
#'
#' @export
#' @author Daniel Montemayor, \email{montemayord2@uthscsa.edu}
get_sampleIDs <- function(df){
  ids<-names(table(factor(df$Data.File)))
  return(grep("^[^0-9.]", ids, value=TRUE))
  #gsub removes anything after first underscore
  #return(grep("[^0-9.]",gsub("_.*","",ids), value=TRUE))
}

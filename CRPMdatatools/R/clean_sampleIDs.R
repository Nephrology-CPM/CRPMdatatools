#' Clean sample ID names in gcms batch dataframe.
#'
#' @param  The dataframe result of load_batch_file
#' @return An array of cleaned sample IDs.
#'
#' @export
#' @author Daniel Montemayor, \email{montemayord2@uthscsa.edu}
clean_sampleIDs <- function(df){

  #remove calibration data files with names that begin with numbers
  ids <- df$Data.File[grep("^[^0-9.]", df$Data.File)]

  #return list of arrays with elements that split data.files by underscore
  sampleID.l <- strsplit(as.character(ids), split = "_")

  #reverse order of arrays in lists (the last two elements are DATE and TIME data)
  #then return arrays without the first two elements (DATE and TIME elements)
  #then reverse the array order again back to original order
  #then concatenate remaining array elements with an underscore
  #(arrays now contain only one string element)
  #unlist the list of arrays and coerce these string elements into a new array
  return(array(unlist(lapply(sampleID.l,
                function(x){paste(rev(rev(x)[-(1:2)]),sep='',collapse='_')}))))
}

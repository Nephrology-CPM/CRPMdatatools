#' build gcms collect table
#'
#' @param  The dataframe result of load_batch_file
#' @return A dataframe with gcms data collected from batch file.
#'
#' @export
#' @author Daniel Montemayor, \email{montemayord2@uthscsa.edu}
get_collect_table <- function(df){

  #get sample IDs
  sampleIDs <- get_sampleIDs(df)

  #get metabolite names
  metabolite_names <- get_metabolite_names(df)

  #instantiate output
  output <- data.frame(matrix(ncol=length(sampleIDs),nrow=length(metabolite_names)))

  #assign row and column names
  rownames(output) <- metabolite_names
  colnames(output) <- sampleIDs

  #loop over elements in df
  #get metabolite name and sample id
  #find corresponding matrix element in output

  return(output)
}

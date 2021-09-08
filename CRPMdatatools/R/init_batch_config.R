#' Get default gcms batch analysis configuration.
#'
#' @param  The dataframe result of load_batch_file
#' @return A list determining the batch configuration.
#'
#' @export
#' @author Daniel Montemayor, \email{montemayord2@uthscsa.edu}
init_batch_config <- function(df){
  return(list(
              compounds=get_metabolite_names(df),
              sampleIDs=unique(clean_sampleIDs(df)),
              allowed_percent_missing=.00
              )
        )
}

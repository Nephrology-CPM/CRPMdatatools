#' Remove rows in gcms collect table with no fluctuation.
#'
#' @param  df The dataframe result of get_collect_table
#' @param  config the analysis configuration such as result of init_batch_config
#' @return A dataframe with removed rows.
#'
#' @export
#' @author Daniel Montemayor, \email{montemayord2@uthscsa.edu}
clean_collect_table <- function(df,config){

  output <- df





  #save output
  write.csv(output, file = "batch_collect2.csv")

  return(output)
}
